import 'package:flutter/material.dart';

extension FancyNum on num {
  // Create a SizedBox with width
  SizedBox get widthBox => SizedBox(width: toDouble());

  // Create a SizedBox with height
  SizedBox get heightBox => SizedBox(height: toDouble());

  // Create a SizedBox with both width and height
  SizedBox box({num? width, num? height}) => SizedBox(
    width: width?.toDouble() ?? toDouble(),
    height: height?.toDouble() ?? toDouble(),
  );
}

///To Use This
//60.widthBox, copy this line any use in your ui.
