import 'package:elevate_ecommerce_driver/features/auth/profile/data/data_sources/get_profile_data_onlinedatasourace_impl.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/profile_data_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_profile_data_onlinedatasourace_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late GetProfileDataOnlinedatasouraceImpl getProfileDataOnlinedatasource;
  late MockApiManager mockApiManager;

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
    mockApiManager = MockApiManager();
    getProfileDataOnlinedatasource =
        GetProfileDataOnlinedatasouraceImpl(mockApiManager);
  });

  group('GetProfileDataOnlinedatasourceImpl Tests', () {
    test('getProfile returns Success', () async {
      when(mockApiManager.getProfile()).thenAnswer((_) async => dummyResponse);

      final result = await getProfileDataOnlinedatasource.getProfile();

      expect(result, isA<Success<ProfileDataResponse?>>());
      expect((result as Success).data, dummyResponse);
      verify(mockApiManager.getProfile()).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('getProfile returns Fail', () async {
      final exception = Exception('Failed to fetch profile');
      when(mockApiManager.getProfile()).thenThrow(exception);

      final result = await getProfileDataOnlinedatasource.getProfile();

      expect(result, isA<Fail<ProfileDataResponse?>>());
      expect((result as Fail).exception, exception);
      verify(mockApiManager.getProfile()).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}
