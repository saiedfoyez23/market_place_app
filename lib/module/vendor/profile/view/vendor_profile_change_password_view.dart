import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorProfileChangePasswordView extends StatelessWidget {
  VendorProfileChangePasswordView({super.key});

  final VendorProfileChangePasswordController vendorProfileChangePasswordController = Get.put(VendorProfileChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardVendorView(index: 5),preventDuplicates: false);
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
                    Get.off(()=>DashboardVendorView(index: 5),preventDuplicates: false);
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
                            obscureText: vendorProfileChangePasswordController.isOldObscure.value,
                            controller: vendorProfileChangePasswordController.oldPasswordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(vendorProfileChangePasswordController.isOldObscure.value == true) {
                                  vendorProfileChangePasswordController.isOldObscure.value = false;
                                } else {
                                  vendorProfileChangePasswordController.isOldObscure.value = true;
                                }
                              },
                              child: Icon(
                                vendorProfileChangePasswordController.isOldObscure.value == true ? Icons.visibility_off : Icons.visibility,
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
                            obscureText: vendorProfileChangePasswordController.isObscure.value,
                            controller: vendorProfileChangePasswordController.passwordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(vendorProfileChangePasswordController.isObscure.value == true) {
                                  vendorProfileChangePasswordController.isObscure.value = false;
                                } else {
                                  vendorProfileChangePasswordController.isObscure.value = true;
                                }
                              },
                              child: Icon(
                                vendorProfileChangePasswordController.isObscure.value == true ? Icons.visibility_off : Icons.visibility,
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
                            obscureText: vendorProfileChangePasswordController.isConfirmObscure.value,
                            controller: vendorProfileChangePasswordController.confirmPasswordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(vendorProfileChangePasswordController.isConfirmObscure.value == true) {
                                  vendorProfileChangePasswordController.isConfirmObscure.value = false;
                                } else {
                                  vendorProfileChangePasswordController.isConfirmObscure.value = true;
                                }
                              },
                              child: Icon(
                                vendorProfileChangePasswordController.isConfirmObscure.value == true ? Icons.visibility_off : Icons.visibility,
                                size: 24.r(context),
                                color: ColorUtils.black96,
                              ),
                            )
                        ),



                        SpaceHelperWidget.v(24.h(context)),


                        vendorProfileChangePasswordController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(
                          context: context,
                        ) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(vendorProfileChangePasswordController.oldPasswordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your old password");
                            } else if(vendorProfileChangePasswordController.oldPasswordController.value.text.length < 8) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please enter 8 character old password");
                            } else if(vendorProfileChangePasswordController.passwordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your password");
                            } else if(vendorProfileChangePasswordController.passwordController.value.text.length < 8 ) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please enter 8 character password");
                            } else if(vendorProfileChangePasswordController.confirmPasswordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your confirm password");
                            } else if(vendorProfileChangePasswordController.confirmPasswordController.value.text != vendorProfileChangePasswordController.passwordController.value.text) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Password is not match");
                            } else {
                              await vendorProfileChangePasswordController.vendorChangePasswordController(context: context);
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
