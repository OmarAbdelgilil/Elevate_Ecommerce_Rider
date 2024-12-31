import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/login/data/contracts/online_data_source.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/repos/login_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final OnlineDataSource _onlineDataSource;
  final UserProvider _userProvider;
  LoginRepoImpl(this._onlineDataSource, this._userProvider);
  @override
  Future<Result<LoginResponse>> login(String email, String password) async {
    final result = await _onlineDataSource.login(email, password);
    switch (result) {
      case Success<LoginResponse>():
        _userProvider.login(result.data!.token!);
        return result;
      case Fail<LoginResponse>():
        return result;
    }
  }

  @override
  Future<Result<User>> getUserData() async {
    final result = await _onlineDataSource.getUserData();
    switch (result) {
      case Success<User>():
        _userProvider.setUser(result.data!);
        return result;
      case Fail<User>():
        return result;
    }
  }
}
