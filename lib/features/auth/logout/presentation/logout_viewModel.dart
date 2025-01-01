
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/local/hive/hive_manager.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/models/logout_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/domain/use_cases/logout_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutViewModel extends ChangeNotifier {
  final LogoutUsecase _logoutUsecase;
  bool _isLoggingOut = false;

  LogoutViewModel(this._logoutUsecase);

  bool get isLoggingOut => _isLoggingOut;


  Future<void> logout() async {
    _isLoggingOut = true;
    notifyListeners();

    final result = await _logoutUsecase.logout();
    print('Logout result: $result');
    _isLoggingOut = false;

    if (result is Success<Logout?>) {

      try {
        await HiveManager().clearUser();
        UserProvider().logout();
       /* Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);*/
      } on Exception catch (e) {
        print(e);
      }
    } else if (result is Fail) {
      print('Logout failed:');
    }

    notifyListeners();
  }


}