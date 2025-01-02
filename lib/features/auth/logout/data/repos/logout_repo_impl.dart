

import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/contracts/logout_online_datasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/models/logout_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/domain/repos/logout_repo.dart';
import 'package:elevate_ecommerce_driver/features/login/data/contracts/offline_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutRepo)
class LogoutRpoImpl implements LogoutRepo {
  final LogoutOnlineDatasource _logoutOnlineDatasource;
  final OfflineDataSource _offlineDataSource;
  LogoutRpoImpl(this._logoutOnlineDatasource,this._offlineDataSource);
  @override
  Future<Result<Logout?>> logout() {
    return _logoutOnlineDatasource.logout();
  }

  @override
  Future<Result<bool>> clearUserData() async {
    return await _offlineDataSource.clearUserData();
  }
}
