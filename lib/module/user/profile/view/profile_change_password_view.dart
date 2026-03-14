import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class ProfileChangePasswordView extends StatelessWidget {
  ProfileChangePasswordView({super.key});

  final ProfileChangePasswordController profileChangePasswordController = Get.put(ProfileChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardUserView(index: 4,),preventDuplicates: false);
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
                    Get.off(()=>DashboardUserView(index: 4,),preventDuplicates: false);
                  },
                  title: "Change Password",
                ),



                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [

                        SpaceHelperWidget.v(32.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Old Password",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                            context: context,
                            hintText: "Enter old password",
                            obscureText: profileChangePasswordController.isOldObscure.value,
                            controller: profileChangePasswordController.oldPasswordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(profileChangePasswordController.isOldObscure.value == true) {
                                  profileChangePasswordController.isOldObscure.value = false;
                                } else {
                                  profileChangePasswordController.isOldObscure.value = true;
                                }
                              },
                              child: Icon(
                                profileChangePasswordController.isOldObscure.value == true ? Icons.visibility_off : Icons.visibility,
                                size: 24.r(context),
                                color: ColorUtils.black96,
                              ),
                            )
                        ),


                        SpaceHelperWidget.v(20.h(context)),



                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "New Password",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                            context: context,
                            hintText: "Enter new password",
                            obscureText: profileChangePasswordController.isObscure.value,
                            controller: profileChangePasswordController.passwordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(profileChangePasswordController.isObscure.value == true) {
                                  profileChangePasswordController.isObscure.value = false;
                                } else {
                                  profileChangePasswordController.isObscure.value = true;
                                }
                              },
                              child: Icon(
                                profileChangePasswordController.isObscure.value == true ? Icons.visibility_off : Icons.visibility,
                                size: 24.r(context),
                                color: ColorUtils.black96,
                              ),
                            )
                        ),


                        SpaceHelperWidget.v(20.h(context)),



                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Confirm Password",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                            context: context,
                            hintText: "Enter confirm password",
                            obscureText: profileChangePasswordController.isConfirmObscure.value,
                            controller: profileChangePasswordController.confirmPasswordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(profileChangePasswordController.isConfirmObscure.value == true) {
                                  profileChangePasswordController.isConfirmObscure.value = false;
                                } else {
                                  profileChangePasswordController.isConfirmObscure.value = true;
                                }
                              },
                              child: Icon(
                                profileChangePasswordController.isConfirmObscure.value == true ? Icons.visibility_off : Icons.visibility,
                                size: 24.r(context),
                                color: ColorUtils.black96,
                              ),
                            )
                        ),



                        SpaceHelperWidget.v(24.h(context)),


                        profileChangePasswordController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(
                          context: context,
                        ) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(profileChangePasswordController.oldPasswordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your old password");
                            } else if(profileChangePasswordController.oldPasswordController.value.text.length < 8) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please enter 8 character old password");
                            } else if(profileChangePasswordController.passwordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your password");
                            } else if(profileChangePasswordController.passwordController.value.text.length < 8 ) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please enter 8 character password");
                            } else if(profileChangePasswordController.confirmPasswordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your confirm password");
                            } else if(profileChangePasswordController.confirmPasswordController.value.text != profileChangePasswordController.passwordController.value.text) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Password is not match");
                            } else {
                              await profileChangePasswordController.userChangePasswordController(context: context);
                            }
                          },
                          text: "Update",
                        ),





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
