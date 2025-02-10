import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/firebase_orders_response.dart/firebase_orders_response.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/start_order_response/start_order_response.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/check_firebase_orders_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/check_order_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/get_pending_orders_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/set_order_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/start_order_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/update_firebase_order_data_use_case.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeScreenState> {
  final GetPendingOrdersUseCase _getPendingOrdersUseCase;
  final CheckOrderUseCase _checkOrderUseCase;
  final SetOrderUseCase _setOrderUseCase;
  final StartOrderUseCase _startOrderUseCase;
  final CheckFirebaseOrdersUseCase _checkFirebaseOrdersUseCase;
  final UpdateFirebaseOrderDataUseCase _updateFirebaseOrderDataUseCase;
  List<OrderEntity> orders = [];
  HomeViewModel(
      this._getPendingOrdersUseCase,
      this._checkOrderUseCase,
      this._setOrderUseCase,
      this._startOrderUseCase,
      this._checkFirebaseOrdersUseCase,
      this._updateFirebaseOrderDataUseCase)
      : super(InitialState());

  void doIntent(HomeScreenIntent intent) {
    switch (intent) {
      case GetOrdersIntent():
        _getOrders();
        return;
      case RejectOrderIntent():
        _rejectOrder(intent.id);
        return;
      case AcceptOrderIntent():
        _acceptOrder(intent.order);
    }
  }

  Future<void> _completeOrderDataFromFirebase() async {
    final result = await _checkFirebaseOrdersUseCase.getFirebaseOrders();
    if (result is Success<FirebaseOrdersResponse>) {
      for (final order in result.data!.orders!) {
        for (final order2 in orders) {
          if (order.id == order2.id) {
            order2.user!.address = order.address;
            order2.user!.lat = order.lat;
            order2.user!.long = order.long;
          }
        }
      }
    }
  }

  Future<void> _getOrders() async {
    emit(LoadingState());
    final orderOngoing = await _checkOrderUseCase.checkOngoingOrder();
    switch (orderOngoing) {
      case Success<bool>():
        if (orderOngoing.data == true) {
          emit(OrderOngoingState());
          return;
        }
        break;
      case Fail<bool>():
        emit(ErrorState(orderOngoing.exception!));
    }
    final result = await _getPendingOrdersUseCase.getPendingOrders();
    switch (result) {
      case Success<OrdersEntity>():
        orders = result.data!.orders!;
        await _completeOrderDataFromFirebase();
        emit(SuccessState());
        return;
      case Fail<OrdersEntity>():
        emit(ErrorState(result.exception!));
        return;
    }
  }

  void _rejectOrder(String id) {
    emit(LoadingState());
    orders.removeWhere(
      (element) => element.id == id,
    );
    emit(SuccessState());
  }

  Future<void> _setLocalOrder(OrderEntity order) async {
    final result1 = await _setOrderUseCase.setOngoingOrder(order);
    switch (result1) {
      case Success<bool>():
        emit(OrderOngoingState());
      case Fail<bool>():
        emit(ErrorState(result1.exception!));
    }
  }

  Future<void> _acceptOrder(OrderEntity order) async {
    emit(LoadingState());
    order.status = StringsManager.orderAcceptedStatus;
    final result = await _startOrderUseCase.startOrder(order.id!);
    switch (result) {
      case Success<StartOrderResponse>():
        await _setLocalOrder(order);
        await _updateFirebaseOrderDataUseCase.updateOrderData(
            StringsManager.orderAcceptedStatus, order.id!);
        return;
      case Fail<StartOrderResponse>():
        emit(ErrorState(result.exception!));
        return;
    }
  }
}

sealed class HomeScreenState {}

class InitialState extends HomeScreenState {}

class LoadingState extends HomeScreenState {}

class OrderOngoingState extends HomeScreenState {}

class SuccessState extends HomeScreenState {}

class ErrorState extends HomeScreenState {
  final Exception error;
  ErrorState(this.error);
}

sealed class HomeScreenIntent {}

class GetOrdersIntent extends HomeScreenIntent {}

class RejectOrderIntent extends HomeScreenIntent {
  final String id;
  RejectOrderIntent(this.id);
}

class AcceptOrderIntent extends HomeScreenIntent {
  final OrderEntity order;
  AcceptOrderIntent(this.order);
}
