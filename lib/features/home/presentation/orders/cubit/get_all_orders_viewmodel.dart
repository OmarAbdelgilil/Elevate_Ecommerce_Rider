import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/order_respose2/order_response2/order_response2.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/get_all_orders_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersViewModel extends Cubit<OrdersState> {
  final GetAllOrdersUseCase _getAllOrdersUseCase;
  List<Orders> _allOrders = [];

  OrdersViewModel(this._getAllOrdersUseCase) : super(InitialState());

  void doIntent(OrdersIntent intent) {
    switch (intent) {
      case LoadOrdersIntent():
        _loadOrders();
        break;
    }
  }

  Future<void> _loadOrders() async {
    emit(LoadingState());

    final result = await _getAllOrdersUseCase.getAllOrders();

    switch (result) {
      case Success<OrderResponse2?>():
        if (result.data?.orders != null) {
          _allOrders = result.data!.orders ?? [];

          print('Total orders loaded: ${_allOrders.length}');
          _allOrders.forEach((order) {
            print(
                'Order ${order.order?.orderNumber} state: ${order.order?.state}');
          });

          for (var i = 0; i < _allOrders.length; i++) {
            if (i % 3 == 0) {
              _allOrders[i].order?.state = 'completed';
            } else if (i % 3 == 1) {
              _allOrders[i].order?.state = 'cancelled';
            }
          }

          final completedCount = _countOrdersByState('completed');
          final cancelledCount = _countOrdersByState('cancelled');

          print('Completed count: $completedCount');
          print('Cancelled count: $cancelledCount');

          emit(SuccessState(
            orders: _allOrders,
            completedCount: completedCount,
            cancelledCount: cancelledCount,
          ));
        } else {
          emit(ErrorState(exception: Exception('No orders found')));
        }
      case Fail<OrderResponse2?>():
        emit(ErrorState(exception: result.exception));
    }
  }

  int _countOrdersByState(String state) {
    final count = _allOrders.where((order) {
      final orderState = order.order?.state?.toLowerCase() ?? '';
      final matches = orderState == state.toLowerCase();
      print(
          'Checking order ${order.order?.orderNumber}: state=$orderState, matches=$matches');
      return matches;
    }).length;

    print('Count for $state: $count');
    return count;
  }

  int get completedOrdersCount {
    if (state is SuccessState) {
      final count = (state as SuccessState).completedCount;
      print('Getting completed count: $count');
      return count;
    }
    return 0;
  }

  int get cancelledOrdersCount {
    if (state is SuccessState) {
      final count = (state as SuccessState).cancelledCount;
      print('Getting cancelled count: $count');
      return count;
    }
    return 0;
  }

  List<Orders> get orders {
    if (state is SuccessState) {
      return (state as SuccessState).orders ?? [];
    }
    return [];
  }
}

sealed class OrdersState {}

class InitialState extends OrdersState {}

class LoadingState extends OrdersState {}

class SuccessState extends OrdersState {
  final List<Orders>? orders;
  final int completedCount;
  final int cancelledCount;

  SuccessState({
    this.orders,
    this.completedCount = 0,
    this.cancelledCount = 0,
  });
}

class ErrorState extends OrdersState {
  final Exception? exception;
  ErrorState({this.exception});
}

sealed class OrdersIntent {}

class LoadOrdersIntent extends OrdersIntent {}
