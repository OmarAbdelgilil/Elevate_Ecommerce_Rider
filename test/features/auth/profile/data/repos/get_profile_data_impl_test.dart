import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/driver.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/repos/get_profile_data_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/contracts/get_profile_data_data_onlinedatasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/profile_data_response.dart';
import 'get_profile_data_impl_test.mocks.dart';

@GenerateMocks([GetProfileDataOnlinedatasource])
void main() {
  late GetProfileDataImpl getProfileDataRepo;
  late MockGetProfileDataOnlinedatasource mockDatasource;

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
    mockDatasource = MockGetProfileDataOnlinedatasource();
    getProfileDataRepo = GetProfileDataImpl(mockDatasource);

    provideDummy<Result<ProfileDataResponse?>>(
      Success(dummyResponse),
    );
    provideDummy<Result<ProfileDataResponse?>>(
      Fail(Exception('Failed to fetch profile')),
    );
  });

  group('GetProfileDataImpl Tests', () {
    test('getProfile returns Success', () async {
      when(mockDatasource.getProfile())
          .thenAnswer((_) async => Success(dummyResponse));

      final result = await getProfileDataRepo.getProfile();

      expect(result, isA<Success<ProfileDataResponse?>>());
      expect((result as Success).data, dummyResponse);
      verify(mockDatasource.getProfile()).called(1);
      verifyNoMoreInteractions(mockDatasource);
    });

    test('getProfile returns Fail', () async {
      final exception = Exception('Failed to fetch profile');

      when(mockDatasource.getProfile())
          .thenAnswer((_) async => Fail(exception));

      final result = await getProfileDataRepo.getProfile();

      expect(result, isA<Fail<ProfileDataResponse?>>());
      expect((result as Fail).exception, exception);
      verify(mockDatasource.getProfile()).called(1);
      verifyNoMoreInteractions(mockDatasource);
    });
  });
}
