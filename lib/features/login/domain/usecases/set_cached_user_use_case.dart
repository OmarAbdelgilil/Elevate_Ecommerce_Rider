import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/repos/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetCachedUserUseCase {
  final LoginRepo _loginRepo;
  SetCachedUserUseCase(this._loginRepo);

  Future<Result<bool?>> setUser(User user, String token) async {
    return await _loginRepo.setCachedUser(user, token);
  }
}
