import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/dataSource/updatePassword_OnlineDatasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/domain/repository/update_password_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdatePasswordRepository)
class UpdatePasswordRepositoryImpl implements UpdatePasswordRepository {
  final UpdatePasswordOnlineDatasource _updatePasswordOnlineDatasource;

  UpdatePasswordRepositoryImpl(
    this._updatePasswordOnlineDatasource,
  );

  @override
  Future<Result<User?>> updatePassword(UpdatePasswordRequest request) async {
    return await _updatePasswordOnlineDatasource.updatePassword(request);
  }
}
