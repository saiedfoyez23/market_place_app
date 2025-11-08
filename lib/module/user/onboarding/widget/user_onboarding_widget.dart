import 'package:flutter/material.dart';
import '../../../../utils/utils.dart';

class UserOnboardingWidget {

  static Widget userPageViewWidget({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String description,
    double? imageHeight,
    double? imageWidth,
    double? topSpace,
    double? imageBottomSpace,
    double? titleBottomSpace,
    double? bottomSpace,
    double? horizontalPadding,
    double? titleFontSize,
    double? descriptionFontSize,
    FontWeight? titleFontWeight,
    FontWeight? descriptionFontWeight,
    Color? titleColor,
    Color? descriptionColor,
  }) {
    return Column(
      children: [
        SpaceHelperWidget.v((topSpace ?? 63).h(context)),

        ImageHelperWidget.assetImageWidget(
          context: context,
          height: imageHeight ?? 393,
          width: imageWidth ?? 428,
          imageString: imagePath,
        ),

        SpaceHelperWidget.v((imageBottomSpace ?? 48).h(context)),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: (horizontalPadding ?? 20).hpm(context)),
          child: Column(
            children: [
              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.center,
                textAlign: TextAlign.center,
                fontSize: titleFontSize ?? 26,
                fontWeight: titleFontWeight ?? FontWeight.w600,
                textColor: titleColor ?? ColorUtils.black48,
                text: title,
              ),

              SpaceHelperWidget.v((titleBottomSpace ?? 12).h(context)),

              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.center,
                textAlign: TextAlign.center,
                fontSize: descriptionFontSize ?? 17,
                fontWeight: descriptionFontWeight ?? FontWeight.w400,
                textColor: descriptionColor ?? ColorUtils.black96,
                text: description,
              ),
            ],
          ),
        ),

        SpaceHelperWidget.v((bottomSpace ?? 32).h(context)),
      ],
    );
  }

}