
import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_execution.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/auth/data/DTOs/user_dto.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/contracts/forget_password_online_datasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordOnlineDatasource)
class ForgetPasswordOnlineDatasourceImpl
    implements ForgetPasswordOnlineDatasource {
  final ApiManager apiManager;
  ForgetPasswordOnlineDatasourceImpl(this.apiManager);

  @override
  Future<Result<ForgotPasswordResponse>> forgotPassword(
      ForgotPasswordRequest request) {
    return executeApi(() async {
      var result = await apiManager.forgotPassword(request);
      return result;
    });
  }

  @override
  Future<Result<VerifyPasswordResponse>> verifyResetPassword(
      VerifyPasswordRequest resetCode) {
    return executeApi(() async {
      var result = await apiManager.verifyResetPassword(resetCode);
      return result;
    });
  }

  @override
  Future<Result<User?>> resetPassword(ResetPasswordRequest request) {
    return executeApi(() async {
      var result = await apiManager.resetPassword(request);
      var user = result?.user;
      var userDto = UserDto(isVerified: user?.isVerified, token: result?.token);
      return userDto.toUser();

    });
  }
}
