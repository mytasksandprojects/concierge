import 'package:concierge/Configuration/PageRouteName.dart';
import 'package:concierge/Pages/Home/home_view.dart';
import 'package:concierge/Pages/splashScreen/splash_screen_service.dart';
import 'package:concierge/Widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:easy_localization/easy_localization.dart';

import '../Home/home_view_model.dart';

class SplashScreenViewModel extends ViewModel {
  final SplashScreenService _splashScreenService = SplashScreenService();

  @override
  void init() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      //here we will check language state.
      _splashScreenService.initializeInterceptors();

      Navigator.of(context).pushNamed(PageRouteName.login);
/*     Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomBar(views: [
       ChangeNotifierProvider(create: (context) => HomeViewModel(),child: Home(),),
       Container(),
       Container(),
       Container(),
     ]),));*/
    });
    super.init();
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soul_fit/models/client.dart';
import 'package:soul_fit/pages/splashScreen/splash_screen_service.dart';

class SplashScreenViewModel extends ChangeNotifier {
  SplashScreenService _splashScreenService = SplashScreenService();
  Client? user;
  String? token;
  Future<bool> getProfile() {
    return Future.value(true);
  }

  Future<String?> authenticate() {
    return getLangState();
  }

  void initializeInterceptors() {
    _splashScreenService.initializeInterceptors();
  }

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String?> getLangState() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString("lang") ?? null;
  }
}
*/
