import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/local/hive/hive_manager.dart';
import 'package:elevate_ecommerce_driver/features/login/data/datasource/offline_data_source_impl.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/cache_user_model.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
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
    test('checkUser returns a token successfully', () async {
      const token = 'mockToken';
      when(mockHiveManager.getToken()).thenAnswer((_) async => token);

      final result = await offlineDataSource.checkUser();

      expect(result, isA<Success<String?>>());
      expect((result as Success<String?>).data, equals(token));
      verify(mockHiveManager.getToken()).called(1);
      verifyNoMoreInteractions(mockHiveManager);
    });

    test('checkUser fails to retrieve a token', () async {
      when(mockHiveManager.getToken()).thenThrow(Exception('Error'));

      final result = await offlineDataSource.checkUser();

      expect(result, isA<Fail<String?>>());
      verify(mockHiveManager.getToken()).called(1);
      verifyNoMoreInteractions(mockHiveManager);
    });

    test('getUser retrieves a user successfully', () async {
      when(mockHiveManager.getUser()).thenAnswer((_) async => CacheUserModel(
          country: '',
          email: '',
          firstName: '',
          gender: '',
          id: '',
          lastName: '',
          nid: '',
          nidImg: '',
          phone: '',
          photo: '',
          vehicleLicense: '',
          vehicleNumber: '',
          vehicleType: ''));

      final result = await offlineDataSource.getUser();

      expect(result, isA<Success<User>>());
      verify(mockHiveManager.getUser()).called(1);
      verifyNoMoreInteractions(mockHiveManager);
    });

    test('getUser fails to retrieve a user', () async {
      when(mockHiveManager.getUser()).thenThrow(Exception('Error'));

      final result = await offlineDataSource.getUser();

      expect(result, isA<Fail<User>>());
      verify(mockHiveManager.getUser()).called(1);
      verifyNoMoreInteractions(mockHiveManager);
    });

    test('setUser saves a user successfully', () async {
      final user = User(
        country: '',
        email: '',
        firstName: '',
        gender: '',
        id: '',
        lastName: '',
        nID: '',
        nidImg: '',
        phone: '',
        photo: '',
        vehicleLicense: '',
        vehicleNumber: '',
        vehicleType: '',
      );
      const token = 'mockToken';
      const success = true;

      when(mockHiveManager.setUser(any, any)).thenAnswer((_) async => success);

      final result = await offlineDataSource.setUser(user, token);

      expect(result, isA<Success<bool>>());
    });

    test('setUser fails to save a user', () async {
      final user = User(
          country: '',
          email: '',
          firstName: '',
          gender: '',
          id: '',
          lastName: '',
          nID: '',
          nidImg: '',
          phone: '',
          photo: '',
          vehicleLicense: '',
          vehicleNumber: '',
          vehicleType: '');
      const token = 'mockToken';

      when(mockHiveManager.setUser(any, any)).thenThrow(Exception('Error'));

      final result = await offlineDataSource.setUser(user, token);

      expect(result, isA<Fail<bool>>());
    });
  });
}
