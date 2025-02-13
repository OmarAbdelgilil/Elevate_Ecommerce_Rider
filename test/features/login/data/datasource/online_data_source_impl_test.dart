import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/login/data/datasource/online_data_source_impl.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/user_data_response/driver.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/user_data_response/user_data_response.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
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
    test('login succeeds on valid credentials', () async {
      const email = 'test@example.com';
      const pass = 'password123';

      final loginResponse = LoginResponse(token: 'mockToken');

      when(mockApiManager.login(any)).thenAnswer((_) async => loginResponse);

      final result = await onlineDataSource.login(email, pass);

      expect(result, isA<Success<LoginResponse?>>());
    });

    test('login fails on invalid credentials', () async {
      const email = 'test@example.com';
      const pass = 'wrongPassword';

      when(mockApiManager.login(any))
          .thenThrow(Exception('Invalid credentials'));

      final result = await onlineDataSource.login(email, pass);

      expect(result, isA<Fail<LoginResponse?>>());
    });

    test('getUserData retrieves user data successfully', () async {
      when(mockApiManager.getUserData()).thenAnswer((_) async =>
          UserDataResponse(
              driver: Driver(
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
                  vehicleType: '')));

      final result = await onlineDataSource.getUserData();

      expect(result, isA<Success<User>>());
    });

    test('getUserData fails to retrieve user data', () async {
      when(mockApiManager.getUserData()).thenThrow(Exception('Network error'));

      final result = await onlineDataSource.getUserData();

      expect(result, isA<Fail<User>>());
      verify(mockApiManager.getUserData()).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}
