import 'package:all_validations_br/all_validations_br.dart';

class Validator {
  static bool isValidEmail(String? value) {
    if (AllValidations.isEmail(value!)) {
      return true;
    } else {
      return false;
    }
  }

  static bool isNumericOnly(String? value) {
    if (value != null && AllValidations.isNumericOnly(value)) {
      return true;
    } else {
      return false;
    }
  }
}

class PhoneNumberValidator {
  static bool isCorrectLength(String? value) {
    if (value != null && value.length == 11) {
      return true;
    } else {
      return false;
    }
  }

  static bool isNumericOnly(String? value) {
    if (value != null && AllValidations.isNumericOnly(value)) {
      return true;
    } else {
      return false;
    }
  }
}

class PasswordValidator {
  static const message = 'Password must be at least 8 minimum';

  static bool isCorrectLength(String? value) {
    if (value != null && value.length > 7) {
      return true;
    } else {
      return false;
    }
  }

  static bool isTheSame({
    required String text1,
    required String text2,
  }) {
    if (text1 == text2) {
      return true;
    } else {
      return false;
    }
  }
}
