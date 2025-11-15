import 'package:flutter/material.dart';
import 'package:marketplaceapp/utils/utils.dart';


class ProfileNotificationWidget {

  static Widget buildDivider({required BuildContext context}) {
    return Divider(
      height: 1.h(context),
      thickness: 1.w(context),
      color: ColorUtils.gray170,
    );
  }

  static Widget buildSettingRow({
    required BuildContext context,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.bpm(context)),
      child: Column(
        children: [

          SpaceHelperWidget.v(8.h(context)),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      textColor: ColorUtils.black64,
                      text: title,
                    ),

                    SpaceHelperWidget.v(8.h(context)),


                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      textColor: ColorUtils.black64,
                      text: subtitle,
                    ),

                  ],
                ),
              ),


              SpaceHelperWidget.h(8.w(context)),

              /// Custom Switch
              CustomHelperToggleSwitch(
                value: value,
                onChanged: onChanged,
              ),
            ],
          ),

          SpaceHelperWidget.v(12.h(context)),

          buildDivider(context: context),
        ],
      ),
    );
  }








}