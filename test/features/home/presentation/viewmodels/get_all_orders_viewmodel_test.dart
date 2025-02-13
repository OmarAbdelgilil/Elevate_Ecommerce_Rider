import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/order_respose2/order_response2/order_response2.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/get_all_orders_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/orders/cubit/get_all_orders_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_orders_viewmodel_test.mocks.dart';

@GenerateMocks([GetAllOrdersUseCase])
void main() {
  late OrdersViewModel viewModel;
  late MockGetAllOrdersUseCase mockGetAllOrdersUseCase;

  setUp(() {
    mockGetAllOrdersUseCase = MockGetAllOrdersUseCase();

    provideDummy<Result<OrderResponse2?>>(Success(OrderResponse2(orders: [])));
    provideDummy<Result<OrderResponse2?>>(Fail(Exception('Error')));

    viewModel = OrdersViewModel(mockGetAllOrdersUseCase);
  });

  group('OrdersViewModel test', () {
    test('Initial state is InitialState', () {
      expect(viewModel.state, isA<InitialState>());
    });

    test('LoadOrdersIntent - emits LoadingState and SuccessState on success',
        () async {
      final orderResponse = OrderResponse2(orders: [
        Orders(order: Order(orderNumber: '123', state: 'pending')),
        Orders(order: Order(orderNumber: '124', state: 'pending')),
      ]);

      when(mockGetAllOrdersUseCase.getAllOrders())
          .thenAnswer((_) async => Success<OrderResponse2?>(orderResponse));

      expectLater(
        viewModel.stream,
        emitsInOrder([isA<LoadingState>(), isA<SuccessState>()]),
      );

      viewModel.doIntent(LoadOrdersIntent());
    });

    test('LoadOrdersIntent - emits LoadingState and ErrorState on failure',
        () async {
      when(mockGetAllOrdersUseCase.getAllOrders())
          .thenAnswer((_) async => Fail<OrderResponse2?>(Exception('Error')));

      expectLater(
        viewModel.stream,
        emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]),
      );

      viewModel.doIntent(LoadOrdersIntent());
    });
  });
}
