import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/data_sources/profile_online_datasource_impl.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/requests/edit_profile_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/edit_profile_response/edit_profile_response.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/user_data_response/driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_online_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late ProfileOnlineDatasourceImpl profileOnlineDatasource;
  late MockApiManager mockApiManager;

  setUp(() {
    mockApiManager = MockApiManager();
    profileOnlineDatasource = ProfileOnlineDatasourceImpl(mockApiManager);
  });

  group('ProfileOnlineDatasourceImpl Tests', () {
    test('editProfile success on ApiManager', () async {
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

      when(mockApiManager.editProfile(editProfileRequest))
          .thenAnswer((_) async => expectedResponse);

      // Act
      final result =
          await profileOnlineDatasource.editProfile(editProfileRequest);

      // Assert
      expect(result, isA<Success<EditProfileResponse?>>());
      expect((result as Success<EditProfileResponse?>).data, expectedResponse);
      verify(mockApiManager.editProfile(editProfileRequest)).called(1);
    });

    test('editProfile failure on ApiManager', () async {
      // Arrange
      final editProfileRequest = EditProfileRequest(
        firstName: "Jane",
        lastName: "Doe",
        email: "jane.doe@example.com",
        phone: "0987654321",
      );

      when(mockApiManager.editProfile(editProfileRequest))
          .thenThrow(Exception('Error updating profile'));

      // Act
      final result =
          await profileOnlineDatasource.editProfile(editProfileRequest);

      // Assert
      expect(result, isA<Fail<EditProfileResponse?>>());
      verify(mockApiManager.editProfile(editProfileRequest)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}
