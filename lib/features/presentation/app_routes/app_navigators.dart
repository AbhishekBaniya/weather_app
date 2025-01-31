import 'dart:developer';

import 'package:get/get.dart';

class AppNavigator {
  // Singleton pattern for easy access
  static final AppNavigator _instance = AppNavigator._internal();

  factory AppNavigator() => _instance;

  AppNavigator._internal();

  /// Navigate to a specific page
  void navigateTo(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  /// Navigate to a page and replace the current one
  void navigateToAndReplace(String route, {dynamic arguments}) {
    Get.offNamed(route, arguments: arguments);
  }

  /// Navigate to a page and remove all previous routes
  void navigateToAndRemoveAll(String route, {dynamic arguments}) {
    Get.offAllNamed(route, arguments: arguments);
  }

  /// Go back to the previous screen
  void goBack({required bool isBack}) {
    switch (isBack) {
      case true:
        Get.back();
        break;
      case false:
      // Handle if no previous screen exists
        Get.snackbar('Error', 'No screens to pop!');
        break;
      default:
        log(' invalid entry');
    }
  }

  /// Go back and pass result to the previous screen
  void goBackWithResult(dynamic result) {
    Get.back(result: result);
  }
}
