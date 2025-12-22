import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class VendorProfileDialogBoxWidget {

  void vendorDeleteProfileDialog({required BuildContext context}) {
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
                    text: "Are you sure you want to delete your profile? ",
                  ),


                  SpaceHelperWidget.v(32.h(context)),


                  /// ===== Buttons Row =====
                  Row(
                    children: [
                      /// No Button

                      Expanded(
                        child: ButtonHelperWidget.customButtonWidget(
                          context: context,
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: "No",
                          borderRadius: 40,
                          backgroundColor: ColorUtils.white243,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.black89,
                          fontSize: 20,
                        ),
                      ),


                      SpaceHelperWidget.h(10.w(context)),


                      Expanded(
                        child: ButtonHelperWidget.customButtonWidget(
                          context: context,
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: "Delete",
                          borderRadius: 40,
                          backgroundColor: ColorUtils.red191,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.white255,
                          fontSize: 20,
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  void vendorLogOutDialog({required BuildContext context}) {
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
                    text: "Are you sure you want to Log-out your profile?",
                  ),


                  SpaceHelperWidget.v(32.h(context)),





                  /// ===== Buttons Row =====
                  Row(
                    children: [
                      /// No Button

                      Expanded(
                        child: ButtonHelperWidget.customButtonWidget(
                          context: context,
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: "No",
                          borderRadius: 40,
                          backgroundColor: ColorUtils.white243,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.black89,
                          fontSize: 20,
                        ),
                      ),


                      SpaceHelperWidget.h(10.w(context)),


                      Expanded(
                        child: ButtonHelperWidget.customButtonWidget(
                          context: context,
                          onPressed: () async {
                            await LocalStorageUtils.remove(AppConstantUtils.vendorLoginResponse);
                            Get.offAll(()=>VendorLoginView());
                          },
                          text: "Yes",
                          borderRadius: 40,
                          backgroundColor: ColorUtils.red191,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.white255,
                          fontSize: 20,
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }




}