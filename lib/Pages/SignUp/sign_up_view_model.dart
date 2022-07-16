import 'package:concierge/Models/User.dart';
import 'package:concierge/Pages/SignUp/sign_up_service.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class SignUpViewModel extends ViewModel {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _nameController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _passwordConfirmController=TextEditingController();
  TextEditingController _confirmationCodeController=TextEditingController();
  TextEditingController _mobileController=TextEditingController();
  DateTime currentDate=DateTime.now();
  TextEditingController get nameController => _nameController;
  GlobalKey<FormFieldState> _emailKey=GlobalKey();
  GlobalKey<FormFieldState> _password1Key=GlobalKey();
  GlobalKey<FormFieldState> _password2Key=GlobalKey();
  GlobalKey<FormFieldState> _confirmationCodeKey=GlobalKey();
  GlobalKey<FormFieldState> _namedKey=GlobalKey();
  GlobalKey<FormFieldState> _mobileKey=GlobalKey();

  TextEditingController get emailController => _emailController;

  GlobalKey<FormFieldState> get emailKey => _emailKey;
  bool _secureText=true;
  String? _email;
  String? _name;
  String? _password1;
  String? _password2;
  String? _mobile;
  String? _confirmationCode;
  SignUpService _signUpService=SignUpService();
  @override
  void init() {
    super.init();
  }
  Future<bool> signUp(){
    return _signUpService.signUp(UserModel(userName: _name,)).then((response) {
      debugPrint('response signup:');
      debugPrint(response.data.toString());
      return Future.value(false);
    });
  }
  TextEditingController get passwordController => _passwordController;


  GlobalKey<FormFieldState> get password1Key => _password1Key;

  TextEditingController get passwordConfirmController =>
      _passwordConfirmController;

  TextEditingController get confirmationCodeController =>
      _confirmationCodeController;

  TextEditingController get mobileController => _mobileController;

  bool get secureText => _secureText;

  set secureText(bool value) {
    _secureText = value;
    notifyListeners();
  }

  String? get email => _email;

  String? get password1 => _password1;

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  set password1(String? value) {
    _password1 = value;
    notifyListeners();
  }

  String? get confirmationCode => _confirmationCode;

  set confirmationCode(String? value) {
    _confirmationCode = value;
    notifyListeners();
  }

  String? get mobile => _mobile;

  set mobile(String? value) {
    _mobile = value;
    notifyListeners();
  }

  String? get password2 => _password2;

  set password2(String? value) {
    _password2 = value;
    notifyListeners();
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
    notifyListeners();
  }

  GlobalKey<FormFieldState> get password2Key => _password2Key;

  GlobalKey<FormFieldState> get confirmationCodeKey => _confirmationCodeKey;

  GlobalKey<FormFieldState> get namedKey => _namedKey;

  GlobalKey<FormFieldState> get mobileKey => _mobileKey;
}