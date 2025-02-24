import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/edit_profile_response/edit_profile_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/domain/use_cases/profile_usecase.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/viewmodel/edit_profile_cubit.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/user_data_response/driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_profile_cubit_test.mocks.dart';

@GenerateMocks([ProfileUsecase])
void main() {
  late EditProfileCubit editProfileCubit;
  late MockProfileUsecase mockProfileUsecase;

  setUp(() {
    mockProfileUsecase = MockProfileUsecase();
    editProfileCubit = EditProfileCubit(mockProfileUsecase);

    provideDummy<Result<EditProfileResponse?>>(
      Success(EditProfileResponse(
        message: "Dummy response",
        driver: Driver(
          firstName: "Dummy",
          lastName: "User",
          email: "dummy@example.com",
          phone: "1234567890",
        ),
      )),
    );
  });

  group('EditProfileCubit Tests', () {
    test('initial state is EditProfileInitial', () {
      expect(editProfileCubit.state, isA<EditProfileInitial>());
    });

    test(
        'doIntent with UpdateProfileIntent emits Loading, Success states on success',
        () async {
      // Arrange
      final updateIntent = UpdateProfileIntent(
        firstName: "John",
        lastName: "Doe",
        email: "john.doe@example.com",
        phone: "1234567890",
      );

      final expectedResponse = EditProfileResponse(
        message: "Profile updated successfully",
        driver: Driver(
          firstName: "John",
          lastName: "Doe",
          email: "john.doe@example.com",
          phone: "1234567890",
        ),
      );

      when(mockProfileUsecase.editProfile(any))
          .thenAnswer((_) async => Success(expectedResponse));

      expectLater(
        editProfileCubit.stream,
        emitsInOrder([
          isA<EditProfileLoading>(),
          isA<EditProfileSuccess>(),
        ]),
      );

      // Act
      await editProfileCubit.doIntent(updateIntent);
    });

    test(
        'doIntent with UpdateProfileIntent emits Loading, Error states on failure',
        () async {
      // Arrange
      final updateIntent = UpdateProfileIntent(
        firstName: "Jane",
        lastName: "Doe",
        email: "jane.doe@example.com",
        phone: "0987654321",
      );

      final exception = Exception('Error updating profile');
      when(mockProfileUsecase.editProfile(any))
          .thenAnswer((_) async => Fail<EditProfileResponse?>(exception));

      expectLater(
        editProfileCubit.stream,
        emitsInOrder([
          isA<EditProfileLoading>(),
          isA<EditProfileError>(),
        ]),
      );

      // Act
      await editProfileCubit.doIntent(updateIntent);
    });
  });
}
