import 'package:flutter/material.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorProfileViewButton {

  Widget vendorProfileViewButton({
    required BuildContext context,
    required String title,
    required String imagePath,
    required VoidCallback onTap,

    // Optional customizations
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    double? borderRadius,
    double? height,
    double? width,
    double? imageSize,
    double? fontSize,
    FontWeight? fontWeight,
    EdgeInsetsGeometry? padding,
    IconData? trailingIcon,
    double? trailingIconSize,
  }) {
    return Container(
      width: width ?? 428.w(context),
      height: height ?? 60.h(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorUtils.white240,
        borderRadius: BorderRadius.circular(borderRadius ?? 10.r(context)),
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(
            vertical: 16.vpm(context),
            horizontal: 16.hpm(context),
          ),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Image
            ImageHelperWidget.assetImageWidget(
              context: context,
              height: imageSize ?? 30.h(context),
              width: imageSize ?? 30.w(context),
              imageString: imagePath,
            ),

            SpaceHelperWidget.h(8.w(context)),

            // Title
            Expanded(
              child: TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                fontSize: fontSize?.sp(context) ?? 20.sp(context),
                fontWeight: fontWeight ?? FontWeight.w400,
                textColor: textColor ?? ColorUtils.black64,
                text: title,
              ),
            ),

            SpaceHelperWidget.h(8.w(context)),

            // Trailing Icon
            Icon(
              trailingIcon ?? Icons.arrow_forward_ios_rounded,
              size: trailingIconSize ?? 16.r(context),
              color: iconColor ?? ColorUtils.black64,
            ),
          ],
        ),
      ),
    );
  }



}