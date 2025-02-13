import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/home/data/datasource/online_data_source_impl.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/order_respose2/order_response2/order_response2.dart';
import 'package:elevate_ecommerce_driver/features/home/data/models/response/orders_response/orders_response.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'online_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late OnlineDataSourceImpl onlineDataSource;
  late MockApiManager mockApiManager;

  setUp(() {
    mockApiManager = MockApiManager();
    onlineDataSource = OnlineDataSourceImpl(mockApiManager);
  });

  group('OnlineDataSourceImpl Tests', () {
    test('getOrders retrieves orders successfully', () async {
      when(mockApiManager.getOrders())
          .thenAnswer((_) async => OrdersResponse());

      final result = await onlineDataSource.getOrders();

      expect(result, isA<Success<OrdersEntity>>());
    });

    test('getOrders fails due to network error', () async {
      when(mockApiManager.getOrders()).thenThrow(Exception('Network error'));

      final result = await onlineDataSource.getOrders();

      expect(result, isA<Fail<OrdersEntity>>());
      verify(mockApiManager.getOrders()).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('getAllOrder retrieves all orders successfully', () async {
      when(mockApiManager.getAllOrders())
          .thenAnswer((_) async => OrderResponse2());

      final result = await onlineDataSource.getAllOrder();

      expect(result, isA<Success<OrderResponse2?>>());
    });

    test('getAllOrder fails due to network error', () async {
      when(mockApiManager.getAllOrders()).thenThrow(Exception('Network error'));

      final result = await onlineDataSource.getAllOrder();

      expect(result, isA<Fail<OrderResponse2?>>());
      verify(mockApiManager.getAllOrders()).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}
