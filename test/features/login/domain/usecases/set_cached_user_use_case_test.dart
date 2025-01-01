import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/repos/login_repo.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/set_cached_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'set_cached_user_use_case_test.mocks.dart';

@GenerateMocks([LoginRepo])
void main() {
  late SetCachedUserUseCase setCachedUserUseCase;
  late MockLoginRepo mockLoginRepo;

  setUp(() {
    mockLoginRepo = MockLoginRepo();
    setCachedUserUseCase = SetCachedUserUseCase(mockLoginRepo);
    provideDummy<Result<bool>>(
      Success(true),
    );
    provideDummy<Result<bool>>(
      Fail(Exception("Failed to set cached user")),
    );
  });

  group('SetCachedUserUseCase Tests', () {
    test('setUser calls setCachedUser on LoginRepo', () async {
      final successResult = Success<bool>(true);
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
      const token = "";

      when(mockLoginRepo.setCachedUser(user, token))
          .thenAnswer((_) async => successResult);

      final result = await setCachedUserUseCase.setUser(user, token);

      expect(result, successResult);
      verify(mockLoginRepo.setCachedUser(user, token)).called(1);
    });

    test('setUser returns Fail when LoginRepo fails', () async {
      final exception = Exception("Failed to set cached user");
      final failResult = Fail<bool>(exception);
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
      const token = "";

      when(mockLoginRepo.setCachedUser(user, token))
          .thenAnswer((_) async => failResult);

      final result = await setCachedUserUseCase.setUser(user, token);

      expect(result, failResult);
      verify(mockLoginRepo.setCachedUser(user, token)).called(1);
    });
  });
}
