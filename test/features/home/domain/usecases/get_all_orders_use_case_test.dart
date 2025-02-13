import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/order_respose2/order_response2/order_response2.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/repositories/home_repository.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/usecases/get_all_orders_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_orders_use_case_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late GetAllOrdersUseCase getAllOrdersUseCase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getAllOrdersUseCase = GetAllOrdersUseCase(mockHomeRepository);

    provideDummy<Result<OrderResponse2?>>(Success(OrderResponse2(orders: [])));
    provideDummy<Result<OrderResponse2?>>(
        Fail(Exception('Failed to fetch all orders')));
  });

  group('GetAllOrdersUseCase Tests', () {
    test('getAllOrders retrieves orders successfully', () async {
      final orderResponse = OrderResponse2(orders: []);
      final expectedResult = Success(orderResponse);

      when(mockHomeRepository.getAllOrder())
          .thenAnswer((_) async => expectedResult);

      final result = await getAllOrdersUseCase.getAllOrders();

      expect(result, expectedResult);
      verify(mockHomeRepository.getAllOrder()).called(1);
      verifyNoMoreInteractions(mockHomeRepository);
    });

    test('getAllOrders fails due to network error', () async {
      final expectedError =
          Fail<OrderResponse2?>(Exception('Failed to fetch all orders'));

      when(mockHomeRepository.getAllOrder())
          .thenAnswer((_) async => expectedError);

      final result = await getAllOrdersUseCase.getAllOrders();

      expect(result, expectedError);
      verify(mockHomeRepository.getAllOrder()).called(1);
      verifyNoMoreInteractions(mockHomeRepository);
    });
  });
}
