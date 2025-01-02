import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/domain/repositories/forget_password_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUsecase {
  final ForgetPasswordRepository _forgetPasswordRepository;

  ForgetPasswordUsecase(this._forgetPasswordRepository);

  Future<Result<ForgotPasswordResponse>> forgotPassword(
      ForgotPasswordRequest request) async {
    return await _forgetPasswordRepository.forgotPassword(request);
  }

  Future<Result<VerifyPasswordResponse>> verifyResetPassword(
      VerifyPasswordRequest resetCode) async {
    return await _forgetPasswordRepository.verifyResetPassword(resetCode);
  }

  Future<Result<User?>> resetPassword(ResetPasswordRequest request) async {
    return await _forgetPasswordRepository.resetPassword(request);
  }
}
