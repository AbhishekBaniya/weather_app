import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/features/presentation/pages/portfolio_screen.dart';

import 'config/res/strings.dart';
import 'core/utils/bool_manager.dart';
import 'core/utils/constants.dart';
import 'features/data/data_source/local_data_source/hive_manager.dart';
import 'features/presentation/app_routes/app_navigation_tracer.dart';
import 'features/presentation/app_routes/app_pages.dart';
import 'features/presentation/app_routes/app_routes.dart';
import 'features/presentation/bindings/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBindings().dependencies();
  BoolManager().setBool(Consts.debugBanner, false);
  //
  // Initialize Hive and the box
  await HiveManager().initHive();
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context,) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: BoolManager().getBool(Consts.debugBanner),
      initialBinding: AppBindings(),
      //darkTheme: AppTheme.dark,
      //theme: AppTheme.light,
      themeMode: ThemeMode.light,
      enableLog: true,
      useInheritedMediaQuery: true,
      smartManagement: SmartManagement.full,
      showPerformanceOverlay: false,
      textDirection: TextDirection.ltr,
      defaultGlobalState: true,
      transitionDuration: Duration.zero,
      popGesture: true,
      opaqueRoute: false,
      getPages: AppPages.pages,
      navigatorObservers: [NavigationTracer()],
      // Set the observer here
      title: Strings.appName,
      initialRoute: AppRoutes.home,
      home: PortfolioScreen(),
    );
  }
}
//In this portfolio project, I showcase my skills and expertise as a mobile developer through a collection of my most impressive and relevant projects. project includes a brief overview, my role and responsibilities, the tools and technologies used and any challenges and solutions I encountered.