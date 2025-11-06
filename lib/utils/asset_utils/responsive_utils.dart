import 'package:flutter/material.dart';

class ResponsiveUtils {
  // Generalized method to calculate scaled dimension
  static double _getScaledDimension({
    required BuildContext context,
    required num value,
    required bool isHeight,
    required num portraitRef,
    required num landscapeRef,
  }) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final deviceSize = isHeight ? MediaQuery.sizeOf(context).height : MediaQuery.sizeOf(context).width;
    final designSize = isHeight ? DesignUtils.designHeight(context: context) : DesignUtils.designWidth(context: context);

    if (isPortrait && value == portraitRef) {
      return portraitRef * (deviceSize / designSize);
    } else if (!isPortrait && value == portraitRef) {
      return landscapeRef * (deviceSize / designSize);
    } else {
      return value * (deviceSize / designSize);
    }
  }

  static double getHeight({required BuildContext context, required num height}) {
    return _getScaledDimension(
      context: context,
      value: height,
      isHeight: true,
      portraitRef: 930,
      landscapeRef: 428,
    );
  }

  static double getWidth({required BuildContext context, required num width}) {
    return _getScaledDimension(
      context: context,
      value: width,
      isHeight: false,
      portraitRef: 428,
      landscapeRef: 930,
    );
  }

  static double getLeftMarginPadding({
    required BuildContext context,
    required num width,
  }) {
    return getWidth(context: context, width: width);
  }

  static double getRightMarginPadding({
    required BuildContext context,
    required num width,
  }) {
    return getWidth(context: context, width: width);
  }

  static double getTopMarginPadding({
    required BuildContext context,
    required num height,
  }) {
    return getHeight(context: context, height: height);
  }

  static double getBottomMarginPadding({
    required BuildContext context,
    required num height,
  }) {
    return getHeight(context: context, height: height);
  }

  static double getHorizontalMarginPadding({
    required BuildContext context,
    required num width,
  }) {
    return getWidth(context: context, width: width);
  }

  static double getVerticalMarginPadding({
    required BuildContext context,
    required num height,
  }) {
    return getHeight(context: context, height: height);
  }

  static double getFontWidth({
    required BuildContext context,
    required num fontSize,
  }) {
    return getWidth(context: context, width: fontSize);
  }

  static double getFontHeight({
    required BuildContext context,
    required num fontSize,
  }) {
    return getHeight(context: context, height: fontSize);
  }

  static double getRadiusWidth({
    required BuildContext context,
    required num radius,
  }) {
    return getWidth(context: context, width: radius);
  }

  static double getRadiusHeight({
    required BuildContext context,
    required num radius,
  }) {
    return getHeight(context: context, height: radius);
  }

  static double getFontSize({
    required BuildContext context,
    required num fontSize,
  }) {
    final fontHeight = getFontHeight(context: context, fontSize: fontSize);
    final fontWidth = getFontWidth(context: context, fontSize: fontSize);
    return fontHeight < fontWidth ? fontHeight : fontWidth;
  }

  static double getRadius({
    required BuildContext context,
    required num borderRadius,
  }) {
    final radiusHeight = getRadiusHeight(context: context, radius: borderRadius,);
    final radiusWidth = getRadiusWidth(context: context, radius: borderRadius);
    return radiusHeight < radiusWidth ? radiusHeight : radiusWidth;
  }
}

class DesignUtils {
  static num designHeight({required BuildContext context}) {
    return MediaQuery.of(context).orientation == Orientation.portrait ? 930 : 428;
  }

  static num designWidth({required BuildContext context}) {
    return MediaQuery.of(context).orientation == Orientation.portrait ? 428 : 930;
  }
}

extension ScreenUtils on num {
  double h(BuildContext context) {
    return ResponsiveUtils.getHeight(context: context, height: this);
  }

  double w(BuildContext context) {
    return ResponsiveUtils.getWidth(context: context, width: this);
  }

  double rpm(BuildContext context) {
    return ResponsiveUtils.getRightMarginPadding(context: context, width: this);
  }

  double lpm(BuildContext context) {
    return ResponsiveUtils.getLeftMarginPadding(context: context, width: this);
  }

  double tpm(BuildContext context) {
    return ResponsiveUtils.getTopMarginPadding(context: context, height: this);
  }

  double bpm(BuildContext context) {
    return ResponsiveUtils.getBottomMarginPadding(context: context, height: this,);
  }

  double vpm(BuildContext context) {
    return ResponsiveUtils.getVerticalMarginPadding(context: context, height: this,);
  }

  double hpm(BuildContext context) {
    return ResponsiveUtils.getHorizontalMarginPadding(context: context, width: this,);
  }

  double sp(BuildContext context) {
    return ResponsiveUtils.getFontSize(context: context, fontSize: this);
  }

  double r(BuildContext context) {
    return ResponsiveUtils.getRadius(context: context, borderRadius: this);
  }
}
