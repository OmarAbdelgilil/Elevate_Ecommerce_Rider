import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/contracts/forget_password_online_datasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/repositories/forget_password_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_repository_impl_test.mocks.dart';

@GenerateMocks([ForgetPasswordOnlineDatasource])
void main() {
  late ForgetPasswordRepositoryImpl forgetPasswordRepository;
  late MockForgetPasswordOnlineDatasource mockForgetPasswordOnlineDatasource;

  setUp(() {
    mockForgetPasswordOnlineDatasource = MockForgetPasswordOnlineDatasource();
    forgetPasswordRepository =
        ForgetPasswordRepositoryImpl(mockForgetPasswordOnlineDatasource);
  });

  group('ForgetPasswordRepositoryImpl Tests', () {
    test('forgotPassword success on ForgetPasswordOnlineDatasource', () async {
      provideDummy<Result<ForgotPasswordResponse>>(
          Success(ForgotPasswordResponse()));
      final request = ForgotPasswordRequest();
      final response = ForgotPasswordResponse();
      final expectedResult = Success(response);

      when(mockForgetPasswordOnlineDatasource.forgotPassword(any))
          .thenAnswer((_) async => expectedResult);

      final result = await forgetPasswordRepository.forgotPassword(request);

      expect(result, expectedResult);
      verify(mockForgetPasswordOnlineDatasource.forgotPassword(request))
          .called(1);
      verifyNoMoreInteractions(mockForgetPasswordOnlineDatasource);
    });

    test('forgotPassword failure on ForgetPasswordOnlineDatasource', () async {
      final request = ForgotPasswordRequest();
      provideDummy<Result<ForgotPasswordResponse>>(Fail(Exception()));
      final expectedError = Fail<ForgotPasswordResponse>(Exception());

      when(mockForgetPasswordOnlineDatasource.forgotPassword(any))
          .thenAnswer((_) async => expectedError);

      final result = await forgetPasswordRepository.forgotPassword(request);

      expect(result, expectedError);
      verify(mockForgetPasswordOnlineDatasource.forgotPassword(request))
          .called(1);
      verifyNoMoreInteractions(mockForgetPasswordOnlineDatasource);
    });

    test('verifyResetPassword success on ForgetPasswordOnlineDatasource',
            () async {
          provideDummy<Result<VerifyPasswordResponse>>(
              Success(VerifyPasswordResponse()));
          final request = VerifyPasswordRequest();
          final response = VerifyPasswordResponse();
          final expectedResult = Success(response);

          when(mockForgetPasswordOnlineDatasource.verifyResetPassword(any))
              .thenAnswer((_) async => expectedResult);

          final result =
          await forgetPasswordRepository.verifyResetPassword(request);

          expect(result, expectedResult);
          verify(mockForgetPasswordOnlineDatasource.verifyResetPassword(request))
              .called(1);
          verifyNoMoreInteractions(mockForgetPasswordOnlineDatasource);
        });

    test('verifyResetPassword failure on ForgetPasswordOnlineDatasource',
            () async {
          final request = VerifyPasswordRequest();
          provideDummy<Result<VerifyPasswordResponse>>(Fail(Exception()));
          final expectedError = Fail<VerifyPasswordResponse>(Exception());

          when(mockForgetPasswordOnlineDatasource.verifyResetPassword(any))
              .thenAnswer((_) async => expectedError);

          final result =
          await forgetPasswordRepository.verifyResetPassword(request);

          expect(result, expectedError);
          verify(mockForgetPasswordOnlineDatasource.verifyResetPassword(request))
              .called(1);
          verifyNoMoreInteractions(mockForgetPasswordOnlineDatasource);
        });

    test('resetPassword success on ForgetPasswordOnlineDatasource', () async {
      provideDummy<Result<User?>>(Success(User()));
      final request = ResetPasswordRequest();
      final response = User();
      final expectedResult = Success(response);

      when(mockForgetPasswordOnlineDatasource.resetPassword(any))
          .thenAnswer((_) async => expectedResult);

      final result = await forgetPasswordRepository.resetPassword(request);

      expect(result, expectedResult);
      verify(mockForgetPasswordOnlineDatasource.resetPassword(request))
          .called(1);
      verifyNoMoreInteractions(mockForgetPasswordOnlineDatasource);
    });

    test('resetPassword failure on ForgetPasswordOnlineDatasource', () async {
      final request = ResetPasswordRequest();
      provideDummy<Result<User?>>(Fail(Exception()));
      final expectedError = Fail<User?>(Exception());

      when(mockForgetPasswordOnlineDatasource.resetPassword(any))
          .thenAnswer((_) async => expectedError);

      final result = await forgetPasswordRepository.resetPassword(request);

      expect(result, expectedError);
      verify(mockForgetPasswordOnlineDatasource.resetPassword(request))
          .called(1);
      verifyNoMoreInteractions(mockForgetPasswordOnlineDatasource);
    });
  });
}