import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplaceapp/utils/utils.dart';

class RadioListTileHelperWidget<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String title;
  final ValueChanged<T?> onChanged;
  final ListTileControlAffinity controlAffinity;
  final EdgeInsetsGeometry contentPadding;
  final String? subtitle;
  final Color? activeColor;
  final bool dense;
  final VisualDensity? visualDensity;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Color? selectedTileColor;
  final ShapeBorder? shape;
  final bool selected;
  final List<BoxShadow>? boxShadow;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? radioShape;

  const RadioListTileHelperWidget({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
    this.controlAffinity = ListTileControlAffinity.leading,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 8.0), // Reduced default padding
    this.subtitle,
    this.activeColor,
    this.dense = false,
    this.visualDensity = const VisualDensity(horizontal: -4, vertical: 0), // Compact horizontal density
    this.materialTapTargetSize,
    this.selectedTileColor,
    this.shape,
    this.selected = false,
    this.boxShadow,
    this.borderRadius,
    this.padding,
    this.radioShape,
  });

  @override
  Widget build(BuildContext context) {
    Widget tile = RadioListTile<T>(
      value: value,
      groupValue: groupValue,
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 18.sp(context),
          fontWeight: FontWeight.w500,
          color: const Color.fromRGBO(80, 80, 80, 1),
          fontStyle: FontStyle.normal,
        ),
      ),
      subtitle: subtitle != null ? Text(
        subtitle!,
        style: GoogleFonts.poppins(
          fontSize: 15.sp(context),
          fontWeight: FontWeight.w500,
          color: const Color.fromRGBO(107, 114, 128, 1),
          fontStyle: FontStyle.normal,
        ),
      ) : null,
      onChanged: onChanged,
      controlAffinity: controlAffinity,
      contentPadding: contentPadding,
      activeColor: activeColor,
      dense: dense,
      visualDensity: visualDensity,
      materialTapTargetSize: materialTapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
      selectedTileColor: selectedTileColor,
      shape: shape,
      selected: selected,
      toggleable: false,
    );

    // Apply custom radio shape if provided
    if (radioShape != null) {
      tile = Theme(
        data: Theme.of(context).copyWith(
          radioTheme: Theme.of(context).radioTheme.copyWith(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        child: tile,
      );
    }

    // Apply box shadow and border radius
    if (boxShadow != null || borderRadius != null) {
      tile = Container(
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          borderRadius: borderRadius,
        ),
        child: tile,
      );
    }

    // Apply padding if provided
    if (padding != null) {
      tile = Padding(
        padding: padding!,
        child: tile,
      );
    }

    return tile;
  }
}