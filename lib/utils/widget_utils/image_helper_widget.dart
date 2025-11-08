import 'package:flutter/material.dart';
import 'package:marketplaceapp/utils/utils.dart';

class ImageHelperWidget {

  static Widget assetImageWidget({
    required BuildContext context,
    required double height,
    required double width,
    required String imageString,
    BoxFit fit = BoxFit.cover,
  }) {
    return SizedBox(
      height: height.h(context),
      width: width.w(context),
      child: FittedBox(
        fit: fit,
        child: Image(
          image: AssetImage(imageString),
        ),
      ),
    );
  }


}