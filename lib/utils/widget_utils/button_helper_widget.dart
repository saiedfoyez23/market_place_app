import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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


  static Widget customIconButtonWidgetAdventPro({
    required BuildContext context,
    required VoidCallback onPressed,
    required String iconPath,
    required String text,
    Widget? textWidget,
    bool isIcon = true,
    double height = 56,
    double borderRadius = 10,
    Color? borderColor,
    double? borderWidth,
    Color textColor = ColorUtils.black61,
    double textSize = 18,
    FontWeight fontWeight = FontWeight.w700,
    double iconSize = 24,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      height: height.h(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
        ),
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(
            vertical: 14.5.vpm(context),
            horizontal: 14.5.hpm(context),
          ),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isIcon == true ? ImageHelperWidget.assetImageWidget(
              context: context,
              height: iconSize,
              width: iconSize,
              imageString: iconPath,
            ) : SizedBox.shrink(),

            isIcon == true ? SpaceHelperWidget.h(10.w(context)) : SizedBox.shrink(),

            textWidget ?? TextHelperClass.headingTextWithoutWidthAdventPro(
              context: context,
              alignment: Alignment.centerLeft,
              fontSize: textSize,
              fontWeight: fontWeight,
              textColor: textColor,
              text: text,
            ),
          ],
        ),
      ),
    );
  }



  static Widget customIconButtonWidget({
    required BuildContext context,
    required VoidCallback onPressed,
    required String iconPath,
    required String text,
    Widget? textWidget,
    bool isIcon = true,
    double height = 56,
    double borderRadius = 10,
    Color? borderColor,
    double? borderWidth,
    Color textColor = ColorUtils.black61,
    double textSize = 18,
    FontWeight fontWeight = FontWeight.w700,
    double iconSize = 24,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      height: height.h(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
        ),
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(
            vertical: 14.5.vpm(context),
            horizontal: 14.5.hpm(context),
          ),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isIcon == true ? ImageHelperWidget.assetImageWidget(
              context: context,
              height: iconSize,
              width: iconSize,
              imageString: iconPath,
            ) : SizedBox.shrink(),

            isIcon == true ? SpaceHelperWidget.h(10.w(context)) : SizedBox.shrink(),


            textWidget ?? TextHelperClass.headingTextWithoutWidth(
              context: context,
              alignment: Alignment.centerLeft,
              fontSize: textSize,
              fontWeight: fontWeight,
              textColor: textColor,
              text: text,
            ),
          ],
        ),
      ),
    );
  }


  static Widget customRichTextButton({
    required BuildContext context,
    required String normalText,
    required String highlightedText,
    required VoidCallback? onPressed,
    Alignment alignment = Alignment.center,
    Color normalTextColor = ColorUtils.blue96,
    Color highlightedTextColor = ColorUtils.blue196,
    double fontSize = 17,
    FontWeight normalTextWeight = FontWeight.w400,
    FontWeight highlightedTextWeight = FontWeight.w700,
    double lineHeight = 1.5,
    EdgeInsetsGeometry? padding,
  }) {
    return Align(
      alignment: alignment,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: fontSize.sp(context),
              fontWeight: normalTextWeight,
              color: normalTextColor,
              height: lineHeight,
            ),
            children: [
              TextSpan(text: normalText),
              TextSpan(
                text: highlightedText,
                style: GoogleFonts.poppins(
                  fontSize: fontSize.sp(context),
                  fontWeight: highlightedTextWeight,
                  color: highlightedTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }








}