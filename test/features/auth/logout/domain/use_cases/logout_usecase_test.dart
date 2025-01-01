import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/models/logout_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/domain/repos/logout_repo.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/domain/use_cases/logout_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_usecase_test.mocks.dart';

@GenerateMocks([LogoutRepo])
void main() {
  late LogoutUsecase logoutUsecase;
  late MockLogoutRepo mockGetLoggedUserDataRepo;

  final userResponse = Logout(
    message: 'Success',
  );

  setUp(() {
    mockGetLoggedUserDataRepo = MockLogoutRepo();
    logoutUsecase = LogoutUsecase(mockGetLoggedUserDataRepo);

    provideDummy<Result<Logout?>>(
      Fail<Logout?>(Exception('Dummy exception')),
    );
  });

  group('logout the user and remove data and token', () {
    test('logout the user and remove data and token', () async {
      when(mockGetLoggedUserDataRepo.logout())
          .thenAnswer((_) async => Success<Logout?>(userResponse));

      // Act: Call the use case
      final result = await logoutUsecase.logout();

      expect(result, isA<Success<Logout?>>());
      expect((result as Success<Logout?>).data?.message, 'Success');
      verify(mockGetLoggedUserDataRepo.logout()).called(1);
    });
  });
}
