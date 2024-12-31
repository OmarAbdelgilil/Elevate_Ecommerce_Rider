import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';

abstract class OnlineDataSource {
  Future<Result<LoginResponse>> login(String email, String pass);
  Future<Result<User>> getUserData();
}
