import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/repos/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCachedUserUseCase {
  final LoginRepo _loginRepo;
  GetCachedUserUseCase(this._loginRepo);

  Future<Result<User?>> getUser() async {
    return await _loginRepo.getCachedUser();
  }
}
