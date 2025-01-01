import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_execution.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/auth/data/DTOs/user_dto.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/dataSource/updatePassword_OnlineDatasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdatePasswordOnlineDatasource)
class UpdatePasswordOnlineDatasourceImpl
    implements UpdatePasswordOnlineDatasource {
  final ApiManager apiManager;
  final UserProvider tokenProvider;

  UpdatePasswordOnlineDatasourceImpl(this.apiManager, this.tokenProvider);

  @override
  Future<Result<User?>> updatePassword(UpdatePasswordRequest request) {
    return executeApi(() async {
      final token = tokenProvider.token;
      if (token != null) {
        var result = await apiManager.updatePassword(request, 'Bearer $token');
        var user = result.user;
        var userDto =
        UserDto(isVerified: user?.isVerified, token: result.token);

        return userDto.toUser();
      } else {
        throw Exception("Token not found");
      }
    });
  }
}