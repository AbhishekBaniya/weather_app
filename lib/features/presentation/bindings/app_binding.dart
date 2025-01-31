import 'dart:developer';

import 'package:get/get.dart';

import '../../../config/res/colors.dart';
import '../../../core/network/dio_client.dart';
import '../../data/data_source/remote_data_source/weather_remote_data_source.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../../domain/usecases/get_weather.dart';
import '../controller/portfolio_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    /*// Inject DioClient first
    Get.put<DioClient>(DioClient());

    // Inject PortfolioRemoteDataSourceImpl which depends on DioClient
    Get.put<PortfolioRemoteDataSourceImpl>(
      PortfolioRemoteDataSourceImpl(Get.find<DioClient>()),
    );

    // Inject PortfolioRepositoryImpl which depends on PortfolioRemoteDataSourceImpl
    Get.put<PortfolioRepositoryImpl>(
      PortfolioRepositoryImpl(Get.find<PortfolioRemoteDataSourceImpl>()),
    );

    // Inject GetPortfolio which depends on PortfolioRepositoryImpl
    Get.put<GetPortfolio>(
      GetPortfolio(Get.find<PortfolioRepositoryImpl>()),
    );*/

    Get.put(ColorManager());
// Register DioClient first
    Get.lazyPut<DioClient>(() => DioClient());

// Register PortfolioRemoteDataSourceImpl which depends on DioClient
    Get.lazyPut<WeatherRemoteDataSourceImpl>(() =>
        WeatherRemoteDataSourceImpl(Get.find<DioClient>())
    );

// Register PortfolioRepositoryImpl which depends on PortfolioRemoteDataSourceImpl
    Get.lazyPut<WeatherRepositoryImpl>(() =>
        WeatherRepositoryImpl(Get.find<WeatherRemoteDataSourceImpl>())
    );

// Register GetPortfolio which depends on PortfolioRepositoryImpl
    Get.lazyPut<GetWeather>(() => GetWeather(Get.find<WeatherRepositoryImpl>()));

// Register PortfolioController which depends on GetPortfolio
    Get.lazyPut<PortfolioController>(() => PortfolioController(getPortfolio: Get.find<GetWeather>()));

  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    log('message');
  }
}