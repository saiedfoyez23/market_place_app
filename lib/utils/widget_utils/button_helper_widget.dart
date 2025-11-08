import 'package:flutter/material.dart';
import 'package:marketplaceapp/utils/utils.dart';


class ButtonHelperWidget {

  static Widget userChooseButtonWidget({
    required BuildContext context,
    required VoidCallback onPressed,
    required String title,
    required String description,
    required String imagePath,
    double? width = 428,
    double imageHeight = 40,
    double imageWidth = 40,
    double horizontalPadding = 16,
    double verticalPadding = 12,
    double spaceBetween = 12,
    Color backgroundColor = ColorUtils.orange241,
    Color borderColor = ColorUtils.orange213,
    Color textColor = ColorUtils.black64,
    double borderRadius = 12,
    double borderWidth = 1,
    double titleFontSize = 18,
    double descriptionFontSize = 12,
    FontWeight titleFontWeight = FontWeight.w600,
    FontWeight descriptionFontWeight = FontWeight.w400,
    MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment rowCrossAxisAlignment =  CrossAxisAlignment.start,
    MainAxisAlignment columnMainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment columnCrossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return Container(
      width: width?.w(context), // Using your .w extension
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding.lpm(context),
            verticalPadding.tpm(context),
            horizontalPadding.rpm(context),
            verticalPadding.bpm(context),
          ),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: rowMainAxisAlignment,
          crossAxisAlignment: rowCrossAxisAlignment,
          children: [
            ImageHelperWidget.assetImageWidget(
              context: context,
              height: imageHeight,
              width: imageWidth,
              imageString: imagePath,
            ),

            SpaceHelperWidget.h(spaceBetween.h(context)),

            Expanded(
              child: Column(
                mainAxisAlignment: columnMainAxisAlignment,
                crossAxisAlignment: columnCrossAxisAlignment,
                children: [
                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    fontSize: titleFontSize,
                    fontWeight: titleFontWeight,
                    textColor: textColor,
                    text: title,
                  ),

                  SpaceHelperWidget.v(6.h(context)),

                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    fontSize: descriptionFontSize,
                    fontWeight: descriptionFontWeight,
                    textColor: textColor,
                    text: description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  static Widget customButtonWidgetAdventPro({
    required BuildContext context,
    required VoidCallback onPressed,
    required String text,
    double? height,
    Color? backgroundColor,
    Color? textColor,
    Alignment? alignment,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    double? fontSize,
    FontWeight? fontWeight,
    bool isFullWidth = false,
    Widget? icon,
  }) {
    return Container(
      height: height?.h(context) ?? 56.h(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorUtils.orange119,
        borderRadius: BorderRadius.circular((borderRadius ?? 10).r(context)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.all(14.5.r(context)),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        child: TextHelperClass.headingTextWithoutWidthAdventPro(
          context: context,
          alignment: alignment ?? Alignment.center,
          fontSize: fontSize ?? 20,
          fontWeight: fontWeight ?? FontWeight.w700,
          textColor: textColor ?? ColorUtils.white251,
          text: text,
        ),
      ),
    );
  }



  static Widget customButtonWidget({
    required BuildContext context,
    required VoidCallback onPressed,
    required String text,
    double? height,
    Color? backgroundColor,
    Color? textColor,
    Alignment? alignment,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    double? fontSize,
    FontWeight? fontWeight,
    bool isFullWidth = false,
    Widget? icon,
  }) {
    return Container(
      height: height?.h(context) ?? 56.h(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorUtils.orange119,
        borderRadius: BorderRadius.circular((borderRadius ?? 10).r(context)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.all(14.5.r(context)),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        child: TextHelperClass.headingTextWithoutWidth(
          context: context,
          alignment: alignment ?? Alignment.center,
          fontSize: fontSize ?? 20,
          fontWeight: fontWeight ?? FontWeight.w700,
          textColor: textColor ?? ColorUtils.white251,
          text: text,
        ),
      ),
    );
  }







}