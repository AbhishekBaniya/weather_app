import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'dims.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get light => ThemeData.light(useMaterial3: true,).copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: ColorManager.primaryColor,
      accentColor: ColorManager.accentColor,
      errorColor: ColorManager.darkPrimaryColor,
      backgroundColor: ColorManager.textAndIconColor,
      brightness: Brightness.light,
      cardColor: ColorManager.lightPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primaryColor,
      foregroundColor: ColorManager.textAndIconColor,
      elevation: Dim.doubleEight,

      iconTheme: IconThemeData(
        color: ColorManager.lightPrimaryColor,
        size: Dim.doubleEight * Dim.doubleThree,
        weight: Dim.doubleEight * Dim.doubleThree,
      ),
    ),
    scaffoldBackgroundColor: ColorManager.textAndIconColor,
    buttonTheme: ButtonThemeData(
      shape: Border.all(
        color: ColorManager.darkPrimaryColor,
        style: BorderStyle.none,
        width: Dim.doubleTen * Dim.doubleTen + Dim.doubleTwo,
      ),
      disabledColor: ColorManager.dividerColor,
      focusColor: ColorManager.primaryColor[100],
      height: Dim.doubleTen * 12,
      splashColor: ColorManager.primaryColor[50],
      textTheme: ButtonTextTheme.accent,
      padding: EdgeInsets.all(Dim.padding,
      ),
    ),
    dividerColor: ColorManager.dividerColor,
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(
        ColorManager.darkPrimaryColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dim.padding,),
      ),
      splashRadius: Dim.doubleTwo,
    ),
    /*inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorManager.textAndIconColor, // Red background
      hintStyle: TextStyle(color: Colors.white), // White hint text
      labelStyle: TextStyle(color: Colors.white), // White label text
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // White border
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // White focused border
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // White enabled border
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),*/

    textTheme: TextTheme(
      headlineSmall: headlineSmall,
      headlineMedium: headlineMedium,
      headlineLarge: headlineLarge,

      titleSmall: titleSmall,
      titleMedium: titleMedium,
      titleLarge: titleLarge,

      bodySmall: bodySmall,
      bodyMedium: bodyMedium,
      bodyLarge: bodyLarge,

      labelSmall: labelSmall,
      labelMedium: labelSmall,
      labelLarge: labelSmall,

      displaySmall: labelSmall,
      displayMedium: labelSmall,
      displayLarge: labelSmall,
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
    switchTheme: SwitchThemeData(trackColor: WidgetStateProperty.resolveWith((value)=> ColorManager.darkPrimaryColor,),thumbColor: WidgetStateProperty.resolveWith((value)=> ColorManager.primaryColor,),),

    toggleButtonsTheme: ToggleButtonsThemeData(
      color: ColorManager.primaryColor,
      splashColor: ColorManager.primaryColor[300],
      disabledColor: ColorManager.dividerColor,),

    badgeTheme: BadgeThemeData(backgroundColor: ColorManager.lightPrimaryColor,),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorManager.lightPrimaryColor,
      elevation: Dim.doubleEight,
      shadowColor: ColorManager.dividerColor,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(Dim.doubleEight,),
      ),
    ),
  );

  static ThemeData get dark => ThemeData.light(useMaterial3: true,).copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: ColorManager.primaryColor,
      accentColor: ColorManager.accentColor,
      errorColor: ColorManager.darkPrimaryColor,
      backgroundColor: ColorManager.textAndIconColor,
      brightness: Brightness.light,
      cardColor: ColorManager.lightPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primaryColor,
      foregroundColor: ColorManager.textAndIconColor,
      elevation: Dim.doubleEight,
      iconTheme: IconThemeData(
        color: ColorManager.lightPrimaryColor,
        size: Dim.doubleEight * Dim.doubleThree,
        weight: Dim.doubleEight * Dim.doubleThree,
      ),
    ),
    scaffoldBackgroundColor: ColorManager.primaryTextColor,

    buttonTheme: ButtonThemeData(
      shape: Border.all(
        color: ColorManager.darkPrimaryColor,
        style: BorderStyle.none,
        width: Dim.doubleTen * Dim.doubleTen + Dim.doubleTwo,
      ),
      disabledColor: ColorManager.dividerColor,
      focusColor: ColorManager.primaryColor[100],
      height: Dim.doubleTen * 12,
      splashColor: ColorManager.primaryColor[50],
      textTheme: ButtonTextTheme.accent,
      padding: EdgeInsets.all(Dim.padding,),
    ),

    badgeTheme: BadgeThemeData(backgroundColor: ColorManager.lightPrimaryColor,),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorManager.lightPrimaryColor,
      elevation: Dim.doubleEight,
      shadowColor: ColorManager.dividerColor,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(Dim.doubleEight,),
      ),
    ),

    iconTheme: iconTheme,
  );

  // Define headline styles
  static TextStyle get headlineSmall => TextStyle(color: ColorManager.textAndIconColor, fontSize: 20, fontWeight: FontWeight.w400, fontFamily: 'Roboto',);
  static TextStyle get headlineMedium => TextStyle(color: ColorManager.textAndIconColor, fontSize: 24, fontWeight: FontWeight.w500, fontFamily: 'Roboto',);
  static TextStyle get headlineLarge => TextStyle(color: ColorManager.textAndIconColor, fontSize: 32, fontWeight: FontWeight.w600, fontFamily: 'Roboto',);


  //Define title styles

  static TextStyle get titleSmall =>  TextStyle(color: ColorManager.textAndIconColor, fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Roboto',);
  static TextStyle get titleMedium =>  TextStyle(color: ColorManager.textAndIconColor, fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Roboto',);
  static TextStyle get titleLarge =>  TextStyle(color: ColorManager.textAndIconColor, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Roboto',);

  // Define body styles
  static TextStyle get bodySmall =>  TextStyle(color: ColorManager.textAndIconColor, fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Roboto',);
  static TextStyle get bodyMedium =>  TextStyle(color: ColorManager.textAndIconColor, fontSize: 14, fontWeight: FontWeight.normal, fontFamily: 'Roboto',);
  static TextStyle get bodyLarge =>  TextStyle(color: ColorManager.textAndIconColor, fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Roboto',);

  // Define label styles
  static TextStyle get labelSmall =>  TextStyle(color: ColorManager.textAndIconColor, fontSize: 10, fontWeight: FontWeight.w400, fontFamily: 'Roboto',);
  static TextStyle get labelMedium =>  TextStyle(color: ColorManager.textAndIconColor, fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Roboto',);
  static TextStyle get labelLarge =>  TextStyle(color: ColorManager.textAndIconColor, fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Roboto',);

// Define display styles
  static TextStyle get displaySmall =>  TextStyle(color: ColorManager.textAndIconColor, fontSize: 36, fontWeight: FontWeight.w300, fontFamily: 'Roboto',);
  static TextStyle get displayMedium =>  TextStyle(color: ColorManager.textAndIconColor, fontSize: 48, fontWeight: FontWeight.w400, fontFamily: 'Roboto',);
  static TextStyle get displayLarge =>  TextStyle(color: ColorManager.textAndIconColor, fontSize: 60, fontWeight: FontWeight.w500, fontFamily: 'Roboto',);

  //IconTheme

  static IconThemeData get iconTheme {
    if (kIsWeb) {
      return  webTheme;// Web: Slightly larger
    } else if (Platform.isAndroid || Platform.isIOS) {
      return iosTheme; // Mobile: Default size
    } else if (Platform.isMacOS) {
      return macosTheme; // macOS: Slightly larger
    } else if (Platform.isWindows || Platform.isLinux) {
      return windowsTheme; // Desktop: Even larger
    } else {
      return defaultTheme; // Fallback for unknown platforms
    }
  }

  // iOS Theme
  static IconThemeData get iosTheme => IconThemeData(
        size: 24.0, // Default size for iOS icons
        color: ColorManager.accentColor, // Common iOS primary color
        opacity: 0.8,
    );


  // Web Theme
  static IconThemeData get webTheme => IconThemeData(
        size: 28.0, // Larger size for web visibility
        color: ColorManager.accentColor, // Neutral web color
        opacity: 1.0,

    );

  // macOS Theme
  static IconThemeData get macosTheme =>  IconThemeData(
        size: 20.0, // Smaller size typical for desktop UIs
        color: ColorManager.accentColor, // Subtle macOS style
        opacity: 0.9,
    );

  // Windows Theme
  static IconThemeData get windowsTheme => IconThemeData(
        size: 22.0, // Medium size for Windows apps
        color: ColorManager.accentColor, // Windows-style blue
        opacity: 1.0,

    );

  // Default Theme
  static IconThemeData get defaultTheme => IconThemeData(
        size: 24.0,
        color: ColorManager.accentColor,
        opacity: 1.0,

    );

}