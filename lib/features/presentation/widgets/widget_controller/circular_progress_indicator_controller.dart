import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularProgressIndicatorController extends GetxController {
  var random = Random().obs;
  // Observable color variable
  //var indicatorColor = const Color(0xff2196F3).obs;
  var indicatorColor = const Color(0xffffffff).obs;

  var gradient = const LinearGradient(
    colors: [Colors.blue, Colors.green],
  ).obs;


  // Method to generate a random gradient
  void changeGradient() {
    Color startColor = Color.fromARGB(
      255,
      random.value.nextInt(256),
      random.value.nextInt(256),
      random.value.nextInt(256),
    );
    Color endColor = Color.fromARGB(
      255,
      random.value.nextInt(256),
      random.value.nextInt(256),
      random.value.nextInt(256),
    );

    gradient.value = LinearGradient(
      colors: [startColor, endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.repeated
    );
  }

  // Method to generate a random color
  void changeColor() {
    indicatorColor.value = Color.fromARGB(
      255, // Full opacity
      random.value.nextInt(256), // Random red value
      random.value.nextInt(256), // Random green value
      random.value.nextInt(256), // Random blue value
    );
  }
}