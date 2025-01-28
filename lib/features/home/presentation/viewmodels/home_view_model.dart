import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/check_order_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/get_pending_orders_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeViewModel extends Cubit<HomeScreenState> {
  final GetPendingOrdersUseCase _getPendingOrdersUseCase;
  final CheckOrderUseCase _checkOrderUseCase;
  List<OrderEntity> orders = [];
  HomeViewModel(this._getPendingOrdersUseCase, this._checkOrderUseCase)
      : super(InitialState());

  void doIntent(HomeScreenIntent intent) {
    switch (intent) {
      case GetOrdersIntent():
        _getOrders();
        return;
      case RejectOrderIntent():
        _rejectOrder(intent.id);
        return;
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
        break;
    }
    final result = await _getPendingOrdersUseCase.getPendingOrders();
    switch (result) {
      case Success<OrdersEntity>():
        orders = result.data!.orders!;
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
