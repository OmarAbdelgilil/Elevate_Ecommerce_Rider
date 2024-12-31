

import 'package:elevate_ecommerce_driver/core/common/api_result.dart';
import 'package:elevate_ecommerce_driver/features/auth/domain_auth/model/user.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/domain/useCases/update_password_useCase.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/presentation/Update_password_validator/update_password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdatePasswordViewModel extends Cubit<UpdatePasswordState> {
  final UpdatePasswordUseCase updatePasswordUseCase;
  final UpdatePasswordValidator updatePasswordValidator;
  /*final LogoutUsecase logoutUsecase;*/

  UpdatePasswordViewModel(this.updatePasswordUseCase,
      this.updatePasswordValidator)
      : super(InitialState()) {
    updatePasswordValidator.attachListeners(_onFieldsChanged);
  }

  final ValueNotifier<bool> fieldsFilledNotifier = ValueNotifier(false);

  void _onFieldsChanged() {
    fieldsFilledNotifier.value =
        updatePasswordValidator.currentPasswordController.text.isNotEmpty &&
            updatePasswordValidator.newPasswordController.text.isNotEmpty &&
            updatePasswordValidator.confirmPasswordController.text.isNotEmpty;
  }

  void doIntent(UpdatePasswordScreenIntent intent) {
    switch (intent) {
      case UpdatePasswordIntent():
        _updatePassword(intent);
        break;
      case CheckfieldsInent():
        _checkfields();
        break;
    }
  }

  void _updatePassword(UpdatePasswordIntent intent) async {
    emit(LoadingState());
    if (!updatePasswordValidator.updatePasswordFormKey.currentState!
        .validate()) {
      emit(ErrorState(Exception("Invalid input")));
      return;
    }
    var result =
        await updatePasswordUseCase.updatePassword(UpdatePasswordRequest(
      newPassword: updatePasswordValidator.newPasswordController.text,
      password: updatePasswordValidator.currentPasswordController.text,
    ));

    switch (result) {
      case Success<User?>():
/*        TokenProvider().saveToken(result.data!.token!);
        await logoutUsecase.logout();
        final token = TokenProvider().token;
        HiveService().clearUser(token!);
        UserProvider().clearUserData();
        TokenProvider().clearToken();
        TokenStorage().deleteToken();*/

        emit(SuccessState(result.data));
        break;
      case Fail<User?>():
        print("Change Password failed: ${result.exception}");
        emit(ErrorState(result.exception));
        break;
    }
  }

  void _checkfields() {
    fieldsFilledNotifier.value =
        updatePasswordValidator.newPasswordController.text.isNotEmpty &&
            updatePasswordValidator.currentPasswordController.text.isNotEmpty &&
            updatePasswordValidator.confirmPasswordController.text.isNotEmpty;
  }
}

sealed class UpdatePasswordScreenIntent {}

class UpdatePasswordIntent extends UpdatePasswordScreenIntent {
  String password;
  String newPassword;

  UpdatePasswordIntent(this.password, this.newPassword);
}

class CheckfieldsInent extends UpdatePasswordScreenIntent {}

sealed class UpdatePasswordState {}

class InitialState extends UpdatePasswordState {}

class LoadingState extends UpdatePasswordState {}

class ErrorState extends UpdatePasswordState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends UpdatePasswordState {
  User? user;
  SuccessState(this.user);
}
