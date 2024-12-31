import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_execution.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/auth/data/DTOs/user_dto.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/dataSource/updatePassword_OnlineDatasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdatePasswordOnlineDatasource)
class UpdatePasswordOnlineDatasourceImpl
    implements UpdatePasswordOnlineDatasource {
  final ApiManager apiManager;
  /*final TokenProvider tokenProvider;*/

  UpdatePasswordOnlineDatasourceImpl(this.apiManager, /*this.tokenProvider*/);

  @override
  Future<Result<User?>> updatePassword(UpdatePasswordRequest request) {
    return executeApi(() async {
      final token =" eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2NzcxZjFjZDlmMzg4NGIzNDA1YzQxZmEiLCJpYXQiOjE3MzU2MTIwMTJ9.jyajse32IRgDRCq4b12myUM494PDtfPkJaZhfJsNidE";
      if (token != null) {
        var result = await apiManager.updatePassword(request, 'Bearer$token');
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
