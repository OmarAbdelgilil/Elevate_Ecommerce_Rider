import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/domain/repository/update_password_repository.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/domain/useCases/update_password_useCase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_password_useCase_test.mocks.dart';


@GenerateMocks([UpdatePasswordRepository])
void main() {

  test('when call invoke it should call UpdatePasswordRepository.updatePassword with correct parameter', () async {
    // Arrange
    var mockedResult = Success<User?>(User());
    provideDummy<Result<User?>>(mockedResult);
    var updatePasswordRepo = MockUpdatePasswordRepository();
    var updatePasswordUseCase = UpdatePasswordUseCase(updatePasswordRepo);
    final request = UpdatePasswordRequest();

    when(updatePasswordRepo.updatePassword(any)).thenAnswer((_)async=>mockedResult);
    // Act
    var actual= await updatePasswordUseCase.updatePassword(request);

    // Assert
    expect(actual, mockedResult);
    verify(updatePasswordRepo.updatePassword(request)).called(1);
  });
}
