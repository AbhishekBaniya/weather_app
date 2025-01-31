import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/portfolio_controller.dart';
import '../widgets/app_circular_indicator_widget.dart';
import '../widgets/app_text_widget.dart';

class PortfolioScreen extends StatelessWidget {
  PortfolioScreen({super.key});

  final PortfolioController controller = Get.put(PortfolioController(getPortfolio: Get.find()));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[

            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please type the Latitude above';
                }
              },
              controller: controller.latitude.value,
              maxLines: 1,
              onChanged: (value){},
              onSaved: (value){},
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: AppRichTextWidget().buildComplexRichText(textSpans: [const TextSpan(text: 'Enter Latitude')],),
                hintText: 'Type 17.99909',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8,),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please type the Longitude above';
                }
              },
              controller: controller.longitude.value,
              maxLines: 1,
              onChanged: (value){},
              onSaved: (value){},
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: AppRichTextWidget().buildComplexRichText(textSpans: [const TextSpan(text: 'Enter Longitude')],),
                hintText: 'Type 19.99909',
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 8,),

            ElevatedButton(
              onPressed: () {
                // Handle button press for sign in
                if(controller.latitude.value.text.isEmpty || controller.longitude.value.text.isEmpty){
                  Get.showSnackbar(
                    const GetSnackBar(
                      title: 'Error',
                      message: 'Please Fill The Data',
                      icon: Icon(Icons.error),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  controller.fetchWeather(lat: controller.latitude.value.text.trim(), lon: controller.longitude.value.text.trim());
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Fetch Weather"),
            ),

            const SizedBox(height: 8,),

            Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: RandomColorProgressIndicator(),);
                } else if (controller.hasError.value) {
                  return const Center(child: Text('Error loading Weather Data'));
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(alignment: Alignment.centerLeft, child: Text('WindSpeed : ${controller.windSpeed.value}')),
                      Align(alignment: Alignment.centerLeft, child: Text('WindDegrees : ${controller.windDegrees.value}')),
                      Align(alignment: Alignment.centerLeft, child: Text('Temp : ${controller.temp.value}')),
                      Align(alignment: Alignment.centerLeft, child: Text('Humidity : ${controller.humidity.value}')),
                      Align(alignment: Alignment.centerLeft, child: Text('Sunset : ${controller.sunset.value}')),
                      Align(alignment: Alignment.centerLeft, child: Text('MinTemp : ${controller.minTemp.value}')),
                      Align(alignment: Alignment.centerLeft, child: Text('CloudPct : ${controller.cloudPct.value}')),
                      Align(alignment: Alignment.centerLeft, child: Text('FeelsLike : ${controller.feelsLike.value}')),
                      Align(alignment: Alignment.centerLeft, child: Text('Sunrise : ${controller.sunrise.value}')),
                      Align(alignment: Alignment.centerLeft, child: Text('MaxTemp : ${controller.maxTemp.value}')),
                    ],
                  );
                }
              }),


          ],
        ),
      ),
    );
  }
}