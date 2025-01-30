import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/local/hive/hive_manager.dart';
import 'package:elevate_ecommerce_driver/features/home/data/datasource/offline_data_source_impl.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'offline_data_source_impl_test.mocks.dart';

@GenerateMocks([HiveManager])
void main() {
  late OfflineDataSourceImpl offlineDataSource;
  late MockHiveManager mockHiveManager;

  setUp(() {
    mockHiveManager = MockHiveManager();
    offlineDataSource = OfflineDataSourceImpl(mockHiveManager);
  });

  group('OfflineDataSourceImpl Tests', () {
    test('checkOngoingOrder returns true when an ongoing order exists',
        () async {
      when(mockHiveManager.checkOngoingOrder()).thenAnswer((_) async => true);

      final result = await offlineDataSource.checkOngoingOrder();

      expect(result, isA<Success<bool>>());
      expect((result as Success<bool>).data, isTrue);
      verify(mockHiveManager.checkOngoingOrder()).called(1);
      verifyNoMoreInteractions(mockHiveManager);
    });

    test('checkOngoingOrder returns false when no ongoing order exists',
        () async {
      when(mockHiveManager.checkOngoingOrder()).thenAnswer((_) async => false);

      final result = await offlineDataSource.checkOngoingOrder();

      expect(result, isA<Success<bool>>());
      expect((result as Success<bool>).data, isFalse);
    });

    test('checkOngoingOrder fails', () async {
      when(mockHiveManager.checkOngoingOrder()).thenThrow(Exception('Error'));

      final result = await offlineDataSource.checkOngoingOrder();

      expect(result, isA<Fail<bool>>());
    });

    test('clearOngoingOrder returns success', () async {
      when(mockHiveManager.clearOngoingOrder()).thenAnswer((_) async => true);

      final result = await offlineDataSource.clearOngoingOrder();

      expect(result, isA<Success<bool>>());
      expect((result as Success<bool>).data, isTrue);
    });

    test('clearOngoingOrder fails', () async {
      when(mockHiveManager.clearOngoingOrder()).thenThrow(Exception('Error'));

      final result = await offlineDataSource.clearOngoingOrder();

      expect(result, isA<Fail<bool>>());
    });

    test('setOngoingOrder saves an order successfully', () async {
      final order = OrderEntity();
      when(mockHiveManager.setOngoingOrder(any)).thenAnswer((_) async => true);

      final result = await offlineDataSource.setOngoingOrder(order);

      expect(result, isA<Success<bool>>());
      expect((result as Success<bool>).data, isTrue);
    });

    test('setOngoingOrder fails', () async {
      final order = OrderEntity();
      when(mockHiveManager.setOngoingOrder(any)).thenThrow(Exception('Error'));

      final result = await offlineDataSource.setOngoingOrder(order);

      expect(result, isA<Fail<bool>>());
    });

    test('getOngoingOrder retrieves an order successfully', () async {
      final orderJson = {'id': '1', 'status': 'pending', 'items': []};
      when(mockHiveManager.getOrder()).thenAnswer((_) async => orderJson);

      final result = await offlineDataSource.getOngoingOrder();

      expect(result, isA<Success<OrderEntity>>());
    });

    test('getOngoingOrder fails', () async {
      when(mockHiveManager.getOrder()).thenThrow(Exception('Error'));

      final result = await offlineDataSource.getOngoingOrder();

      expect(result, isA<Fail<OrderEntity>>());
    });
  });
}
