import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/edit_profile_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/upload_image_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/edit_profile_response/edit_profile_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/update_profile_image_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/domain/repos/profile_repo.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/domain/use_cases/profile_usecase.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/user_data_response/driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  late ProfileUsecase profileUsecase;
  late MockProfileRepo mockProfileRepo;

  setUp(() {
    mockProfileRepo = MockProfileRepo();
    profileUsecase = ProfileUsecase(mockProfileRepo);

    // Provide dummy values for Result<EditProfileResponse?> and Result<UpdateProfileImageResponse?>
    provideDummy<Result<EditProfileResponse?>>(
      Success(EditProfileResponse(
        message: "Dummy response",
        driver: Driver(id: "dummy_id", firstName: "Dummy", lastName: "User"),
      )),
    );

    provideDummy<Result<UpdateProfileImageResponse?>>(
      Success(UpdateProfileImageResponse(
        message: "Dummy image response",
      )),
    );
  });

  group('ProfileUsecase Tests', () {
    test('editProfile success on ProfileRepo', () async {
      // Arrange
      final editProfileRequest = EditProfileRequest(
        firstName: "John",
        lastName: "Doe",
        email: "john.doe@example.com",
        phone: "1234567890",
      );

      final expectedResponse = EditProfileResponse(
        message: "Profile updated successfully",
        driver: Driver(id: "1", firstName: "John", lastName: "Doe"),
      );

      when(mockProfileRepo.editProfile(editProfileRequest))
          .thenAnswer((_) async => Success(expectedResponse));

      // Act
      final result = await profileUsecase.editProfile(editProfileRequest);

      // Assert
      expect(result, isA<Success<EditProfileResponse?>>());
      expect((result as Success<EditProfileResponse?>).data, expectedResponse);
      verify(mockProfileRepo.editProfile(editProfileRequest)).called(1);
      verifyNoMoreInteractions(mockProfileRepo);
    });

    test('editProfile failure on ProfileRepo', () async {
      // Arrange
      final editProfileRequest = EditProfileRequest(
        firstName: "Jane",
        lastName: "Doe",
        email: "jane.doe@example.com",
        phone: "0987654321",
      );

      final expectedError =
          Fail<EditProfileResponse?>(Exception('Error updating profile'));

      when(mockProfileRepo.editProfile(editProfileRequest))
          .thenAnswer((_) async => expectedError);

      // Act
      final result = await profileUsecase.editProfile(editProfileRequest);

      // Assert
      expect(result, expectedError);
      verify(mockProfileRepo.editProfile(editProfileRequest)).called(1);
      verifyNoMoreInteractions(mockProfileRepo);
    });

    test('uploadImage success on ProfileRepo', () async {
      // Arrange
      final uploadImageRequest = UploadImageRequest();

      final expectedResponse = UpdateProfileImageResponse(
        message: "Image uploaded successfully",
      );

      when(mockProfileRepo.uploadImage(uploadImageRequest))
          .thenAnswer((_) async => Success(expectedResponse));

      // Act
      final result = await profileUsecase.uploadImage(uploadImageRequest);

      // Assert
      expect(result, isA<Success<UpdateProfileImageResponse?>>());
      expect((result as Success<UpdateProfileImageResponse?>).data,
          expectedResponse);
      verify(mockProfileRepo.uploadImage(uploadImageRequest)).called(1);
      verifyNoMoreInteractions(mockProfileRepo);
    });

    test('uploadImage failure on ProfileRepo', () async {
      // Arrange
      final uploadImageRequest = UploadImageRequest();

      final expectedError =
          Fail<UpdateProfileImageResponse?>(Exception('Error uploading image'));

      when(mockProfileRepo.uploadImage(uploadImageRequest))
          .thenAnswer((_) async => expectedError);

      // Act
      final result = await profileUsecase.uploadImage(uploadImageRequest);

      // Assert
      expect(result, expectedError);
      verify(mockProfileRepo.uploadImage(uploadImageRequest)).called(1);
      verifyNoMoreInteractions(mockProfileRepo);
    });
  });
}
