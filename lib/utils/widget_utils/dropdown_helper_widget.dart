import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplaceapp/utils/utils.dart';

class CustomDropdownHelperClass<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String hintText;
  final double? width;
  final bool showDropdownIcon;
  final String Function(T)? itemToString;
  final Widget Function(T)? itemBuilder;
  final EdgeInsetsGeometry? contentPadding;
  final double iconSize;
  final Color iconColor;
  final TextStyle? hintStyle;
  final TextStyle? itemStyle;
  final TextStyle? selectedItemStyle;
  final Color fillColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;

  const CustomDropdownHelperClass({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText = "Select",
    this.width,
    this.showDropdownIcon = true,
    this.itemToString,
    this.itemBuilder,
    this.contentPadding,
    this.iconSize = 20,
    this.iconColor = Colors.black,
    this.hintStyle,
    this.itemStyle,
    this.selectedItemStyle,
    this.fillColor = ColorUtils.white255,
    this.borderColor = Colors.transparent,
    this.borderRadius = 10,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownButtonFormField<T>(
        value: value,
        icon: showDropdownIcon ? Icon(
          Icons.keyboard_arrow_down_outlined,
          size: iconSize.r(context),
          color: iconColor,
        ) : null,
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: contentPadding ??  EdgeInsets.symmetric(
            horizontal: 20.hpm(context),
            vertical: 13.vpm(context),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 18.sp(context),
            color: ColorUtils.black89,
          ),
        ),
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: itemBuilder != null ? itemBuilder!(item) : TextHelperClass.headingText(
              context: context,
              text: itemToString != null ? itemToString!(item) : item.toString(),
              fontSize: 18,
              textColor: ColorUtils.black48,
              fontWeight: FontWeight.w700,
            ),
          );
        }).toList(),
        onChanged: onChanged,
        style: selectedItemStyle ?? GoogleFonts.poppins(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 18.sp(context),
          color: ColorUtils.black48,
        ),
      ),
    );
  }
}