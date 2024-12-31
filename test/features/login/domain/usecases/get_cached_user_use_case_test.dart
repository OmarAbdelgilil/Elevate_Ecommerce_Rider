import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/repos/login_repo.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/get_cached_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'check_cached_user_use_case_test.mocks.dart';

@GenerateMocks([LoginRepo])
void main() {
  late GetCachedUserUseCase getCachedUserUseCase;
  late MockLoginRepo mockLoginRepo;

  setUp(() {
    mockLoginRepo = MockLoginRepo();
    getCachedUserUseCase = GetCachedUserUseCase(mockLoginRepo);
    provideDummy<Result<User>>(
      Success(User()),
    );
    provideDummy<Result<User?>>(
      Fail(Exception("No cached user available")),
    );
  });

  group('GetCachedUserUseCase Tests', () {
    test('getUser calls getCachedUser on LoginRepo', () async {
      final successResult = Success<User>(
        User(),
      );

      when(mockLoginRepo.getCachedUser())
          .thenAnswer((_) async => successResult);

      final result = await getCachedUserUseCase.getUser();

      expect(result, successResult);
      verify(mockLoginRepo.getCachedUser()).called(1);
    });

    test('getUser returns Fail when LoginRepo fails', () async {
      final exception = Exception("No cached user available");
      final failResult = Fail<User>(exception);

      when(mockLoginRepo.getCachedUser()).thenAnswer((_) async => failResult);

      final result = await getCachedUserUseCase.getUser();

      expect(result, failResult);
      verify(mockLoginRepo.getCachedUser()).called(1);
    });
  });
}
