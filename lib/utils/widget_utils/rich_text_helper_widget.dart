import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplaceapp/utils/utils.dart';

class RichTextHelperWidget {


  static Widget headingRichText({
    required BuildContext context,
    required List<TextSpan> textSpans,
    double width = 428,
    Alignment alignment = Alignment.centerLeft,
    Color containerColor = Colors.transparent,
    TextAlign textAlign = TextAlign.start,
    double fontSize = 24,
    Color defaultTextColor = ColorUtils.black48,
    FontWeight defaultFontWeight = FontWeight.w700,
    FontStyle defaultFontStyle = FontStyle.normal,
    TextDirection? textDirection,
    bool softWrap = true,
  }) {
    return Container(
      width: width.w(context),
      alignment: alignment,
      decoration: BoxDecoration(
        color: containerColor,
      ),
      child: RichText(
        textAlign: textAlign,
        textDirection: textDirection,
        softWrap: softWrap,
        text: TextSpan(
          children: textSpans.map((span) {
            final TextStyle? existingStyle = span.style;
            return TextSpan(
              text: span.text,
              style: GoogleFonts.poppins(
                fontSize: (existingStyle?.fontSize ?? fontSize).sp(context),
                color: existingStyle?.color ?? defaultTextColor,
                fontWeight: existingStyle?.fontWeight ?? defaultFontWeight,
                fontStyle: existingStyle?.fontStyle ?? defaultFontStyle,
                height: existingStyle?.height,
                letterSpacing: existingStyle?.letterSpacing,
                wordSpacing: existingStyle?.wordSpacing,
                decoration: existingStyle?.decoration,
                decorationColor: existingStyle?.decorationColor,
                decorationStyle: existingStyle?.decorationStyle,
                decorationThickness: existingStyle?.decorationThickness,
                backgroundColor: existingStyle?.backgroundColor,
              ),
              recognizer: span.recognizer,
              children: span.children,
              semanticsLabel: span.semanticsLabel,
            );
          }).toList(),
        ),
      ),
    );
  }




}


// Helper class for easier TextSpan creation
class CustomTextSpan {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? height;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final Color? backgroundColor;
  final GestureRecognizer? recognizer;

  CustomTextSpan({
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.height,
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.backgroundColor,
    this.recognizer,
  });

  TextSpan toTextSpan() {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: height,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        backgroundColor: backgroundColor,
        fontFamily: GoogleFonts.albertSans().fontFamily,
      ),
      recognizer: recognizer,
    );
  }
}

