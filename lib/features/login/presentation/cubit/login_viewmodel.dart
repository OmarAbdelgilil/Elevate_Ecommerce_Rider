import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/check_cached_user_use_case.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/get_cached_user_use_case.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/get_user_data_use_case.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/login_use_case.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/set_cached_user_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase loginUsecase;
  final SetCachedUserUseCase _setCachedUserUseCase;
  final CheckCachedUserUseCase _checkCachedUserUseCase;
  final GetCachedUserUseCase _getCachedUserUseCase;
  final GetUserDataUseCase _getUserDataUseCase;
  LoginViewModel(
      this.loginUsecase,
      this._setCachedUserUseCase,
      this._checkCachedUserUseCase,
      this._getCachedUserUseCase,
      this._getUserDataUseCase)
      : super(LoadingScreenState());

  Future<void> handleIntent(LoginScreenIntent intent) async {
    switch (intent) {
      case CheckCacheIntent():
        _checkCache();
      case LoginIntent():
        _handleLogin(intent);
    }
  }

  Future<void> _checkCache() async {
    final tokenFound = await _checkCachedUserUseCase.checkUser();
    switch (tokenFound) {
      case Success<String?>():
        if (tokenFound.data != null) {
          final getUser = await _getCachedUserUseCase.getUser();
          switch (getUser) {
            case Success<User?>():
              emit(LoggedInState());
              return;
            case Fail<User?>():
              emit(ErrorState(getUser.exception));
              return;
          }
        }
      case Fail<String?>():
        emit(ErrorState(tokenFound.exception));
        return;
    }
    emit(InitialState());
  }

  Future<void> _handleLogin(LoginIntent intent) async {
    emit(LoadingState());
    final result = await loginUsecase.login(intent.email, intent.password);
    switch (result) {
      case Success<LoginResponse>():
        final getUser = await _getUserDataUseCase.getUserData();
        switch (getUser) {
          case Success<User>():
            if (intent.rememberMe) {
              final cacheResult = await _setCachedUserUseCase.setUser(
                  UserProvider().user!, result.data!.token!);
              switch (cacheResult) {
                case Success<bool?>():
                  emit(SuccessState(result.data));
                  return;
                case Fail<bool?>():
                  emit(ErrorState(cacheResult.exception));
                  return;
              }
            }

          case Fail<User>():
            emit(ErrorState(getUser.exception));
            return;
        }
        emit(SuccessState(result.data));
        return;
      case Fail<LoginResponse>():
        emit(ErrorState(result.exception));
    }
  }
}

sealed class LoginScreenIntent {}

class CheckCacheIntent extends LoginScreenIntent {}

class LoginIntent extends LoginScreenIntent {
  final String email;
  final String password;
  final bool rememberMe;

  LoginIntent(
      {required this.email, required this.password, required this.rememberMe});
}

sealed class LoginState {}

class InitialState extends LoginState {}

class LoadingState extends LoginState {}

class LoadingScreenState extends LoginState {}

class LoggedInState extends LoginState {}

class ErrorState extends LoginState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends LoginState {
  LoginResponse? loginResponse;
  SuccessState(this.loginResponse);
}
