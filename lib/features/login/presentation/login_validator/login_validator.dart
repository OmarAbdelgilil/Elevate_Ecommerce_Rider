import 'package:elevate_ecommerce_driver/features/login/presentation/login_validator/login_validator_types.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginValidator {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  void disposeFields() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  String? Function(String?) validate(LoginValidatorTypes type) {
    switch (type) {
      case LoginValidatorTypes.email:
        return _validateEmail();
      case LoginValidatorTypes.password:
        return _validatePassword();
      default:
        return (String? value) => null;
    }
  }

  String? Function(String?) _validateEmail() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return "Please enter an email address.";
      }
      if (!value.contains('@')) {
        return "This email is not valid";
      }
      return null;
    };
  }

  String? Function(String?) _validatePassword() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return "Please enter the password.";
      }
      if (value.length < 6) {
        return "Invalid password";
      }
      return null;
    };
  }
}
