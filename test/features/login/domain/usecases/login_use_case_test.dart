import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/repos/login_repo.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([LoginRepo])
void main() {
  late LoginUseCase loginUseCase;
  late MockLoginRepo mockLoginRepo;

  setUp(() {
    mockLoginRepo = MockLoginRepo();
    loginUseCase = LoginUseCase(mockLoginRepo);
    provideDummy<Result<LoginResponse>>(
      Success(LoginResponse()),
    );
    provideDummy<Result<LoginResponse>>(
      Fail(Exception("Invalid credentials")),
    );
  });

  group('LoginUseCase Tests', () {
    test('login calls login on LoginRepo', () async {
      final successResult = Success<LoginResponse>(
        LoginResponse(),
      );

      when(mockLoginRepo.login("test@example.com", "password123"))
          .thenAnswer((_) async => successResult);

      final result =
          await loginUseCase.login("test@example.com", "password123");

      expect(result, successResult);
      verify(mockLoginRepo.login("test@example.com", "password123")).called(1);
    });

    test('login returns Fail when LoginRepo fails', () async {
      final exception = Exception("Invalid credentials");
      final failResult = Fail<LoginResponse>(exception);

      when(mockLoginRepo.login("test@example.com", "wrongpassword"))
          .thenAnswer((_) async => failResult);

      final result =
          await loginUseCase.login("test@example.com", "wrongpassword");

      expect(result, failResult);
      verify(mockLoginRepo.login("test@example.com", "wrongpassword"))
          .called(1);
    });
  });
}
