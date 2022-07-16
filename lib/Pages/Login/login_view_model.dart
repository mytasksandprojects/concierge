import 'package:concierge/Pages/Login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class LoginViewModel extends ViewModel {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  GlobalKey<FormFieldState> _emailKey=GlobalKey();
  GlobalKey<FormFieldState> _passwordKey=GlobalKey();

  GlobalKey<FormFieldState> get emailKey => _emailKey;
  bool _secureText=true;
  String? _email;
  String? _password;

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  final LoginService _loginService=LoginService();
  set secureText(bool value) {
    _secureText = value;
    notifyListeners();
  }

  bool get secureText => _secureText;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get emailController => _emailController;
  @override
  void init() {
    super.init();
  }

  Future<bool> login(){
    return _loginService.login(_email!,_password!).then((response) {
      debugPrint('response login:');
      debugPrint(response.data.toString());
      if(response.data['access_token']!=null&&response.data['refresh_token']!=null){
        //set token and refresh token
        _loginService.setTokens(response.data['access_token'], response.data['refresh_token']);
        return Future.value(true);
      }
    return Future.value(false);
    });
  }

  set password(String? value) {
    _password = value;
    notifyListeners();
  }

  GlobalKey<FormFieldState> get passwordKey => _passwordKey;
}