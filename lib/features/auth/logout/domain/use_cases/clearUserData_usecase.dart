import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/domain/repos/logout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClearUserDataUseCase {
  final LogoutRepo _logoutRepo;

  ClearUserDataUseCase(this._logoutRepo);

  Future<Result<bool>> clearUserData() async {
    return await _logoutRepo.clearUserData();
  }
}
