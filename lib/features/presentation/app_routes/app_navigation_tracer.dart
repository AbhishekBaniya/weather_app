import 'package:get/get.dart';

import '../../../core/utils/app_logger.dart';

class NavigationTracer extends GetObserver {
  // Singleton instance
  static final NavigationTracer _instance = NavigationTracer._internal();

  factory NavigationTracer() {
    return _instance;
  }

  NavigationTracer._internal();

  void onRouteChange(String? currentRoute, String? previousRoute) {
    onRouteChange(currentRoute, previousRoute);
    logRouteChange(currentRoute, previousRoute);
  }

  // Log route changes
  void logRouteChange(String? currentRoute, String? previousRoute) {
    Logger().info(
        'Navigated to: $currentRoute, from: $previousRoute'); // Using Logger for tracing
  }

  /// Navigate to a specific page with tracing
  void navigateTo(String route, {dynamic arguments}) {
    Logger().info('Navigating to: $route');
    Get.toNamed(route, arguments: arguments);
  }

  /// Navigate and replace the current page with tracing
  void navigateToAndReplace(String route, {dynamic arguments}) {
    Logger().info('Navigating and replacing with: $route');
    Get.offNamed(route, arguments: arguments);
  }

  /// Navigate and remove all previous routes with tracing
  void navigateToAndRemoveAll(String route, {dynamic arguments}) {
    Logger().info('Navigating to and removing all previous: $route');
    Get.offAllNamed(route, arguments: arguments);
  }

  /// Go back with tracing
  void goBack({required bool isBack}) {
    if (isBack) {

    } else {
    }
      switch (isBack) {
        case true:
          Logger().info('Going back to the previous screen');
          Get.back();
          break;
        case false:

          Logger().error('No screens to pop!');
        // Handle if no previous screen exists
          Get.snackbar('Error', 'No screens to pop!');
          break;
        default:
          Logger().error(' invalid entry');
    }
  }

  /// Go back and pass result to the previous screen with tracing
  void goBackWithResult(dynamic result) {
    Logger().info('Going back with result: $result');
    Get.back(result: result);
  }
}
