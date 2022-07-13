import 'package:flutter/material.dart';

class CustomColors {
  static const mainColor = Color(0xffD8AB4D);
  static const cardBackGround = Color(0xffFFFFFF);
  static RadialGradient mainGradient = const RadialGradient(
    //begin: Alignment.center,
    //end: Alignment.center,
    radius: 5,
    center: Alignment.center,
    stops: [0.0,0.3,0.8],
    colors: [
      Color(0xffF7E27C),
      Color(0xffE0B858),
      Color(0xffBD7A23),
    ],
  );
}
