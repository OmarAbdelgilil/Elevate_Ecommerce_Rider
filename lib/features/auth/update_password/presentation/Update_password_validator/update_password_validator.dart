import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/presentation/Update_password_validator/update_password_types_enum.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdatePasswordValidator {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _updatePasswordFormKey = GlobalKey<FormState>();
  TextEditingController get currentPasswordController =>
      _currentPasswordController;
  TextEditingController get newPasswordController => _newPasswordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  GlobalKey<FormState> get updatePasswordFormKey => _updatePasswordFormKey;

  void attachListeners(VoidCallback onFieldsChanged) {
    _currentPasswordController.addListener(onFieldsChanged);
    _newPasswordController.addListener(onFieldsChanged);
    _confirmPasswordController.addListener(onFieldsChanged);
  }

  void disposeFields() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
  }

  String? Function(String?) validate(UpdatePasswordValidTypes type) {
    switch (type) {
      case UpdatePasswordValidTypes.currentPassword:
        return _validateCurrentPassword();
      case UpdatePasswordValidTypes.newPassword:
        return _validatNewPassworde();
      case UpdatePasswordValidTypes.confirmPassword:
        return _validateConfirmPassword();
      default:
        return (String? value) {
          return null;
        };
    }
  }

  String? Function(String?) _validatNewPassworde() {
    return (String? value) {
      final RegExp passwordRegExp = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyNewPassword.tr();
      } else if (!passwordRegExp.hasMatch(value)) {
        return StringsManager.issuePasswordPattern;
      }
      return null;
    };
  }

  String? Function(String?) _validateConfirmPassword() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyPassword.tr();
      }
      if (_newPasswordController.text != value) {
        return StringsManager.issuePasswordNotMatch.tr();
      }
      return null;
    };
  }

  String? Function(String?) _validateCurrentPassword() {
    return (String? value) {
      final RegExp passwordRegExp = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyPassword.tr();
      } else if (!passwordRegExp.hasMatch(value)) {
        return StringsManager.issuePasswordPattern.tr();
      }
      return null;
    };
  }
}
