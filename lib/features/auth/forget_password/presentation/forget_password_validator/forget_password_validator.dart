

import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/presentation/forget_password_validator/forget_password_validator_types_enum.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordValidator {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _emailFormKey = GlobalKey<FormState>();
  final _otpFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  GlobalKey<FormState> get emailFormKey => _emailFormKey;
  GlobalKey<FormState> get otpFormKey => _otpFormKey;
  GlobalKey<FormState> get passwordFormKey => _passwordFormKey;

  void disposeFields() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  String? Function(String?) validate(ForgetPasswordValidTypes type) {
    switch (type) {
      case ForgetPasswordValidTypes.email:
        return _validateEmail();
      case ForgetPasswordValidTypes.password:
        return _validatePassword();
      case ForgetPasswordValidTypes.confirmPassword:
        return _validateConfirmPassword();
      case ForgetPasswordValidTypes.otp:
      default:
        return (String? value) {
          return null;
        };
    }
  }

  String? Function(String?) _validateEmail() {
    return (String? value) {
      if (value != null && (value.isEmpty || !value.contains("@"))) {
        return StringsManager.issueValidEmail.tr();
      }
      return null;
    };
  }

  String? Function(String?) _validatePassword() {
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

  String? Function(String?) _validateConfirmPassword() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyPassword.tr();
      }
      if (_passwordController.text != value) {
        return StringsManager.issuePasswordNotMatch.tr();
      }
      return null;
    };
  }
}
