import 'dart:io';

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


  static Widget styledImage({
    required BuildContext context,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
    Color containerColor = ColorUtils.white217,
    double borderRadius = 10,
    String? imageAsset,
    String? imageUrl,
    String? imageFile,
  }) {
    ImageProvider? provider;

    if (imageFile != null && imageFile.isNotEmpty) {
      provider = FileImage(File(imageFile));
    } else if (imageUrl != null && imageUrl.isNotEmpty) {
      provider = NetworkImage(imageUrl);
    } else if (imageAsset != null && imageAsset.isNotEmpty) {
      provider = AssetImage(imageAsset);
    }

    return Container(
      height: height?.h(context),
      width: width?.w(context),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
      ),
      clipBehavior: Clip.antiAlias,
      child: provider != null ? Image(
        image: provider,
        fit: fit,
      ) : const SizedBox(), // Empty placeholder if no image
    );
  }


  static Widget circleImageHelperWidget({
    double? width,
    double? height,
    double size = 150,
    double radius = 75,
    double padding = 4.5,
    double? verticalPadding,
    double? horizontalPadding,
    Color backgroundColor = ColorUtils.orange213,
    ImageProvider? image,
    String? imageAsset,
    String? imageUrl,
    String? imageFile, // New parameter for file path
    Widget? placeholder,
    Widget? errorWidget,
    BoxFit fit = BoxFit.cover,
    bool showBorder = false,
    Color borderColor = Colors.transparent,
    double borderWidth = 2.0,
    List<BoxShadow>? shadow,
    Alignment imageAlignment = Alignment.center,
    BorderRadius? borderRadius, // New parameter for optional border radius
  }) {
    final effectiveWidth = width ?? size;
    final effectiveHeight = height ?? size;
    final effectiveVerticalPadding = verticalPadding ?? padding;
    final effectiveHorizontalPadding = horizontalPadding ?? padding;

    ImageProvider? getImageProvider() {
      if (image != null) return image;
      if (imageAsset != null && imageAsset.isNotEmpty) {
        return AssetImage(imageAsset);
      }
      if (imageUrl != null && imageUrl.isNotEmpty) {
        return NetworkImage(imageUrl);
      }
      if (imageFile != null && imageFile.isNotEmpty) {
        return FileImage(File(imageFile)); // Add import 'dart:io' at the top
      }
      return null;
    }

    Widget buildPlaceholder() {
      if (errorWidget != null) return errorWidget;
      if (placeholder != null) return placeholder;

      return Icon(
        Icons.person_outline,
        size: radius * 0.8,
        color: Colors.white54,
      );
    }

    // Determine the shape and borderRadius
    final bool isCircle = borderRadius == null;
    final BoxShape containerShape = isCircle ? BoxShape.circle : BoxShape.rectangle;
    Widget imageWidget;


    imageWidget = CircleAvatar(
      radius: radius,
      backgroundImage: getImageProvider(),
      backgroundColor: Colors.transparent,
      onBackgroundImageError: (exception, stackTrace) {
        debugPrint('Image load error: $exception');
      },
      child: getImageProvider() == null ? buildPlaceholder() : null,
    );


    return Container(
      width: effectiveWidth,
      height: effectiveHeight,
      padding: EdgeInsets.symmetric(
        vertical: effectiveVerticalPadding,
        horizontal: effectiveHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: containerShape,
        borderRadius: isCircle ? null : borderRadius , // Only used when shape is rectangle
        border: showBorder ? Border.all(
          color: borderColor,
          width: borderWidth,
        ) : null,
        boxShadow: shadow,
      ),
      child: imageWidget,
    );
  }


}