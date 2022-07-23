import 'package:concierge/Pages/RestPassword/rest_password_service.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class RestPasswordViewModel extends ViewModel {
  TextEditingController _emailController = TextEditingController();
  GlobalKey<FormFieldState> _emailKey = GlobalKey();
  String? _email;
  String? _message;

  String? get message => _message;

  set message(String? value) {
    _message = value;
    notifyListeners();
  }

  GlobalKey<FormFieldState> get emailKey => _emailKey;

  TextEditingController get emailController => _emailController;
  final RestPasswordService _restPasswordService = RestPasswordService();

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  @override
  void init() {
    super.init();
  }

  Future<bool> resetPassword() {
    return _restPasswordService.resendEmail(_email!).then((response) {
      if (response.data['detail'] != null) {
        message=response.data['detail'];
         return Future.value(true);
      } else
        message=response.data['email'];
        return Future.value(false);
    });
  }
}
