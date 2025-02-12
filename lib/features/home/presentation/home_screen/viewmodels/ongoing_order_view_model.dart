import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/providers/location_provider.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/clear_ongoing_order_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/complete_order_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/get_order_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/set_order_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/update_driver_location_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/update_firebase_order_data_use_case.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@injectable
class OngoingOrderViewModel extends Cubit<OngoingOrderState> {
  final GetOrderUseCase _getOrderUseCase;
  StreamSubscription<Position>? _positonListener;
  final UpdateDriverLocationUseCase _updateDriverLocationUseCase;
  final UpdateFirebaseOrderDataUseCase _updateFirebaseOrderDataUseCase;
  final CompleteOrderUseCase _completeOrderUseCase;
  final ClearOngoingOrderUseCase _clearOngoingOrderUseCase;
  final SetOrderUseCase _setOrderUseCase;
  OngoingOrderViewModel(
      this._getOrderUseCase,
      this._updateDriverLocationUseCase,
      this._updateFirebaseOrderDataUseCase,
      this._setOrderUseCase,
      this._completeOrderUseCase,
      this._clearOngoingOrderUseCase)
      : super(InitialState());

  void doIntent(OngoingOrderIntent intent) {
    switch (intent) {
      case GetOngoingOrder():
        _getOrder();
        return;
      case UpdateOrderStatus():
        _updateStatus(intent.order);
        return;
    }
  }

  List<Widget> _generateGreenSteps(int count) {
    return List.generate(count, (index) {
      return Expanded(
        child: Container(
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      );
    });
  }

  List<Widget> _generateGreySteps(int count) {
    return List.generate(count, (index) {
      return Expanded(
        child: Container(
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      );
    });
  }

  Future<void> _startLocationStream(OrderEntity order) async {
    if (LocationProvider().positionStream == null) {
      await LocationProvider().startLocationStream();
    }
    _positonListener =
        LocationProvider().positionStream!.listen((Position position) {
      _updateDriverLocationUseCase.updateDriverLoc(
          order.id!, position.latitude, position.longitude);
    });
  }

  void _checkOrderStatus(
    OrderEntity order,
  ) {
    int stepCount = 0;
    String buttonText = "";
    switch (order.status) {
      case StringsManager.orderAcceptedStatus:
        stepCount = 1;
        buttonText = StringsManager.acceptedOrderBtn.tr();
        break;
      case StringsManager.orderArrivePickupStatus:
        stepCount = 2;
        buttonText = StringsManager.startDeliverBtn.tr();
        break;
      case StringsManager.orderDeliveringStatus:
        stepCount = 3;
        buttonText = StringsManager.arrivedOrderBtn.tr();
        break;
      case StringsManager.orderArriveUserStatus:
        stepCount = 4;
        buttonText = StringsManager.deliveredOrderBtn.tr();
        break;
      case StringsManager.orderCompletedStatus:
        stepCount = 5;
        buttonText = StringsManager.deliveredOrderBtn.tr();
        break;

      default:
    }

    List<Widget> steps = _generateGreenSteps(stepCount);
    steps.addAll(_generateGreySteps(5 - stepCount));
    emit(SuccessState(steps, buttonText, order));
  }

  Future<void> _updateStatus(OrderEntity order) async {
    switch (order.status) {
      case StringsManager.orderAcceptedStatus:
        order.status = StringsManager.orderArrivePickupStatus;
        break;
      case StringsManager.orderArrivePickupStatus:
        order.status = StringsManager.orderDeliveringStatus;
        break;
      case StringsManager.orderDeliveringStatus:
        order.status = StringsManager.orderArriveUserStatus;
        _positonListener?.cancel();
        _positonListener = null;
        break;
      case StringsManager.orderArriveUserStatus:
        order.status = StringsManager.orderCompletedStatus;
        break;
      default:
    }
    await _updateFirebaseOrderDataUseCase.updateOrderData(
        order.status!, order.id!);
    await _setOrderUseCase.setOngoingOrder(order);
    _checkOrderStatus(order);
    if (order.status == StringsManager.orderCompletedStatus) {
      await Future.delayed(const Duration(seconds: 5));
      final result = await _completeOrderUseCase.complete(order.id!);
      switch (result) {
        case Success<void>():
          final orderCleared =
              await _clearOngoingOrderUseCase.clearOngoingOrder();
          switch (orderCleared) {
            case Success<bool>():
              emit(OrderDeliveredState());

            case Fail<bool>():
              emit(ErrorState(orderCleared.exception!));
          }

          return;
        case Fail<void>():
          emit(ErrorState(result.exception!));
          return;
      }
    }
  }

  Future<void> _getOrder() async {
    emit(LoadingState());
    final result = await _getOrderUseCase.getOrder();
    switch (result) {
      case Success<OrderEntity>():
        _checkOrderStatus(result.data!);
        _startLocationStream(result.data!);
        return;
      case Fail<OrderEntity>():
        emit(ErrorState(result.exception!));
        return;
    }
  }
}

sealed class OngoingOrderState {}

class InitialState extends OngoingOrderState {}

class LoadingState extends OngoingOrderState {}

class SuccessState extends OngoingOrderState {
  final List<Widget> stepper;
  final String buttonText;
  final OrderEntity order;
  SuccessState(this.stepper, this.buttonText, this.order);
}

class OrderDeliveredState extends OngoingOrderState {}

class ErrorState extends OngoingOrderState {
  Exception error;
  ErrorState(this.error);
}

sealed class OngoingOrderIntent {}

class GetOngoingOrder extends OngoingOrderIntent {}

class UpdateOrderStatus extends OngoingOrderIntent {
  final OrderEntity order;
  UpdateOrderStatus(this.order);
}
