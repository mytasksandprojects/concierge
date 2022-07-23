import 'package:concierge/Pages/ChangeLang/change_lang_service.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class ChangeLangViewModel extends ViewModel{
  Locale? _chosenLang;

  Locale? get chosenLang => _chosenLang;

  set chosenLang(Locale? value) {
    _chosenLang = value;
    notifyListeners();
  }

  final ChangeLangService _changeLangService=ChangeLangService();

  changeLang(String lang){
    _changeLangService.changeLang(lang);
  }
}