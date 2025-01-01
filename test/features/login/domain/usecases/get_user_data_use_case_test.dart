import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/repos/login_repo.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/get_user_data_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_data_use_case_test.mocks.dart';

@GenerateMocks([LoginRepo])
void main() {
  late GetUserDataUseCase getUserDataUseCase;
  late MockLoginRepo mockLoginRepo;

  setUp(() {
    mockLoginRepo = MockLoginRepo();
    getUserDataUseCase = GetUserDataUseCase(mockLoginRepo);
    provideDummy<Result<User>>(
      Success(User()),
    );
    provideDummy<Result<User?>>(
      Fail(Exception("No cached user available")),
    );
  });

  group('GetUserDataUseCase Tests', () {
    test('getUserData calls getUserData on LoginRepo', () async {
      final successResult = Success<User>(User());

      when(mockLoginRepo.getUserData()).thenAnswer((_) async => successResult);

      final result = await getUserDataUseCase.getUserData();

      expect(result, successResult);
      verify(mockLoginRepo.getUserData()).called(1);
    });

    test('getUserData returns Fail when LoginRepo fails', () async {
      final exception = Exception("Error fetching user data");
      final failResult = Fail<User>(exception);

      when(mockLoginRepo.getUserData()).thenAnswer((_) async => failResult);

      final result = await getUserDataUseCase.getUserData();

      expect(result, failResult);
      verify(mockLoginRepo.getUserData()).called(1);
    });
  });
}
