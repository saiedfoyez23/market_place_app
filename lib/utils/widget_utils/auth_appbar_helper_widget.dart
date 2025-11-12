import 'package:flutter/material.dart';

import '../utils.dart';

class AuthAppBarHelperWidget extends StatelessWidget {
  final String? title;
  final VoidCallback onBackPressed;
  final Color backgroundColor;
  final Color titleColor;
  final double expandedHeight;
  final bool pinned;
  final bool primary;
  final bool floating;
  final bool centerTitle;
  final String backButtonIcon;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final List<Widget>? actions;
  final Widget? customLeading;
  final Widget? customTitle;
  final double leadingButtonSize;
  final EdgeInsetsGeometry? leadingPadding;

  const AuthAppBarHelperWidget({
    super.key,
    this.title,
    required this.onBackPressed,
    this.backgroundColor = const Color(0xFFFBFBFB),
    this.titleColor = const Color(0xFF303030),
    this.expandedHeight = 80,
    this.pinned = true,
    this.primary = true,
    this.floating = false,
    this.centerTitle = true,
    this.backButtonIcon = ImageUtils.backButton,
    this.titleFontSize = 32,
    this.titleFontWeight = FontWeight.w600,
    this.actions,
    this.customLeading,
    this.customTitle,
    this.leadingButtonSize = 40,
    this.leadingPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      primary: primary,
      floating: floating,
      expandedHeight: expandedHeight.h(context),
      backgroundColor: backgroundColor,
      leading: customLeading ?? _buildDefaultLeading(context),
      centerTitle: centerTitle,
      title: _buildTitle(context),
      actions: actions,
    );
  }

  Widget _buildDefaultLeading(BuildContext context) {
    return SizedBox(
      height: leadingButtonSize.h(context),
      width: leadingButtonSize.w(context),
      child: TextButton(
        onPressed: onBackPressed,
        style: TextButton.styleFrom(
          padding: leadingPadding ?? EdgeInsets.symmetric(horizontal: 15.hpm(context)),
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image(
            image: AssetImage(backButtonIcon),
          ),
        ),
      ),
    );
  }

  Widget? _buildTitle(BuildContext context) {
    if (customTitle != null) return customTitle;
    if (title != null) {
      return TextHelperClass.headingTextWithoutWidth(
        context: context,
        alignment: Alignment.centerLeft,
        textAlign: TextAlign.start,
        fontSize: titleFontSize,
        fontWeight: titleFontWeight,
        textColor: titleColor,
        text: title!,
      );
    }
    return null;
  }
}



class MainPageAppBarHelperWidget extends StatelessWidget {
  final String? title;
  final Color backgroundColor;
  final Color titleColor;
  final double expandedHeight;
  final bool pinned;
  final bool primary;
  final bool floating;
  final bool centerTitle;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final List<Widget>? actions;
  final Widget? customTitle;

  const MainPageAppBarHelperWidget({
    super.key,
    this.title,
    this.backgroundColor = const Color(0xFFFBFBFB),
    this.titleColor = const Color(0xFF303030),
    this.expandedHeight = 80,
    this.pinned = true,
    this.primary = true,
    this.floating = false,
    this.centerTitle = true,
    this.titleFontSize = 32,
    this.titleFontWeight = FontWeight.w600,
    this.actions,
    this.customTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      primary: primary,
      floating: floating,
      expandedHeight: expandedHeight.h(context),
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      title: _buildTitle(context),
      actions: actions,
    );
  }

  Widget? _buildTitle(BuildContext context) {
    if (customTitle != null) return customTitle;
    if (title != null) {
      return TextHelperClass.headingTextWithoutWidth(
        context: context,
        alignment: Alignment.centerLeft,
        textAlign: TextAlign.start,
        fontSize: titleFontSize,
        fontWeight: titleFontWeight,
        textColor: titleColor,
        text: title!,
      );
    }
    return null;
  }
}