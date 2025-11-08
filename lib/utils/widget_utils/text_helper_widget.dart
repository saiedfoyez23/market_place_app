import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplaceapp/utils/utils.dart';

class TextHelperClass {

  /// Custom text widget with transparent container, alignment, and size controls

  static Widget headingText({
    required BuildContext context,
    required String text,
    double width = 428,
    Alignment alignment = Alignment.centerLeft,
    Color containerColor = Colors.transparent,
    TextAlign textAlign = TextAlign.start,
    double fontSize = 24,
    Color textColor = const Color.fromRGBO(35, 47, 48, 1),
    FontWeight fontWeight = FontWeight.w700,
    FontStyle fontStyle = FontStyle.normal,
    TextOverflow textOverFlow = TextOverflow.visible,
    // Container styling parameters
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    // Shape parameters
    BoxShape boxShape = BoxShape.rectangle,
    double? circleDiameter,
    // Border parameters - optional for both shapes
    bool hasBorder = false,
    Color borderColor = Colors.black,
    double borderWidth = 1.0,
    // Gradient parameters
    Gradient? gradient,
    List<Color>? gradientColors,
    AlignmentGeometry gradientBegin = Alignment.topLeft,
    AlignmentGeometry gradientEnd = Alignment.bottomRight,
  }) {
    final EdgeInsetsGeometry actualPadding = padding ?? EdgeInsets.zero;

    final double containerWidth = boxShape == BoxShape.circle
        ? (circleDiameter ?? width.w(context))
        : width.w(context);

    final double? containerHeight = boxShape == BoxShape.circle
        ? (circleDiameter ?? width.w(context)) // Use .w(context) for consistency
        : null;

    // Create gradient if provided
    final Gradient? actualGradient = gradient ?? (gradientColors != null ?
    LinearGradient(
      colors: gradientColors,
      begin: gradientBegin,
      end: gradientEnd,
    ) : null);

    return Container(
      width: containerWidth.w(context),
      height: containerHeight?.h(context),
      alignment: boxShape == BoxShape.circle ? Alignment.center : alignment,
      decoration: BoxDecoration(
        color: actualGradient != null ? null : containerColor,
        gradient: actualGradient,
        borderRadius: boxShape == BoxShape.rectangle ? borderRadius : null,
        shape: boxShape,
        border: hasBorder ? Border.all(
          color: borderColor,
          width: borderWidth.w(context), // Added .w(context) for responsive border width
        ) : null,
      ),
      padding: actualPadding,
      child: boxShape == BoxShape.circle ?
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          text,
          overflow: textOverFlow,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: fontSize.sp(context),
            color: textColor,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
          ),
        ),
      ) :
      Text(
        text,
        overflow: textOverFlow,
        textAlign: textAlign,
        style: GoogleFonts.poppins(
          fontSize: fontSize.sp(context),
          color: textColor,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        ),
      ),
    );
  }


  static Widget headingTextWithoutWidth({
    required BuildContext context,
    required String text,
    Alignment alignment = Alignment.centerLeft,
    Color containerColor = Colors.transparent,
    TextAlign textAlign = TextAlign.start,
    double fontSize = 24,
    Color textColor = const Color.fromRGBO(35, 47, 48, 1),
    FontWeight fontWeight = FontWeight.w700,
    FontStyle fontStyle = FontStyle.normal,
    TextOverflow textOverFlow = TextOverflow.visible,
    // Container styling parameters
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    // Shape parameters
    BoxShape boxShape = BoxShape.rectangle,
    double? circleDiameter,
    // Border parameters
    bool hasBorder = false,
    Color borderColor = Colors.black,
    double borderWidth = 1.0,
    // Gradient parameters - optional
    Gradient? gradient,
    List<Color>? gradientColors,
    AlignmentGeometry gradientBegin = Alignment.topLeft,
    AlignmentGeometry gradientEnd = Alignment.bottomRight,
  }) {

    final EdgeInsetsGeometry actualPadding = padding ?? EdgeInsets.zero;

    final Gradient? actualGradient = gradient ?? (gradientColors != null ?
    LinearGradient(
      colors: gradientColors,
      begin: gradientBegin,
      end: gradientEnd,
    ) : null);

    return Container(
      width: boxShape == BoxShape.circle ? (circleDiameter ?? 48) : null,
      height: boxShape == BoxShape.circle ? (circleDiameter ?? 48) : null,
      alignment: boxShape == BoxShape.circle ? Alignment.center : alignment,
      decoration: BoxDecoration(
        color: actualGradient != null ? null : containerColor,
        gradient: actualGradient,
        borderRadius: boxShape == BoxShape.rectangle ? borderRadius : null,
        shape: boxShape,
        border: hasBorder ?
        Border.all(
          color: borderColor,
          width: borderWidth.w(context),
        ) : null,
      ),
      padding: actualPadding,
      child: boxShape == BoxShape.circle ?
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          overflow: textOverFlow,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: fontSize.sp(context),
            color: textColor,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
          ),
        ),
      ) :
      Text(
        text,
        overflow: textOverFlow,
        textAlign: textAlign,
        style: GoogleFonts.poppins(
          fontSize: fontSize.sp(context),
          color: textColor,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        ),
      ),
    );
  }


  static Widget headingTextWithoutWidthAdventPro({
    required BuildContext context,
    required String text,
    Alignment alignment = Alignment.centerLeft,
    Color containerColor = Colors.transparent,
    TextAlign textAlign = TextAlign.start,
    double fontSize = 24,
    Color textColor = const Color.fromRGBO(35, 47, 48, 1),
    FontWeight fontWeight = FontWeight.w700,
    FontStyle fontStyle = FontStyle.normal,
    TextOverflow textOverFlow = TextOverflow.visible,
    // Container styling parameters
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    // Shape parameters
    BoxShape boxShape = BoxShape.rectangle,
    double? circleDiameter,
    // Border parameters
    bool hasBorder = false,
    Color borderColor = Colors.black,
    double borderWidth = 1.0,
    // Gradient parameters - optional
    Gradient? gradient,
    List<Color>? gradientColors,
    AlignmentGeometry gradientBegin = Alignment.topLeft,
    AlignmentGeometry gradientEnd = Alignment.bottomRight,
  }) {

    final EdgeInsetsGeometry actualPadding = padding ?? EdgeInsets.zero;

    final Gradient? actualGradient = gradient ?? (gradientColors != null ?
    LinearGradient(
      colors: gradientColors,
      begin: gradientBegin,
      end: gradientEnd,
    ) : null);

    return Container(
      width: boxShape == BoxShape.circle ? (circleDiameter ?? 48) : null,
      height: boxShape == BoxShape.circle ? (circleDiameter ?? 48) : null,
      alignment: boxShape == BoxShape.circle ? Alignment.center : alignment,
      decoration: BoxDecoration(
        color: actualGradient != null ? null : containerColor,
        gradient: actualGradient,
        borderRadius: boxShape == BoxShape.rectangle ? borderRadius : null,
        shape: boxShape,
        border: hasBorder ?
        Border.all(
          color: borderColor,
          width: borderWidth.w(context),
        ) : null,
      ),
      padding: actualPadding,
      child: boxShape == BoxShape.circle ?
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          overflow: textOverFlow,
          textAlign: TextAlign.center,
          style: GoogleFonts.adventPro(
            fontSize: fontSize.sp(context),
            color: textColor,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
          ),
        ),
      ) :
      Text(
        text,
        overflow: textOverFlow,
        textAlign: textAlign,
        style: GoogleFonts.adventPro(
          fontSize: fontSize.sp(context),
          color: textColor,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        ),
      ),
    );
  }



}