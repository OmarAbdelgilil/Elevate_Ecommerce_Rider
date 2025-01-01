import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/contracts/profile_onlind_datasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/edit_profile_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/edit_profile_response/edit_profile_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/repos/profile_repo_impl.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/user_data_response/driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_repo_impl_test.mocks.dart';

@GenerateMocks([ProfileOnlindDatasource])
void main() {
  late ProfileRepoImpl profileRepo;
  late MockProfileOnlindDatasource mockProfileOnlindDatasource;

  setUp(() {
    mockProfileOnlindDatasource = MockProfileOnlindDatasource();
    profileRepo = ProfileRepoImpl(mockProfileOnlindDatasource);

    provideDummy<Result<EditProfileResponse?>>(
      Success(EditProfileResponse(
        message: "Dummy response",
        driver: Driver(id: "dummy_id", firstName: "Dummy", lastName: "User"),
      )),
    );
  });

  group('ProfileRepoImpl Tests', () {
    test('editProfile success on ProfileOnlindDatasource', () async {
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

      when(mockProfileOnlindDatasource.editProfile(editProfileRequest))
          .thenAnswer((_) async => Success(expectedResponse));

      final result = await profileRepo.editProfile(editProfileRequest);

      expect(result, isA<Success<EditProfileResponse?>>());
      expect((result as Success<EditProfileResponse?>).data, expectedResponse);
      verify(mockProfileOnlindDatasource.editProfile(editProfileRequest))
          .called(1);
      verifyNoMoreInteractions(mockProfileOnlindDatasource);
    });

    test('editProfile failure on ProfileOnlindDatasource', () async {
      // Arrange
      final editProfileRequest = EditProfileRequest(
        firstName: "Jane",
        lastName: "Doe",
        email: "jane.doe@example.com",
        phone: "0987654321",
      );

      final expectedError =
          Fail<EditProfileResponse?>(Exception('Error updating profile'));

      when(mockProfileOnlindDatasource.editProfile(editProfileRequest))
          .thenAnswer((_) async => expectedError);

      final result = await profileRepo.editProfile(editProfileRequest);

      expect(result, expectedError);
      verify(mockProfileOnlindDatasource.editProfile(editProfileRequest))
          .called(1);
      verifyNoMoreInteractions(mockProfileOnlindDatasource);
    });
  });
}
