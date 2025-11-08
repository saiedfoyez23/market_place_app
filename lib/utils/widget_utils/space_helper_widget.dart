import 'package:flutter/material.dart';

class SpaceHelperWidget {

  /// Horizontal Spacing
  static Widget h(double width) {
    return SizedBox(width: width);
  }

  /// Vertical Spacing
  static Widget v(double height) {
    return SizedBox(height: height);
  }

  /// Square Spacing (equal width & height)
  static Widget sq(double height,double width) {
    return SizedBox(width: width, height: height);
  }

}