import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/login_use_case.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/set_cached_user_use_case.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/check_cached_user_use_case.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/get_cached_user_use_case.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/get_user_data_use_case.dart';
import 'package:elevate_ecommerce_driver/features/login/presentation/cubit/login_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_viewmodel_test.mocks.dart';

@GenerateMocks([
  LoginUseCase,
  SetCachedUserUseCase,
  CheckCachedUserUseCase,
  GetCachedUserUseCase,
  GetUserDataUseCase,
])
void main() {
  late LoginViewModel viewModel;
  late MockLoginUseCase mockLoginUseCase;
  late MockSetCachedUserUseCase mockSetCachedUserUseCase;
  late MockCheckCachedUserUseCase mockCheckCachedUserUseCase;
  late MockGetCachedUserUseCase mockGetCachedUserUseCase;
  late MockGetUserDataUseCase mockGetUserDataUseCase;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockSetCachedUserUseCase = MockSetCachedUserUseCase();
    mockCheckCachedUserUseCase = MockCheckCachedUserUseCase();
    mockGetCachedUserUseCase = MockGetCachedUserUseCase();
    mockGetUserDataUseCase = MockGetUserDataUseCase();
    provideDummy<Result<String?>>(Success(""));
    provideDummy<Result<String?>>(Fail(Exception()));
    provideDummy<Result<User?>>(Success(User(
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
        vehicleType: '')));
    provideDummy<Result<User?>>(Fail(Exception()));
    provideDummy<Result<LoginResponse>>(Success(LoginResponse()));
    provideDummy<Result<LoginResponse>>(Fail(Exception()));
    provideDummy<Result<User>>(Success(User(
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
        vehicleType: '')));
    provideDummy<Result<User>>(Fail(Exception()));
    provideDummy<Result<bool>>(Success(true));
    provideDummy<Result<bool>>(Fail(Exception()));
    provideDummy<Result<bool?>>(Success(true));
    provideDummy<Result<bool?>>(Fail(Exception()));
    viewModel = LoginViewModel(
      mockLoginUseCase,
      mockSetCachedUserUseCase,
      mockCheckCachedUserUseCase,
      mockGetCachedUserUseCase,
      mockGetUserDataUseCase,
    );
  });

  group('LoginViewModel test', () {
    test('Initial state is LoadingScreenState', () {
      expect(viewModel.state, isA<InitialState>());
    });

    test(
        'CheckCacheIntent - emits LoggedInState when token found and user cached',
        () async {
      when(mockCheckCachedUserUseCase.checkUser())
          .thenAnswer((_) async => Success<String?>('token'));
      when(mockGetCachedUserUseCase.getUser())
          .thenAnswer((_) async => Success<User?>(User()));

      expectLater(viewModel.stream,
          emitsInOrder([isA<LoadingScreenState>(), isA<LoggedInState>()]));

      await viewModel.handleIntent(CheckCacheIntent());
    });

    test('CheckCacheIntent - emits ErrorState when user data fetching fails',
        () async {
      when(mockCheckCachedUserUseCase.checkUser())
          .thenAnswer((_) async => Success<String?>('token'));
      when(mockGetCachedUserUseCase.getUser())
          .thenAnswer((_) async => Fail<User?>(Exception('Error')));

      expectLater(viewModel.stream,
          emitsInOrder([isA<LoadingScreenState>(), isA<ErrorState>()]));

      await viewModel.handleIntent(CheckCacheIntent());
    });
  });
}
