import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/models/logout_response.dart';

abstract class LogoutOnlineDatasource {
  Future<Result<Logout?>> logout();
}
