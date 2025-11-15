import 'package:flutter/material.dart';
import 'package:marketplaceapp/utils/utils.dart';

class CustomHelperToggleSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomHelperToggleSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onChanged(!value),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(48.w(context), 24.h(context)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashFactory: NoSplash.splashFactory, // no ripple
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 48.w(context),
        height: 24.h(context),
        padding: EdgeInsets.symmetric(horizontal: 1.hpm(context),vertical: 1.vpm(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r(context)),
          color: value ? Colors.green : ColorUtils.gray184,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment:
          value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 22.w(context),
            height: 22.h(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}