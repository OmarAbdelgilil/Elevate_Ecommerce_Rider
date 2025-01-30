import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/get_pending_orders_use_case.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/set_order_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'set_order_use_case_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late GetPendingOrdersUseCase getPendingOrdersUseCase;
  late SetOrderUseCase setOrderUseCase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getPendingOrdersUseCase = GetPendingOrdersUseCase(mockHomeRepository);
    setOrderUseCase = SetOrderUseCase(mockHomeRepository);
    provideDummy<Result<OrdersEntity>>(Success(OrdersEntity(orders: [])));
    provideDummy<Result<OrdersEntity>>(
        Fail(Exception("No pending orders found")));
    provideDummy<Result<bool>>(Success(true));
    provideDummy<Result<bool>>(Fail(Exception("Failed to set order")));
  });

  group('GetPendingOrdersUseCase Tests', () {
    test('getPendingOrders calls getOrders on HomeRepository', () async {
      final successResult = Success<OrdersEntity>(OrdersEntity(orders: []));

      when(mockHomeRepository.getOrders())
          .thenAnswer((_) async => successResult);

      final result = await getPendingOrdersUseCase.getPendingOrders();

      expect(result, successResult);
      verify(mockHomeRepository.getOrders()).called(1);
    });

    test('getPendingOrders returns Fail when HomeRepository fails', () async {
      final exception = Exception("No pending orders found");
      final failResult = Fail<OrdersEntity>(exception);

      when(mockHomeRepository.getOrders()).thenAnswer((_) async => failResult);

      final result = await getPendingOrdersUseCase.getPendingOrders();

      expect(result, failResult);
      verify(mockHomeRepository.getOrders()).called(1);
    });
  });

  group('SetOrderUseCase Tests', () {
    test('setOngoingOrder calls setOngoingOrder on HomeRepository', () async {
      final order = OrderEntity();
      final successResult = Success<bool>(true);

      when(mockHomeRepository.setOngoingOrder(order))
          .thenAnswer((_) async => successResult);

      final result = await setOrderUseCase.setOngoingOrder(order);

      expect(result, successResult);
      verify(mockHomeRepository.setOngoingOrder(order)).called(1);
    });

    test('setOngoingOrder returns Fail when HomeRepository fails', () async {
      final order = OrderEntity();
      final exception = Exception("Failed to set order");
      final failResult = Fail<bool>(exception);

      when(mockHomeRepository.setOngoingOrder(order))
          .thenAnswer((_) async => failResult);

      final result = await setOrderUseCase.setOngoingOrder(order);

      expect(result, failResult);
      verify(mockHomeRepository.setOngoingOrder(order)).called(1);
    });
  });
}
