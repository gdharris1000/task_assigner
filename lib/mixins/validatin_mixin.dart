import 'package:email_validator/email_validator.dart';

class ValidationMixin {
  String emailValidator(email) {
    if (!EmailValidator.validate(email)) {
      return 'Invalid e-mail address';
    }
    return null;
  }

  String passwordValidator(password) {
    if (password.length < 8) {
      return 'Password is too short';
    }
    return null;
  }
}
