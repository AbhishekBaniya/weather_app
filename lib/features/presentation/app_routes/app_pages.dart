import 'package:get/get.dart';
import '../bindings/app_binding.dart';
import '../pages/portfolio_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      title: AppRoutes.home,
      name: AppRoutes.home,
      page: () => PortfolioScreen(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
  ];

  ///Future Implementation
  //static final unknownRoute = GetPage(name: AppRoutes.unknown, page: () => NotFoundPage());
}

///auth_middleware.dart
/*class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isAuthenticated = false; // Add your logic here
    return !isAuthenticated ? RouteSettings(name: route*//*AppRoutes.login*//*) : null;
  }
}*/
