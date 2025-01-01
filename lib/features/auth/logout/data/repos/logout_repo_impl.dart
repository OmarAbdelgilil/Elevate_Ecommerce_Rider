

import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/contracts/logout_online_datasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/models/logout_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/domain/repos/logout_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutRepo)
class LogoutRpoImpl implements LogoutRepo {
  final LogoutOnlineDatasource _logoutOnlineDatasource;
  LogoutRpoImpl(this._logoutOnlineDatasource);
  @override
  Future<Result<Logout?>> logout() {
    return _logoutOnlineDatasource.logout();
  }
}
