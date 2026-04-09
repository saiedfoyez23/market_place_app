import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:marketplaceapp/utils/utils.dart';

class LocationPermissionDeniedBox {

  void locationPermissionDeniedBox({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap a button
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r(context)),
          ),
          child: IntrinsicHeight(
            child: Container(
              width: 428.w(context),
              decoration: BoxDecoration(
                color: ColorUtils.white255,
                borderRadius: BorderRadius.circular(20.r(context)),
              ),
              padding: EdgeInsets.fromLTRB(
                16.lpm(context),
                20.tpm(context),
                16.rpm(context),
                20.bpm(context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// ===== Title Text =====

                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.center,
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    textColor: ColorUtils.black21,
                    text: "Location Permission Denied",
                  ),

                  SpaceHelperWidget.v(10.h(context)),


                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.center,
                    textAlign: TextAlign.center,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    textColor: ColorUtils.black96,
                    text: "Location permission is permanently denied. Please enable it from settings. Or Uninstall the app and install again",
                  ),




                  SpaceHelperWidget.v(32.h(context)),


                  /// ===== Buttons Row =====
                  Expanded(
                    child: ButtonHelperWidget.customButtonWidget(
                      context: context,
                      onPressed: () async {
                        Geolocator.openAppSettings();
                      },
                      text: "Open Setting",
                      borderRadius: 40,
                      backgroundColor: ColorUtils.red191,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.white255,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}