import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/home/data/contracts/offline_data_source.dart';
import 'package:elevate_ecommerce_driver/features/home/data/contracts/online_data_source.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/orders_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([OnlineDataSource, OfflineDataSource])
void main() {
  late HomeRepositoryImpl homeRepo;
  late MockOnlineDataSource mockOnlineDataSource;
  late MockOfflineDataSource mockOfflineDataSource;

  setUp(() {
    mockOnlineDataSource = MockOnlineDataSource();
    mockOfflineDataSource = MockOfflineDataSource();
    homeRepo = HomeRepositoryImpl(mockOnlineDataSource, mockOfflineDataSource);
    provideDummy<Result<OrdersEntity>>(Success(OrdersEntity(orders: [])));
    provideDummy<Result<OrdersEntity>>(
        Fail(Exception("No pending orders found")));
    provideDummy<Result<bool>>(Success(true));
    provideDummy<Result<bool>>(Fail(Exception("No ongoing order found")));
  });

  group('HomeRepositoryImpl Tests', () {
    test('getOrders success on OnlineDataSource', () async {
      final response = OrdersEntity(orders: []);
      final expectedResult = Success(response);

      when(mockOnlineDataSource.getOrders())
          .thenAnswer((_) async => expectedResult);

      final result = await homeRepo.getOrders();

      expect(result, expectedResult);
    });

    test('getOrders failure on OnlineDataSource', () async {
      final expectedError =
          Fail<OrdersEntity>(Exception('Failed to fetch orders'));

      when(mockOnlineDataSource.getOrders())
          .thenAnswer((_) async => expectedError);

      final result = await homeRepo.getOrders();

      expect(result, expectedError);
      verify(mockOnlineDataSource.getOrders()).called(1);
      verifyNoMoreInteractions(mockOnlineDataSource);
    });

    test('checkOngoingOrder success', () async {
      final expectedResult = Success(true);

      when(mockOfflineDataSource.checkOngoingOrder())
          .thenAnswer((_) async => expectedResult);

      final result = await homeRepo.checkOngoingOrder();

      expect(result, expectedResult);
    });

    test('clearOngoingOrder success', () async {
      final expectedResult = Success(true);

      when(mockOfflineDataSource.clearOngoingOrder())
          .thenAnswer((_) async => expectedResult);

      final result = await homeRepo.clearOngoingOrder();

      expect(result, expectedResult);
    });

    test('setOngoingOrder success', () async {
      final order = OrderEntity(id: '123');
      final expectedResult = Success(true);

      when(mockOfflineDataSource.setOngoingOrder(any))
          .thenAnswer((_) async => expectedResult);

      final result = await homeRepo.setOngoingOrder(order);

      expect(result, expectedResult);
      verify(mockOfflineDataSource.setOngoingOrder(order)).called(1);
      verifyNoMoreInteractions(mockOfflineDataSource);
    });

    test('getOrder success', () async {
      provideDummy<Result<OrderEntity>>(Success(OrderEntity(orderItems: [])));
      final order = OrderEntity(orderItems: []);
      final expectedResult = Success(order);

      when(mockOfflineDataSource.getOngoingOrder())
          .thenAnswer((_) async => expectedResult);

      final result = await homeRepo.getOrder();

      expect(result, expectedResult);
    });
  });
}
