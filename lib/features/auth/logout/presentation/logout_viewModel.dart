
import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/local/hive/hive_manager.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/data/models/logout_response.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/domain/use_cases/clearUserData_usecase.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/domain/use_cases/logout_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutViewModel extends ChangeNotifier {
  final LogoutUsecase _logoutUsecase;
  final ClearUserDataUseCase _clearUserDataUseCase;
  bool _isLoggingOut = false;

  LogoutViewModel(this._logoutUsecase,this._clearUserDataUseCase);

  bool get isLoggingOut => _isLoggingOut;

  Future<void> clearUserData() async {
    final result = await _clearUserDataUseCase.clearUserData();
    switch (result) {
      case Success<bool>():
        UserProvider().logout();
        break;
      case Fail<bool>():
        print('failed to clear user data');
        break;
    }
  }
  Future<void> logout() async {
    _isLoggingOut = true;
    notifyListeners();

    final result = await _logoutUsecase.logout();
    print('Logout result: $result');
    _isLoggingOut = false;

    if (result is Success<Logout?>) {

      try {
        clearUserData();
      } on Exception catch (e) {
        print(e);
      }
    } else if (result is Fail) {
      print('Logout failed:');
    }

    notifyListeners();
  }


}