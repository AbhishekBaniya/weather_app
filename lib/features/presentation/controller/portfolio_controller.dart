
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_logger.dart';
import '../../domain/usecases/get_weather.dart';

class PortfolioController extends GetxController {
  final GetWeather getPortfolio;
  PortfolioController({required this.getPortfolio});

  var latitude = TextEditingController().obs;
  var longitude = TextEditingController().obs;
  Rx<double> windSpeed = 0.0.obs;
  Rx<int> windDegrees = 0.obs;
  Rx<int> temp= 0.obs;
  Rx<int> humidity= 0.obs;
  Rx<int> sunset= 0.obs;
  Rx<int> minTemp= 0.obs;
  Rx<int> cloudPct= 0.obs;
  Rx<int> feelsLike= 0.obs;
  Rx<int> sunrise= 0.obs;
  Rx<int> maxTemp= 0.obs;
  var isLoading = false.obs, isButtonPressed = false.obs;
  var hasError = false.obs;

  @override
  void onInit() {

    super.onInit();
    Logger().info("PortfolioController OnInit() Called");
  }

  @override
  void onReady() {
    super.onReady();
    Logger().info("PortfolioController onReady() Called");
  }

  @override
  void onClose() {
    super.onClose();
    Logger().info("PortfolioController onClose() Called");
  }

  void fetchWeather({required String lat, required String lon}) async {
    isLoading(true);
    final result = await getPortfolio(lat: lat, lon: lon);
    result.fold(
          (error) {
        hasError(true);
      },
          (success) {
            windSpeed.value = success.windSpeed ?? 0.0;
            windDegrees.value  = success.windDegrees ?? 0;
            temp.value = success.temp ?? 0;
            humidity.value= success.humidity ?? 0;
            sunset.value= success.sunset ?? 0;
            minTemp.value= success.minTemp ?? 0;
            cloudPct.value= success.cloudPct ?? 0;
            feelsLike.value= success.feelsLike ?? 0;
            sunrise.value= success.sunrise ?? 0;
            maxTemp.value= success.maxTemp ?? 0;
      },
    );
    isLoading(false);
  }
}
