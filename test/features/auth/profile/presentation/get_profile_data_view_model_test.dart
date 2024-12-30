import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/view_model/get_profile_data_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/driver.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/profile_data_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/domain/usecases/get_profile_data_usecase.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/view_model/get_profile_data_view_model_states.dart';

import 'get_profile_data_view_model_test.mocks.dart';

@GenerateMocks([GetProfileDataUsecase])
void main() {
  late ProfileCubit profileCubit;
  late MockGetProfileDataUsecase mockGetProfileDataUsecase;

  final dummyDriver = Driver(
    id: '1',
    country: 'Country',
    firstName: 'John',
    lastName: 'Doe',
    vehicleType: 'Car',
    vehicleNumber: 'ABC123',
    vehicleLicense: 'XYZ456',
    nid: 'NID123456',
    email: 'john.doe@example.com',
    phone: '+1234567890',
  );

  final dummyResponse = ProfileDataResponse(
    message: 'Success',
    driver: dummyDriver,
  );

  setUp(() {
    mockGetProfileDataUsecase = MockGetProfileDataUsecase();
    profileCubit = ProfileCubit(mockGetProfileDataUsecase);

    // Providing dummy values for Result types
    provideDummy<Result<ProfileDataResponse?>>(
      Success(dummyResponse),
    );
    provideDummy<Result<ProfileDataResponse?>>(
      Fail(Exception('Failed to load profile')),
    );
  });

  group('ProfileCubit Tests', () {
    test('initial state is ProfileInitial', () {
      expect(profileCubit.state, isA<ProfileInitial>());
    });

    test('loadProfile emits Loading and Loaded states on Success', () async {
      when(mockGetProfileDataUsecase.getProfile())
          .thenAnswer((_) async => Success(dummyResponse));

      expectLater(
        profileCubit.stream,
        emitsInOrder([
          isA<ProfileLoading>(),
          isA<ProfileLoaded>(),
        ]),
      );

      await profileCubit.loadProfile();
    });

    test('loadProfile emits Loading and Error states on Fail', () async {
      final exception = Exception('Failed to load profile');
      when(mockGetProfileDataUsecase.getProfile())
          .thenAnswer((_) async => Fail(exception));

      expectLater(
        profileCubit.stream,
        emitsInOrder([
          isA<ProfileLoading>(),
          isA<ProfileError>(),
        ]),
      );

      await profileCubit.loadProfile();
    });
  });
}
