

import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_execution.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/contracts/logout_online_datasource.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/models/logout_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutOnlineDatasource)
class LogoutOnlineDatasourceImpl implements LogoutOnlineDatasource {
  final ApiManager apiManager;

  LogoutOnlineDatasourceImpl(this.apiManager);
  @override
  Future<Result<Logout?>> logout() {
    final tokenProvider = UserProvider();
    return executeApi(() async {
      final token = tokenProvider.token;

      var result = await apiManager.logout('Bearer $token');
      return result;
    });
  }

}
