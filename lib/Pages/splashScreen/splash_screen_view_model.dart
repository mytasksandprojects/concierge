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
    //initialize interceptors
    _splashScreenService.initializeInterceptors();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      //first we will check language state if lang set in mobile storage set language if not navigate to choose lang screen.
      //and second we will check token to navigate user to home page if tokens exists in mobile storage otherwise navigate to login.
      _splashScreenService.getLang().then((valueLang) {
        if(valueLang!=null){
          //set language
          //check token
          _splashScreenService.getToken().then((valueToken) {
            if(valueToken !=null){
              //navigate to home screen
              Navigator.of(context).pushNamed(PageRouteName.main);
            }else {
              //navigate to login screen
              Navigator.of(context).pushNamed(PageRouteName.login);
            }
          });
        }else {
          //navigate to language screen

          //for testing we only navigate to home screen
          Navigator.of(context).pushNamed(PageRouteName.login);
        }
      });
    });
    super.init();
  }
}
