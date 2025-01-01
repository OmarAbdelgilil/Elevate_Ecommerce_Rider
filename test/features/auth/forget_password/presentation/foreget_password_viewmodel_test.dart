import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/domain/usecases/forget_password_usecase.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/presentation/foreget_password_viewmodel.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'foreget_password_viewmodel_test.mocks.dart';

@GenerateMocks([
  ForgetPasswordUsecase,
  ForgetPasswordValidator,
  FormState,
  GlobalKey<FormState>,
  TextEditingController
])
void main() {
  late ForegetPasswordViewmodel viewmodel;
  late MockForgetPasswordUsecase mockForgetPasswordUsecase;
  late MockForgetPasswordValidator mockForgetPasswordValidator;
  late MockFormState mockFormState;
  late MockTextEditingController mockTextEditingController;
  late MockGlobalKey<FormState> mockEmailFormKey;
  late MockGlobalKey<FormState> mockPasswordFormKey;
  setUp(
        () {
      mockForgetPasswordUsecase = MockForgetPasswordUsecase();
      mockForgetPasswordValidator = MockForgetPasswordValidator();
      mockFormState = MockFormState();
      mockEmailFormKey = MockGlobalKey<FormState>();
      mockPasswordFormKey = MockGlobalKey<FormState>();
      mockTextEditingController = MockTextEditingController();
      viewmodel = ForegetPasswordViewmodel(
          mockForgetPasswordUsecase, mockForgetPasswordValidator);

      when(mockForgetPasswordValidator.emailFormKey)
          .thenReturn(mockEmailFormKey);
      when(mockEmailFormKey.currentState).thenReturn(mockFormState);

      when(mockForgetPasswordValidator.passwordFormKey)
          .thenReturn(mockPasswordFormKey);
      when(mockPasswordFormKey.currentState).thenReturn(mockFormState);

      when(mockForgetPasswordValidator.emailController)
          .thenReturn(mockTextEditingController);
    },
  );
  group('ForgetPasswordViewmoel test', () {
    test('initial state is InitialState', () {
      expect(viewmodel.state, isA<InitialState>());
    });

    test(
      'doIntent with VerifyEmailIntent emits LoadingState, verifyOtp on Success',
          () {
        when(mockFormState.validate()).thenReturn(true);
        provideDummy<Result<ForgotPasswordResponse>>(
            Success<ForgotPasswordResponse>(ForgotPasswordResponse()));

        when(mockForgetPasswordUsecase.forgotPassword(any)).thenAnswer(
                (_) async =>
                Success<ForgotPasswordResponse>(ForgotPasswordResponse()));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<VerifyOtpState>()]),
        );

        viewmodel.doIntent(VerifyEmailIntent("email"));
      },
    );

    test(
      'doIntent with VerifyEmailIntent emits LoadingState, InitialState with exception on Fail',
          () {
        when(mockFormState.validate()).thenReturn(true);
        provideDummy<Result<ForgotPasswordResponse>>(
            Fail<ForgotPasswordResponse>(Exception()));

        when(mockForgetPasswordUsecase.forgotPassword(any))
            .thenAnswer((_) async => Fail<ForgotPasswordResponse>(Exception()));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<InitialState>()]),
        );

        viewmodel.doIntent(VerifyEmailIntent("email"));
      },
    );

    test(
      'doIntent with VerifyEmailIntent emits LoadingState, InitialState when emailformkey is invalid',
          () {
        when(mockFormState.validate()).thenReturn(false);
        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<InitialState>()]),
        );

        viewmodel.doIntent(VerifyEmailIntent("email"));
      },
    );

    test(
      'doIntent with VerifyOtpIntent emits LoadingState, ResetPasswordState on Success',
          () {
        provideDummy<Result<VerifyPasswordResponse>>(
            Success<VerifyPasswordResponse>(VerifyPasswordResponse()));

        when(mockForgetPasswordUsecase.verifyResetPassword(any)).thenAnswer(
                (_) async =>
                Success<VerifyPasswordResponse>(VerifyPasswordResponse()));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ResetPasswordState>()]),
        );

        viewmodel.doIntent(VerifyOtpIntent("email", "102382"));
      },
    );

    test(
      'doIntent with VerifyOtpIntent emits LoadingState, VerifyOtpState on Fail',
          () {
        provideDummy<Result<VerifyPasswordResponse>>(
            Fail<VerifyPasswordResponse>(Exception()));

        when(mockForgetPasswordUsecase.verifyResetPassword(any))
            .thenAnswer((_) async => Fail<VerifyPasswordResponse>(Exception()));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<VerifyOtpState>()]),
        );

        viewmodel.doIntent(VerifyOtpIntent("email", "102382"));
      },
    );

    test(
      'doIntent with ResetPasswordIntent emits LoadingState, SuccessState on Success',
          () {
        when(mockFormState.validate()).thenReturn(true);
        when(mockTextEditingController.text).thenReturn("");
        provideDummy<Result<User?>>(Success<User?>(User()));
        when(mockTextEditingController.text)
            .thenAnswer((_) => 'test@example.com');
        when(mockForgetPasswordUsecase.resetPassword(any))
            .thenAnswer((_) async => Success<User?>(User()));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<SuccessState>()]),
        );

        viewmodel.doIntent(ResetPasswordIntent("newPassword"));
      },
    );

    test(
      'doIntent with ResetPasswordIntent emits LoadingState, ResetPasswordState on Fail',
          () {
        when(mockFormState.validate()).thenReturn(true);
        when(mockTextEditingController.text).thenReturn("");
        provideDummy<Result<User?>>(Fail<User?>(Exception()));
        when(mockTextEditingController.text)
            .thenAnswer((_) => 'test@example.com');
        when(mockForgetPasswordUsecase.resetPassword(any))
            .thenAnswer((_) async => Fail<User?>(Exception()));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ResetPasswordState>()]),
        );

        viewmodel.doIntent(ResetPasswordIntent("newPassword"));
      },
    );

    test(
      'doIntent with ResetPasswordIntent emits LoadingState, ResetPasswordState when passwordformkey is invalid',
          () {
        when(mockFormState.validate()).thenReturn(false);
        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ResetPasswordState>()]),
        );

        viewmodel.doIntent(ResetPasswordIntent("newPassword"));
      },
    );
  });
}