import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/repos/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckCachedUserUseCase {
  final LoginRepo _loginRepo;
  CheckCachedUserUseCase(this._loginRepo);

  Future<Result<String?>> checkUser() async {
    return await _loginRepo.checkCachedUser();
  }
}
