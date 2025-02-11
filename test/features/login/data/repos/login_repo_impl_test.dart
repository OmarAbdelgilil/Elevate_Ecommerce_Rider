import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/login/data/contracts/offline_data_source.dart';
import 'package:elevate_ecommerce_driver/features/login/data/contracts/online_data_source.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce_driver/features/login/data/repos/login_repo_impl.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_repo_impl_test.mocks.dart';

@GenerateMocks([OnlineDataSource, OfflineDataSource, UserProvider])
void main() {
  late LoginRepoImpl loginRepo;
  late MockOnlineDataSource mockOnlineDataSource;
  late MockOfflineDataSource mockOfflineDataSource;
  late MockUserProvider mockUserProvider;

  setUp(() {
    mockOnlineDataSource = MockOnlineDataSource();
    mockOfflineDataSource = MockOfflineDataSource();
    mockUserProvider = MockUserProvider();
    loginRepo = LoginRepoImpl(mockOnlineDataSource, mockOfflineDataSource);
  });

  group('LoginRepoImpl Tests', () {
    test('login success on OnlineDataSource', () async {
      provideDummy<Result<LoginResponse?>>(
          Success(LoginResponse(token: 'mockToken')));
      const email = 'test@example.com';
      const password = 'password';
      final response = LoginResponse(token: 'mockToken');
      final expectedResult = Success(response);

      when(mockOnlineDataSource.login(any, any))
          .thenAnswer((_) async => expectedResult);
      when(mockUserProvider.login(any)).thenReturn(null);

      final result = await loginRepo.login(email, password);

      expect(result, isA<Success>());
    });

    test('login failure on OnlineDataSource', () async {
      const email = 'test@example.com';
      const password = 'password';
      provideDummy<Result<LoginResponse?>>(Fail(Exception()));
      final expectedError = Fail<LoginResponse>(Exception());

      when(mockOnlineDataSource.login(any, any))
          .thenAnswer((_) async => expectedError);

      final result = await loginRepo.login(email, password);

      expect(result, expectedError);
      verify(mockOnlineDataSource.login(email, password)).called(1);
      verifyNoMoreInteractions(mockOnlineDataSource);
    });

    test('getUserData success on OnlineDataSource', () async {
      provideDummy<Result<User>>(Success(User()));
      final response = User(
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
      final expectedResult = Success(response);

      when(mockOnlineDataSource.getUserData())
          .thenAnswer((_) async => expectedResult);
      when(mockUserProvider.setUser(any)).thenReturn(null);

      final result = await loginRepo.getUserData();

      expect(result, expectedResult);
    });

    test('getUserData failure on OnlineDataSource', () async {
      provideDummy<Result<User>>(Fail(Exception()));
      final expectedError = Fail<User>(Exception());

      when(mockOnlineDataSource.getUserData())
          .thenAnswer((_) async => expectedError);

      final result = await loginRepo.getUserData();

      expect(result, expectedError);
      verify(mockOnlineDataSource.getUserData()).called(1);
      verifyNoMoreInteractions(mockOnlineDataSource);
    });

    test('checkCachedUser success with non-null token', () async {
      provideDummy<Result<String?>>(Success(''));

      when(mockOfflineDataSource.checkUser())
          .thenAnswer((_) async => Success(''));
      when(mockUserProvider.login(any)).thenReturn(null);

      final result = await loginRepo.checkCachedUser();

      expect(result, isA<Success>());
    });

    test('getCachedUser success', () async {
      provideDummy<Result<User>>(Success(User()));
      final response = User(
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
      final expectedResult = Success(response);

      when(mockOfflineDataSource.getUser())
          .thenAnswer((_) async => expectedResult);
      when(mockUserProvider.setUser(any)).thenReturn(null);

      final result = await loginRepo.getCachedUser();

      expect(result, expectedResult);
    });

    test('setCachedUser success', () async {
      provideDummy<Result<bool>>(Success(true));
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
      final expectedResult = Success(true);

      when(mockOfflineDataSource.setUser(any, any))
          .thenAnswer((_) async => expectedResult);

      final result = await loginRepo.setCachedUser(user, token);

      expect(result, expectedResult);
      verify(mockOfflineDataSource.setUser(user, token)).called(1);
      verifyNoMoreInteractions(mockOfflineDataSource);
    });
  });
}
