import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerCreateAccountPickImageView extends StatelessWidget {
  PlannerCreateAccountPickImageView({super.key});

  final PlannerCreateAccountController plannerCreateAccountController = Get.put(PlannerCreateAccountController());


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.to(()=>PlannerCreateAccountView());
      },
      child: Scaffold(
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
                    Get.to(()=>PlannerCreateAccountView());
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
                                      imageAsset: plannerCreateAccountController.coverImageFile.value.path != "" ? null : null,
                                      imageFile:  plannerCreateAccountController.coverImageFile.value.path == "" ? null :  plannerCreateAccountController.coverImageFile.value.path,
                                    ),

                                    // Edit Icon Button
                                    Positioned(
                                      bottom: 80.h(context),
                                      right: 22.w(context),
                                      child: InkWell(
                                        onTap: () async {
                                          await plannerCreateAccountController.pickCoverImage(source: ImageSource.gallery, context: context);
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
                                        imageAsset: plannerCreateAccountController.profileImageFile.value.path != "" ? null : ImageUtils.noImage,
                                        imageFile: plannerCreateAccountController.profileImageFile.value.path == "" ? null : plannerCreateAccountController.profileImageFile.value.path,
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
                                                              await plannerCreateAccountController.pickProfileImage(source: ImageSource.gallery, context: context);
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
                                                              await plannerCreateAccountController.pickProfileImage(source: ImageSource.camera, context: context);
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



                        plannerCreateAccountController.coverImageFile.value.path == "" && plannerCreateAccountController.profileImageFile.value.path == "" ?
                        Column(
                          children: [


                            ButtonHelperWidget.customButtonWidgetAdventPro(
                              context: context,
                              onPressed: () async {
                                plannerCreateAccountController.profileImageFile.value = File("");
                                plannerCreateAccountController.coverImageFile.value = File("");
                              },
                              text: "Add Picture",
                            ),


                            SpaceHelperWidget.v(16.h(context)),

                            plannerCreateAccountController.isLoading.value == true ?
                            LoadingHelperWidget.loadingHelperWidget(context: context) :
                            ButtonHelperWidget.customIconButtonWidgetAdventPro(
                              context: context,
                              onPressed: () async {
                                await plannerCreateAccountController.createPlannerAccountController(
                                  context: context,
                                  userName: plannerCreateAccountController.userNameController.value.text,
                                  email: plannerCreateAccountController.emailController.value.text,
                                  password: plannerCreateAccountController.passwordController.value.text,
                                  confirmPassword: plannerCreateAccountController.confirmPasswordController.value.text,
                                  imageFile: plannerCreateAccountController.profileImageFile.value,
                                  coverImageFile: plannerCreateAccountController.coverImageFile.value,
                                );
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

                            plannerCreateAccountController.isLoading.value == true ?
                            LoadingHelperWidget.loadingHelperWidget(context: context) :
                            ButtonHelperWidget.customButtonWidgetAdventPro(
                              context: context,
                              onPressed: () async {
                                await plannerCreateAccountController.createPlannerAccountController(
                                  context: context,
                                  userName: plannerCreateAccountController.userNameController.value.text,
                                  email: plannerCreateAccountController.emailController.value.text,
                                  password: plannerCreateAccountController.passwordController.value.text,
                                  confirmPassword: plannerCreateAccountController.confirmPasswordController.value.text,
                                  imageFile: plannerCreateAccountController.profileImageFile.value,
                                  coverImageFile: plannerCreateAccountController.coverImageFile.value,
                                );
                              },
                              text: "Done",
                            ),


                            SpaceHelperWidget.v(16.h(context)),


                            ButtonHelperWidget.customIconButtonWidgetAdventPro(
                              context: context,
                              onPressed: () async {
                                plannerCreateAccountController.profileImageFile.value = File("");
                                plannerCreateAccountController.coverImageFile.value = File("");
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
      ),
    );
  }
}
