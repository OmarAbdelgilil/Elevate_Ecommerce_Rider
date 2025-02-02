import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/get_order_use_case.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OngoingOrderViewModel extends Cubit<OngoingOrderState> {
  final GetOrderUseCase _getOrderUseCase;

  OngoingOrderViewModel(this._getOrderUseCase) : super(InitialState());

  void doIntent(OngoingOrderIntent intent) {
    switch (intent) {
      case GetOngoingOrder():
        _getOrder();
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

  void _checkOrderStatus(OrderEntity order) {
    int stepCount = 0;
    String buttonText = "";
    if (order.status == StringsManager.orderAcceptedStatus) {
      stepCount = 1;
      buttonText = StringsManager.acceptedOrderBtn;
    }
    List<Widget> steps = _generateGreenSteps(stepCount);
    steps.addAll(_generateGreySteps(5 - stepCount));
    emit(SuccessState(steps, buttonText, order));
  }

  Future<void> _getOrder() async {
    emit(LoadingState());
    final result = await _getOrderUseCase.getOrder();
    switch (result) {
      case Success<OrderEntity>():
        _checkOrderStatus(result.data!);
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

class ErrorState extends OngoingOrderState {
  Exception error;
  ErrorState(this.error);
}

sealed class OngoingOrderIntent {}

class GetOngoingOrder extends OngoingOrderIntent {}
