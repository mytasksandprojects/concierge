import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:easy_localization/easy_localization.dart';
class HomeViewModel extends ViewModel {



  @override
  void init() {
    var height = MediaQuery.of(context).size.height;
    super.init();
  }
}
