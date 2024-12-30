import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/data/models/response/profile_data_response/profile_data_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/domain/repos/get_profile_data_repo.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/domain/usecases/get_profile_data_usecase.dart';
import 'get_profile_data_usecase_test.mocks.dart';

@GenerateMocks([GetProfileDataRepo])
void main() {
  late GetProfileDataUsecase getProfileDataUsecase;
  late MockGetProfileDataRepo mockGetProfileDataRepo;

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
    mockGetProfileDataRepo = MockGetProfileDataRepo();
    getProfileDataUsecase = GetProfileDataUsecase(mockGetProfileDataRepo);

    provideDummy<Result<ProfileDataResponse?>>(
      Success(dummyResponse),
    );
    provideDummy<Result<ProfileDataResponse?>>(
      Fail(Exception('Failed to fetch profile')),
    );
  });

  group('GetProfileDataUsecase Tests', () {
    test('getProfile returns Success', () async {
      when(mockGetProfileDataRepo.getProfile())
          .thenAnswer((_) async => Success(dummyResponse));

      final result = await getProfileDataUsecase.getProfile();

      expect(result, isA<Success<ProfileDataResponse?>>());
      expect((result as Success).data, dummyResponse);
      verify(mockGetProfileDataRepo.getProfile()).called(1);
      verifyNoMoreInteractions(mockGetProfileDataRepo);
    });

    test('getProfile returns Fail', () async {
      final exception = Exception('Failed to fetch profile');

      when(mockGetProfileDataRepo.getProfile())
          .thenAnswer((_) async => Fail(exception));

      final result = await getProfileDataUsecase.getProfile();

      expect(result, isA<Fail<ProfileDataResponse?>>());
      expect((result as Fail).exception, exception);
      verify(mockGetProfileDataRepo.getProfile()).called(1);
      verifyNoMoreInteractions(mockGetProfileDataRepo);
    });
  });
}
