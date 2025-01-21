import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';



class AppValidators {
  AppValidators._();

  static String? validateName(String? val) {
    if (val == null) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return StringsManager.validationsFieldRequired.tr();
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (int.tryParse(val.trim()) == null) {
      return StringsManager.validationsNumbersOnly.tr();
    } else if (val.trim().length != 11) {
      return StringsManager.validationsNumbersMustEqual11Digit.tr();
    } else {
      return null;
    }
  }

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val == null) {
      return StringsManager.validationsFieldRequired.tr();
      // return "Please enter an email";
    } else if (val.trim().isEmpty) {
      return StringsManager.validationsFieldRequired.tr();
      // return "Please enter an email";
    } else if (emailRegex.hasMatch(val) == false) {
      return StringsManager.validationsValidEmail.tr();
    } else {
      return null;
    }
  }

  static String? validateNationalID(String? val) {
    if (val == null) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (int.tryParse(val.trim()) == null) {
      return StringsManager.validationsNumbersOnly.tr();
    } else if (val.trim().length != 14) {
      return StringsManager.validationsNumbersMustEqual14Digit.tr();
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (val == null) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (val.trim().length < 8 || !passwordRegex.hasMatch(val.trim())) {
      return StringsManager.validationsPasswordSpecifications.tr();
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (val != password) {
      return StringsManager.validationsEnterTheSamePassword.tr();
    } else {
      return null;
    }
  }

  static String? validateLoginEmail(String? val) {
    if (val == null) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return StringsManager.validationsFieldRequired.tr();
    } else {
      return null;
    }
  }

  static String? validateLoginPassword(String? val) {
    if (val == null) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return StringsManager.validationsFieldRequired.tr();
    } else {
      return null;
    }
  }

  static String? validateLoginPhoneNumber(String? val) {
    if (val == null) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return StringsManager.validationsFieldRequired.tr();
    } else {
      return null;
    }
  }

  static String? validateLoginCountryCode(String? val) {
    if (val == null) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return StringsManager.validationsFieldRequired.tr();
    } else {
      return null;
    }
  }


  static String? validateNotEmpty(String? val) {
    if (val == null) {
      return StringsManager.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return StringsManager.validationsFieldRequired.tr();
    } else {
      return null;
    }
  }

}