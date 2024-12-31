
import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/domain/repository/update_password_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdatePasswordUseCase {
  final UpdatePasswordRepository _updatePasswordRepository;
  UpdatePasswordUseCase(this._updatePasswordRepository);

  Future<Result<User?>> updatePassword(UpdatePasswordRequest request) async {
    return await _updatePasswordRepository.updatePassword(request);
  }
}
