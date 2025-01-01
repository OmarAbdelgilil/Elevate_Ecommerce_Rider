import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/dataSource/updatePassword_OnlineDatasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/repository_impl/updatePassword_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'updatePassword_repository_impl_test.mocks.dart';

@GenerateMocks([UpdatePasswordOnlineDatasource])

void main() {
  group("when call updatePasswordRepo.updatePassword it should call updatePassword function from updatePasswordOnlineDataSource ", (){

    test('test updatePassword Success on registerOnlineDataSource ', () async {
      // Arrange
      var mockedResult = Success<User?>(User());
      provideDummy<Result<User?>>(mockedResult);
      var updatePasswordOnlineDataSource =MockUpdatePasswordOnlineDatasource();
      var updatePasswordRepositoryImpl =UpdatePasswordRepositoryImpl(updatePasswordOnlineDataSource);
      final request = UpdatePasswordRequest();
      when(updatePasswordOnlineDataSource.updatePassword(any)).thenAnswer((_)async=>mockedResult);
      // Act
      var actual= await updatePasswordRepositoryImpl.updatePassword(request);
      // Assert
      expect(actual, mockedResult);
      verify(updatePasswordOnlineDataSource.updatePassword(request)).called(1);
    });

    test('test updatePassword Fail on registerOnlineDataSource ', () async {
      // Arrange
      var failmockedResult =Fail<User?>(Exception());
      provideDummy<Result<User?>>(Fail(Exception()));
      var updatePasswordOnlineDataSource =MockUpdatePasswordOnlineDatasource();
      var updatePasswordRepositoryImpl =UpdatePasswordRepositoryImpl(updatePasswordOnlineDataSource);
      final request = UpdatePasswordRequest();
      when(updatePasswordOnlineDataSource.updatePassword(any)).thenAnswer((_)async=>failmockedResult);
      // Act
      var actual= await updatePasswordRepositoryImpl.updatePassword(request);
      // Assert
      expect(actual, failmockedResult);
      verify(updatePasswordOnlineDataSource.updatePassword(request)).called(1);
    });


  });


}