import 'dart:io';
import 'package:flutter/foundation.dart';

class Dim {
  // Private constructor
  Dim._privateConstructor();

  // Singleton instance
  static final Dim _instance = Dim._privateConstructor();

  // Factory constructor to return the same instance
  factory Dim() {
    return _instance;
  }

  /// Int
  static int get intZero => 0;
  static int get intOne => 1;
  static int get intTwo => 2;
  static int get intThree => 3;
  static int get intFour => 4;
  static int get intFive => 5;
  static int get intSix => 6;
  static int get intSeven => 7;
  static int get intEight => 8;
  static int get intNine => 9;
  static int get intTen => 10;

  /// Double
  static double get doubleZero => 0.0;
  static double get doubleOne => 1.0;
  static double get doubleTwo => 2.0;
  static double get doubleThree => 3.0;
  static double get doubleFour => 4.0;
  static double get doubleFive => 5.0;
  static double get doubleSix => 6.0;
  static double get doubleSeven => 7.0;
  static double get doubleEight => 8.0;
  static double get doubleNine => 9.0;
  static double get doubleTen => 10.0;

  // General dimensions
  static double get paddingSmall => doubleEight;
  static double get paddingMedium => paddingSmall * 2;
  static double get paddingLarge => paddingSmall * 3;

  static double get marginSmall => paddingSmall;
  static double get marginMedium => marginSmall * 2;
  static double get marginLarge => marginSmall * 3;

  // Platform-specific dimensions
  static double get padding => _platformSpecificSize(paddingMedium);
  static double get margin => _platformSpecificSize(marginMedium);

  static double _platformSpecificSize(double defaultSize) {
    if (kIsWeb) {
      return defaultSize + 4.0; // Web: Slightly larger
    } else if (Platform.isAndroid || Platform.isIOS) {
      return defaultSize; // Mobile: Default size
    } else if (Platform.isMacOS) {
      return defaultSize + 2.0; // macOS: Slightly larger
    } else if (Platform.isWindows || Platform.isLinux) {
      return defaultSize + 6.0; // Desktop: Even larger
    } else {
      return defaultSize; // Fallback for unknown platforms
    }
  }
}
