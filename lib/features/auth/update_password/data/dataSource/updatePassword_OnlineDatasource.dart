import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_request.dart';
import '../../../domain_auth/model/user.dart';

abstract class UpdatePasswordOnlineDatasource {
  Future<Result<User?>> updatePassword(UpdatePasswordRequest request);
}
