import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget_controller/circular_progress_indicator_controller.dart';

class RandomColorProgressIndicator extends StatelessWidget {
  RandomColorProgressIndicator({super.key});
  // Instantiate the controller
  final controller = Get.put(CircularProgressIndicatorController());

  @override
  Widget build(BuildContext context) {
    controller.changeColor();
    controller.changeGradient();

    return Obx(
          () => ShaderMask(
            //shaderCallback: (Rect bounds) => controller.gradient.value.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height,),),
            shaderCallback: (Rect bounds) {
              // Calculate the center and radius for the circular mask
              final center = Offset(bounds.width/2,  bounds.height *2);
              final radius = bounds.height/2 ; // Or bounds.height / 2 if you prefer
              // Create a circular shape (circle inside the bounds)
              return controller.gradient.value.createShader(
                Rect.fromCircle(center: center, radius: radius),
              );
            },
            child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(controller.indicatorColor.value,),
                    strokeWidth: 4.0,
              color: controller.indicatorColor.value,
                  ),
          ),

    );
  }
}