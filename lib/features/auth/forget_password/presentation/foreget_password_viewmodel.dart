

import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/domain/usecases/forget_password_usecase.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForegetPasswordViewmodel extends Cubit<ForgetPasswordState> {
  ForgetPasswordUsecase forgetPasswordUsecase;
  ForgetPasswordValidator forgetPasswordValidator;
  ForegetPasswordViewmodel(
      this.forgetPasswordUsecase, this.forgetPasswordValidator)
      : super(InitialState(null));

  void doIntent(ForgetPasswordScreenIntent intent) {
    switch (intent) {
      case VerifyEmailIntent():
        {
          _checkEmail(intent);
        }
      case VerifyOtpIntent():
        {
          _verifyOtp(intent);
        }
      case ResetPasswordIntent():
        {
          _resetPassword(intent);
        }
    }
  }

  Future<void> _checkEmail(VerifyEmailIntent intent) async {
    emit(LoadingState());
    if (!forgetPasswordValidator.emailFormKey.currentState!.validate()) {
      emit(InitialState(null));
      return;
    }
    print(intent.email);
    var result = await forgetPasswordUsecase
        .forgotPassword(ForgotPasswordRequest(email: intent.email));
    switch (result) {
      case Success<ForgotPasswordResponse>():
        emit(VerifyOtpState(intent.email, null));
      case Fail<ForgotPasswordResponse>():
        emit(InitialState(result.exception));
    }
  }

  Future<void> _verifyOtp(VerifyOtpIntent intent) async {
    emit(LoadingState());
    var result = await forgetPasswordUsecase
        .verifyResetPassword(VerifyPasswordRequest(resetCode: intent.otp));
    switch (result) {
      case Success<VerifyPasswordResponse>():
        emit(ResetPasswordState(null));
      case Fail<VerifyPasswordResponse>():
        emit(VerifyOtpState(intent.email, result.exception));
    }
  }

  Future<void> _resetPassword(ResetPasswordIntent intent) async {
    emit(LoadingState());
    print(intent.newPassword);
    if (!forgetPasswordValidator.passwordFormKey.currentState!.validate()) {
      emit(ResetPasswordState(null));
      return;
    }
    var result = await forgetPasswordUsecase.resetPassword(ResetPasswordRequest(
        email: forgetPasswordValidator.emailController.text,
        newPassword: intent.newPassword));
    switch (result) {
      case Success<User?>():
        {
          forgetPasswordValidator.disposeFields();
          emit(SuccessState(result.data));
        }
      case Fail<User?>():
        {
          emit(ResetPasswordState(result.exception));
        }
    }
  }
}

sealed class ForgetPasswordScreenIntent {}

class VerifyEmailIntent extends ForgetPasswordScreenIntent {
  String email;
  VerifyEmailIntent(this.email);
}

class VerifyOtpIntent extends ForgetPasswordScreenIntent {
  String email;
  String otp;
  VerifyOtpIntent(this.email, this.otp);
}

class ResetPasswordIntent extends ForgetPasswordScreenIntent {
  String newPassword;
  ResetPasswordIntent(this.newPassword);
}

sealed class ForgetPasswordState {}

class InitialState extends ForgetPasswordState {
  Exception? error;
  InitialState(this.error);
}

class LoadingState extends ForgetPasswordState {}

class VerifyOtpState extends ForgetPasswordState {
  String? email;
  Exception? error;
  VerifyOtpState(this.email, this.error);
}

class ResetPasswordState extends ForgetPasswordState {
  Exception? error;
  ResetPasswordState(this.error);
}

class SuccessState extends ForgetPasswordState {
  User? user;
  SuccessState(this.user);
}
