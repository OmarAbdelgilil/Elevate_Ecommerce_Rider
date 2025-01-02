import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';

abstract class OfflineDataSource {
  Future<Result<String?>> checkUser();
  Future<Result<bool>> setUser(User user, String token);
  Future<Result<User>> getUser();
  Future<Result<bool>> clearUserData();
}
