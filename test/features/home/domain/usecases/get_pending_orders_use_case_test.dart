import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/get_pending_orders_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_pending_orders_use_case_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late GetPendingOrdersUseCase getPendingOrdersUseCase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getPendingOrdersUseCase = GetPendingOrdersUseCase(mockHomeRepository);
    provideDummy<Result<OrdersEntity>>(Success(OrdersEntity(orders: [])));
    provideDummy<Result<OrdersEntity>>(
        Fail(Exception("No pending orders found")));
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
}
