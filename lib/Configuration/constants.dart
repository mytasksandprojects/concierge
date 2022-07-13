class Constants {
  static const String emailPattern =
      r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
  static const String passwordPatternSpecial =
      r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$"; //Registration (1 upper case, 1 lower case, 1 special character) length = 8
  static const String passwordPatternNumeric =
      r"(?=^.{8,}$)(?=.*\\d)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$"; //Registration (1 upper case, 1 lower case, 1 number) length = 8
  static const applicationUserTypes = ['client', 'provider'];
}
