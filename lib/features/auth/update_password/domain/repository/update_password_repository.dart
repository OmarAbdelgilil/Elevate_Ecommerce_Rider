import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_request.dart';
import '../../../../../core/common/api_result.dart';

abstract class UpdatePasswordRepository {
  Future<Result<User?>> updatePassword(UpdatePasswordRequest request);
}
