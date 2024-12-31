import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/repos/login_repo.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/check_cached_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'check_cached_user_use_case_test.mocks.dart';

@GenerateMocks([LoginRepo])
void main() {
  late CheckCachedUserUseCase checkCachedUserUseCase;
  late MockLoginRepo mockLoginRepo;

  setUp(() {
    mockLoginRepo = MockLoginRepo();
    checkCachedUserUseCase = CheckCachedUserUseCase(mockLoginRepo);
    provideDummy<Result<String?>>(Success("cached_user_id"));
    provideDummy<Result<String?>>(Fail(Exception("No cached user found")));
  });

  group('CheckCachedUserUseCase Tests', () {
    test('checkUser calls checkCachedUser on LoginRepo', () async {
      final successResult = Success<String?>("cached_user_id");

      when(mockLoginRepo.checkCachedUser())
          .thenAnswer((_) async => successResult);

      final result = await checkCachedUserUseCase.checkUser();

      expect(result, successResult);
      verify(mockLoginRepo.checkCachedUser()).called(1);
    });

    test('checkUser returns Fail when LoginRepo fails', () async {
      final exception = Exception("No cached user found");
      final failResult = Fail<String?>(exception);

      when(mockLoginRepo.checkCachedUser()).thenAnswer((_) async => failResult);

      final result = await checkCachedUserUseCase.checkUser();

      expect(result, failResult);
      verify(mockLoginRepo.checkCachedUser()).called(1);
    });
  });
}
