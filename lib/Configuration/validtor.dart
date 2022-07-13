
import 'constants.dart';

class AppValidator{

  static bool isEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    final exp = RegExp(Constants.emailPattern);
    return exp.hasMatch(email);
  }

  static bool isPassword(String? password) {
    if (password == null || password.isEmpty || password.length < 8) {
      return false;
    }
  return true;
    /*  final exp = RegExp(Constants.passwordPatternSpecial);
    final exp1 = RegExp(Constants.passwordPatternNumeric);

    return exp.hasMatch(password) || exp1.hasMatch(password);
  */
  }

}