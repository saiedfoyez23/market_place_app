import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorCreateAccountPickImageView extends StatelessWidget {
  VendorCreateAccountPickImageView({super.key});

  final VendorCreateAccountController vendorCreateAccountController = Get.put(VendorCreateAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: CustomScrollView(
            slivers: [

              AuthAppBarHelperWidget(
                onBackPressed: () async {
                  Get.off(()=>VendorCreateAccountKycVerificationView(),preventDuplicates: false);
                },
                title: "Add Profile picture",
              ),


              SliverFillRemaining(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(
                        width: 428.w(context),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [


                            SizedBox(
                              height: 250.h(context),
                              width: 428.w(context),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [

                                  ImageHelperWidget.styledImage(
                                    context: context,
                                    height: 250.h(context),
                                    width: 428.w(context),
                                    fit: BoxFit.cover,
                                    imageAsset: vendorCreateAccountController.coverImageFile.value.path != "" ? null : null,
                                    imageFile: vendorCreateAccountController.coverImageFile.value.path == "" ? null : vendorCreateAccountController.coverImageFile.value.path,
                                  ),

                                  // Edit Icon Button
                                  Positioned(
                                    bottom: 80.h(context),
                                    right: 22.w(context),
                                    child: InkWell(
                                      onTap: () async {
                                        await vendorCreateAccountController.pickCoverImage(source: ImageSource.gallery, context: context);
                                      },
                                      child: ImageHelperWidget.assetImageWidget(
                                        context: context,
                                        height: 32.h(context),
                                        width: 32.w(context),
                                        imageString: ImageUtils.editProfileWhiteImage,
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),



                            // Profile Image
                            Padding(
                              padding: EdgeInsets.only(top: 110.h(context)),
                              child: SizedBox(
                                width: 150.w(context),
                                height: 150.h(context),
                                child: Stack(
                                  children: [

                                    // Profile Picture
                                    ImageHelperWidget.circleImageHelperWidget(
                                      width: 150.w(context),
                                      height: 150.h(context),
                                      verticalPadding: 2.vpm(context),
                                      horizontalPadding: 2.vpm(context),
                                      backgroundColor: ColorUtils.orange213,
                                      radius: 75.r(context),
                                      imageAsset: vendorCreateAccountController.profileImageFile.value.path != "" ? null : ImageUtils.noImage,
                                      imageFile: vendorCreateAccountController.profileImageFile.value.path == "" ? null : vendorCreateAccountController.profileImageFile.value.path,
                                    ),



                                    // Edit Icon Button
                                    Positioned(
                                      bottom: 12.h(context),
                                      right: 12.w(context),
                                      child: InkWell(
                                        onTap: () async {
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
                                                      color: ColorUtils.white238,
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
                                                          fontSize: 30,
                                                          fontWeight: FontWeight.w600,
                                                          textColor: ColorUtils.black64,
                                                          text: "Add Picture",
                                                        ),


                                                        SpaceHelperWidget.v(32.h(context)),


                                                        ButtonHelperWidget.customButtonWidget(
                                                          context: context,
                                                          onPressed: () async {
                                                            await vendorCreateAccountController.pickProfileImage(source: ImageSource.gallery, context: context);
                                                          },
                                                          text: "Choose Gallery",
                                                          borderRadius: 16,
                                                          backgroundColor: ColorUtils.white255,
                                                          fontWeight: FontWeight.w600,
                                                          textColor: ColorUtils.black48,
                                                          fontSize: 20,
                                                        ),


                                                        SpaceHelperWidget.v(10.h(context)),


                                                        ButtonHelperWidget.customButtonWidget(
                                                          context: context,
                                                          onPressed: () async {
                                                            await vendorCreateAccountController.pickProfileImage(source: ImageSource.camera, context: context);
                                                          },
                                                          text: "Choose Camera",
                                                          borderRadius: 16,
                                                          backgroundColor: ColorUtils.white255,
                                                          fontWeight: FontWeight.w600,
                                                          textColor: ColorUtils.black48,
                                                          fontSize: 20,
                                                        ),


                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: ImageHelperWidget.assetImageWidget(
                                          context: context,
                                          height: 32.h(context),
                                          width: 32.w(context),
                                          imageString: ImageUtils.editProfileWhiteImage,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),



                      vendorCreateAccountController.coverImageFile.value.path == "" && vendorCreateAccountController.profileImageFile.value.path == "" ?
                      Column(
                        children: [


                          ButtonHelperWidget.customButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              vendorCreateAccountController.profileImageFile.value = File("");
                              vendorCreateAccountController.coverImageFile.value = File("");
                            },
                            text: "Add Picture",
                          ),


                          SpaceHelperWidget.v(16.h(context)),


                          ButtonHelperWidget.customIconButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              Get.off(()=>VendorCreateAccountOtpView(),preventDuplicates: false);
                            },
                            textSize: 24,
                            iconPath: "",
                            text: "Skip",
                            isIcon: false,
                            textColor: ColorUtils.orange119,
                            borderColor: ColorUtils.orange119,
                            borderWidth: 1,
                          ),

                          SpaceHelperWidget.v(16.h(context)),

                        ],
                      ) :
                      Column(
                        children: [


                          ButtonHelperWidget.customButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              Get.off(()=>VendorCreateAccountOtpView(),preventDuplicates: false);
                            },
                            text: "Done",
                          ),


                          SpaceHelperWidget.v(16.h(context)),


                          ButtonHelperWidget.customIconButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              vendorCreateAccountController.profileImageFile.value = File("");
                              vendorCreateAccountController.coverImageFile.value = File("");
                            },
                            textSize: 24,
                            iconPath: "",
                            text: "Change Picture",
                            isIcon: false,
                            textColor: ColorUtils.orange119,
                            borderColor: ColorUtils.orange119,
                            borderWidth: 1,
                          ),

                          SpaceHelperWidget.v(16.h(context)),

                        ],
                      )





                    ],
                  ),
                ),
              )



            ],
          ),
        ),
      )),
    );
  }
}
