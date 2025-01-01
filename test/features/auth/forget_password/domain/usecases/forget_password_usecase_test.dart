import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/reset_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/domain/repositories/forget_password_repository.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/domain/usecases/forget_password_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_usecase_test.mocks.dart';

@GenerateMocks([ForgetPasswordRepository])
void main() {
  late ForgetPasswordUsecase forgetPasswordUsecase;
  late MockForgetPasswordRepository mockForgetPasswordRepository;

  setUp(() {
    mockForgetPasswordRepository = MockForgetPasswordRepository();
    forgetPasswordUsecase = ForgetPasswordUsecase(mockForgetPasswordRepository);
    provideDummy<Result<ForgotPasswordResponse>>(
        Success(ForgotPasswordResponse()));
    provideDummy<Result<ForgotPasswordResponse>>(Fail(Exception()));
    provideDummy<Result<VerifyPasswordResponse>>(
        Success(VerifyPasswordResponse()));
    provideDummy<Result<VerifyPasswordResponse>>(Fail(Exception()));
    provideDummy<Result<ResetPasswordResponse>>(
        Success(ResetPasswordResponse()));
    provideDummy<Result<ResetPasswordResponse>>(Fail(Exception()));
    provideDummy<Result<User?>>(Success(User()));
    provideDummy<Result<User?>>(Fail(Exception()));
  });

  group('ForgetPasswordUsecase Tests', () {
    test('forgotPassword calls forgotPassword on ForgetPasswordRepository',
            () async {
          final successResult = Success(ForgotPasswordResponse());
          final request = ForgotPasswordRequest();
          when(mockForgetPasswordRepository.forgotPassword(any))
              .thenAnswer((_) async => successResult);

          final result = await forgetPasswordUsecase.forgotPassword(request);

          expect(result, successResult);
          verify(mockForgetPasswordRepository.forgotPassword(request)).called(1);
        });

    test('forgotPassword returns Fail when ForgetPasswordRepository fails',
            () async {
          final exception = Exception('Email not found');
          final failResult = Fail<ForgotPasswordResponse>(exception);
          final request = ForgotPasswordRequest();

          when(mockForgetPasswordRepository.forgotPassword(any))
              .thenAnswer((_) async => failResult);

          final result = await forgetPasswordUsecase.forgotPassword(request);

          expect(result, failResult);
          verify(mockForgetPasswordRepository.forgotPassword(request)).called(1);
        });

    test(
        'verifyResetPassword calls verifyResetPassword on ForgetPasswordRepository',
            () async {
          final successResult =
          Success<VerifyPasswordResponse>(VerifyPasswordResponse());
          final request = VerifyPasswordRequest();

          when(mockForgetPasswordRepository.verifyResetPassword(any))
              .thenAnswer((_) async => successResult);

          final result = await forgetPasswordUsecase.verifyResetPassword(request);

          expect(result, successResult);
          verify(mockForgetPasswordRepository.verifyResetPassword(request))
              .called(1);
        });

    test('verifyResetPassword returns Fail when ForgetPasswordRepository fails',
            () async {
          final exception = Exception('Invalid reset code');
          final failResult = Fail<VerifyPasswordResponse>(exception);
          final request = VerifyPasswordRequest();

          when(mockForgetPasswordRepository.verifyResetPassword(any))
              .thenAnswer((_) async => failResult);

          final result = await forgetPasswordUsecase.verifyResetPassword(request);

          expect(result, failResult);
          verify(mockForgetPasswordRepository.verifyResetPassword(request))
              .called(1);
        });

    test('resetPassword calls resetPassword on ForgetPasswordRepository',
            () async {
          const email = 'test@example.com';
          const newPassword = 'newPassword123';
          final mockUser = User(
            firstName: 'Test',
            lastName: 'User',
            email: email,
            password: newPassword,
            rePassword: newPassword,
            phone: '1234567890',
          );
          final successResult = Success(mockUser);
          final request = ResetPasswordRequest();

          when(mockForgetPasswordRepository.resetPassword(any))
              .thenAnswer((_) async => successResult);

          final result = await forgetPasswordUsecase.resetPassword(request);

          expect(result, successResult);
          verify(mockForgetPasswordRepository.resetPassword(request)).called(1);
        });

    test('resetPassword returns Fail when ForgetPasswordRepository fails',
            () async {
          final exception = Exception('Password reset failed');
          final failResult = Fail<User?>(exception);
          final request = ResetPasswordRequest();

          when(mockForgetPasswordRepository.resetPassword(request))
              .thenAnswer((_) async => failResult);

          final result = await forgetPasswordUsecase.resetPassword(request);

          expect(result, failResult);
          verify(mockForgetPasswordRepository.resetPassword(request)).called(1);
        });
  });
}