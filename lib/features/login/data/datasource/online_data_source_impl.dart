import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/network/api_execution.dart';
import 'package:elevate_ecommerce_driver/core/network/api_manager.dart';
import 'package:elevate_ecommerce_driver/features/login/data/contracts/online_data_source.dart';
import 'package:elevate_ecommerce_driver/features/login/data/dtos/user_dto.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/request/login_request.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OnlineDataSource)
class OnlineDataSourceImpl implements OnlineDataSource {
  final ApiManager _apiManager;
  OnlineDataSourceImpl(this._apiManager);
  @override
  Future<Result<LoginResponse?>> login(String email, String pass) {
    return executeApi(() async {
      LoginRequest loginRequest = LoginRequest(email: email, password: pass);
      final result = await _apiManager.login(loginRequest);
      return result;
    });
  }

  @override
  Future<Result<User>> getUserData() {
    return executeApi(() async {
      final result = await _apiManager.getUserData();
      return UserDto.toEntity(result);
    });
  }
}
