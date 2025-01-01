import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';

abstract class LoginRepo {
  Future<Result<LoginResponse>> login(String email, String password);
  Future<Result<User>> getUserData();
  Future<Result<String?>> checkCachedUser();
  Future<Result<User>> getCachedUser();
  Future<Result<bool>> setCachedUser(User user, String token);
}
