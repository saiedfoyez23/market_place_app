import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marketplaceapp/utils/utils.dart';

class LoadingHelperWidget {

  static Widget loadingHelperWidget({
    required BuildContext context,
    double height = 56,
    double width = 438,
    Color backgroundColor = Colors.transparent,
    Color loaderColor = ColorUtils.orange119,
    double loaderSize = 30.0,
    double borderRadius = 6,
  }) {
    return Container(
      height: height.h(context),
      width: width.w(context),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: SpinKitFoldingCube(
          color: loaderColor,
          size: loaderSize,
        ),
      ),
    );
  }

  static Widget loadingHelper({
    Key? key,
    required Color color,
    double size = 30.0,
  }) {
    return Center(
      key: key,
      child: SpinKitFoldingCube(
        color: color,
        size: size,
      ),
    );
  }


}