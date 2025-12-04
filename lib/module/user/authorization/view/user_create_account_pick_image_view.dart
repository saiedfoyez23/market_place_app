import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserCreateAccountPickImageView extends StatelessWidget {
  UserCreateAccountPickImageView({super.key});

  final UserCreateAccountController userCreateAccountController = Get.put(UserCreateAccountController());

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
                  Get.to(()=>UserCreateAccountView());
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


                      Column(
                        children: [
                          SpaceHelperWidget.v(6.h(context)),

                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            textColor: ColorUtils.black96,
                            text: "Everyone will be able to see your picture. ",
                          ),

                          SpaceHelperWidget.v(32.h(context)),

                          SizedBox(
                            width: 428.w(context),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [

                                SizedBox(
                                  width: 190.w(context),
                                  height: 190.h(context),
                                  child: Stack(
                                    children: [

                                      // Profile Picture
                                      ImageHelperWidget.circleImageHelperWidget(
                                        width: 190.w(context),
                                        height: 190.h(context),
                                        verticalPadding: 2.vpm(context),
                                        horizontalPadding: 2.vpm(context),
                                        backgroundColor: ColorUtils.orange213,
                                        radius: 100.r(context),
                                        imageAsset: userCreateAccountController.profileImageFile.value.path != "" ? null : ImageUtils.noImage,
                                        imageFile: userCreateAccountController.profileImageFile.value.path == "" ? null : userCreateAccountController.profileImageFile.value.path,
                                      ),



                                      // Edit Icon Button
                                      Positioned(
                                        bottom: 15.h(context),
                                        right: 15.w(context),
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
                                                              await userCreateAccountController.pickProfileImage(source: ImageSource.gallery, context: context);
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
                                                              await userCreateAccountController.pickProfileImage(source: ImageSource.camera, context: context);
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
                                            height: 42.h(context),
                                            width: 42.w(context),
                                            imageString: ImageUtils.editProfileWhiteImage,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          ),
                        ],
                      ),





                      userCreateAccountController.profileImageFile.value.path == "" ?
                      Column(
                        children: [


                          ButtonHelperWidget.customButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              userCreateAccountController.profileImageFile.value = File("");
                            },
                            text: "Add Picture",
                          ),


                          SpaceHelperWidget.v(16.h(context)),

                          userCreateAccountController.isLoading.value == true ?
                          LoadingHelperWidget.loadingHelperWidget(context: context) :
                          ButtonHelperWidget.customIconButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              await userCreateAccountController.createUserAccountController(
                                context: context,
                                userName: userCreateAccountController.userNameController.value.text,
                                email: userCreateAccountController.emailController.value.text,
                                password: userCreateAccountController.passwordController.value.text,
                                confirmPassword: userCreateAccountController.confirmPasswordController.value.text,
                                imageFile: userCreateAccountController.profileImageFile.value,
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

                          userCreateAccountController.isLoading.value == true ?
                          LoadingHelperWidget.loadingHelperWidget(context: context) :
                          ButtonHelperWidget.customButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              await userCreateAccountController.createUserAccountController(
                                context: context,
                                userName: userCreateAccountController.userNameController.value.text,
                                email: userCreateAccountController.emailController.value.text,
                                password: userCreateAccountController.passwordController.value.text,
                                confirmPassword: userCreateAccountController.confirmPasswordController.value.text,
                                imageFile: userCreateAccountController.profileImageFile.value,
                              );
                            },
                            text: "Done",
                          ),


                          SpaceHelperWidget.v(16.h(context)),


                          ButtonHelperWidget.customIconButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              userCreateAccountController.profileImageFile.value = File("");
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
