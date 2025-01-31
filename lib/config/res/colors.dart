import 'package:flutter/material.dart';

class ColorManager {
  // Step 1: Private static instance variable
  static final ColorManager _instance = ColorManager._internal();

  // Step 2: Private named constructor
  ColorManager._internal();

  // Step 3: Public factory constructor to return the same instance every time
  factory ColorManager() {
    return _instance;
  }

  // Define color constants (you can add more colors here)
  static Color get darkPrimaryColor => const Color(0xffD32F2F);
  static Color get lightPrimaryColor => const Color(0xffFFCDD2);
  static Color get primaryTextColor => const Color(0xff212121);
  static Color get secondaryTextColor => const Color(0xff757575);
  static Color get textAndIconColor => const Color(0xffFFFFFF);
  static Color get accentColor => const Color(0xffFF5252);
  static Color get dividerColor => const Color(0xffBDBDBD);


  static MaterialColor get primaryColor => const MaterialColor(0xffF44336, {
    50: Color(0xffffebee),
    100: Color(0xffffcdd2),
    200: Color(0xffef9a9a),
    300: Color(0xffe57373),
    400: Color(0xffef5350),
    500: Color(0xfff44336),
    600: Color(0xffe53935),
    700: Color(0xffd32f2f),
    800: Color(0xffc62828),
    900: Color(0xffb71c1c),
  },);

}