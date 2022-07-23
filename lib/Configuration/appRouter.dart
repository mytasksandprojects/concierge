// ignore_for_file: prefer_const_constructors, file_names

import 'package:concierge/Pages/ChangeLang/change_lang_view.dart';
import 'package:concierge/Pages/ChangeLang/change_lang_view_model.dart';
import 'package:concierge/Pages/Home/home_view.dart';
import 'package:concierge/Pages/Home/home_view_model.dart';
import 'package:concierge/Pages/Login/login_view_model.dart';
import 'package:concierge/Pages/Main/main_view.dart';
import 'package:concierge/Pages/Main/main_view_model.dart';
import 'package:concierge/Pages/RestPassword/rest_password_view.dart';
import 'package:concierge/Pages/RestPassword/rest_password_view_model.dart';
import 'package:concierge/Pages/SignUp/sign_up_view.dart';
import 'package:concierge/Pages/SignUp/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import '../Pages/Login/login_view.dart';
import '../Pages/splashScreen/splash_screen_view.dart';
import '../Pages/splashScreen/splash_screen_view_model.dart';
import 'PageRouteName.dart';
class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>
              ChangeNotifierProvider(
                create: (context) => SplashScreenViewModel(),
                child: SplashScreen(),
              ),
        );
      case PageRouteName.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>
              ChangeNotifierProvider(
                create: (context) => LoginViewModel(),
                child: Login(),
              ),
        );
      case PageRouteName.signUp:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>
              ChangeNotifierProvider(
                create: (context) => SignUpViewModel(),
                child: SignUp(),
              ),
        );
      case PageRouteName.restPassword:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>
              ChangeNotifierProvider(
                create: (context) => RestPasswordViewModel(),
                child: RestPassword(),
              ),
        );
      case PageRouteName.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>
              ChangeNotifierProvider(
                create: (context) => HomeViewModel(),
                child: Home(),
              ),
        );
      case PageRouteName.main:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>
              ChangeNotifierProvider(
                create: (context) => MainViewModel(),
                child: Main(),
              ),
        );
      case PageRouteName.lang:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>
              ChangeNotifierProvider(
                create: (context) => ChangeLangViewModel(),
                child: ChangeLang(),
              ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>
              ChangeNotifierProvider(
                create: (context) => SplashScreenViewModel(),
                child: SplashScreen(),
              ),
        );
    }
  }
}
