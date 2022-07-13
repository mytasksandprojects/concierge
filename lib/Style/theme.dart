import 'package:flutter/material.dart';

import 'custom_colors.dart';

enum ThemeName { DARK, LIGHT }

class AppTheme {
  static final AppTheme _singleton = new AppTheme._internal();
  static ThemeName _themeName = ThemeName.DARK;

  factory AppTheme() {
    return _singleton;
  }

  AppTheme._internal();

  static void configure(ThemeName themeName) {
    _themeName = themeName;
  }

  ThemeData get appTheme {
    switch (_themeName) {
      case ThemeName.LIGHT:
        return _buildLightTheme();
      default:
        return _buildDarkTheme();
    }
  }

  ThemeData _buildDarkTheme() {
    final ThemeData base = new ThemeData.dark();
    const mainBlack = const Color(0xFF121212);
    const darkGrey = const Color(0xff989797);
    return base.copyWith(
    /*  colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: CustomColors.mainBlack,
          onPrimary: CustomColors.mainBlack,
          secondary: CustomColors.mainBlack,
          onSecondary: CustomColors.mainBlack,
          error: CustomColors.mainBlack,
          onError: CustomColors.mainBlack,
          background: CustomColors.mainBlack,
          onBackground: CustomColors.mainBlack,
          surface: CustomColors.mainBlack,
          onSurface: CustomColors.mainBlack),*/

      backgroundColor: CustomColors.mainColor,
      hoverColor: Color(0xff4D4D4D),
      appBarTheme: AppBarTheme(
        //  backgroundColor: CustomColors.appBarBackGround,
      //    foregroundColor: CustomColors.mainBlack
      ),
      tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.white,
       //   labelColor: CustomColors.cardBackGround,
          indicator: BoxDecoration()),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.white,
      ),
      brightness: Brightness.dark,
      //textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(backgroundColor: CustomColors.mainBlack),),
      //floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: CustomColors.whiteGrey, foregroundColor: CustomColors.mainBlack),
      secondaryHeaderColor: darkGrey,

      cardColor: CustomColors.cardBackGround,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
      ),
      errorColor: const Color(0xFFB00020),
      hintColor: Colors.white,
    //  textTheme: TextTheme(headline3: TextStyle(color: CustomColors.whiteGrey)),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        // backgroundColor: Colors.white.withOpacity(0.6),
        // elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(38.0),
              topRight: const Radius.circular(38.0)),
        ),
      ),
    );
  }

  ThemeData _buildLightTheme() {
    final ThemeData base = new ThemeData(
        brightness: Brightness.light, fontFamily: 'CrampsRegular-OV7od');
    const Color primaryColor = Color(0xff0c3859);
    return base.copyWith(
     // textTheme: TextTheme(headline1: TextStyle(color: CustomColors.cardBackGround)),
      primaryColor: primaryColor,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
     // cardColor: CustomColors.cardBackGround,
      //text color
      errorColor: const Color(0xFFB00020),

      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
