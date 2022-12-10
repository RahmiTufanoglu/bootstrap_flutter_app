import 'package:flutter/foundation.dart';

@immutable
class RegExHelper {
  const RegExHelper._();

  static final emailPattern = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static final passwordPattern = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  /*
  r'^
    (?=.*[A-Z])       // should contain at least one upper case
    (?=.*[a-z])       // should contain at least one lower case
    (?=.*?[0-9])      // should contain at least one digit
    (?=.*?[!@#\$&*~]) // should contain at least one Special character
    .{8,}             // Must be at least 8 characters in lengthA
  $
  */

  static bool isValidEmail(String email) {
    return emailPattern.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return passwordPattern.hasMatch(password);
  }
}

extension ValidationHelper on String {
  bool get isValidPassword => RegExHelper.isValidPassword(this);

  bool get isValidEmail => RegExHelper.isValidEmail(this);
}
