
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/models/logout_response.dart';

abstract class LogoutRepo {
  Future<Result<Logout?>> logout();
  Future<Result<bool>> clearUserData();
}
