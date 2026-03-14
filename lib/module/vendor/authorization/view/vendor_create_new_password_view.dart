import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorCreateNewPasswordView extends StatelessWidget {
  VendorCreateNewPasswordView({super.key,required this.email});
  final String email;
  final VendorCreateNewPasswordController vendorCreateNewPasswordController = Get.put(VendorCreateNewPasswordController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>VendorLoginView(),preventDuplicates: false);
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
                    Get.off(()=>VendorLoginView(),preventDuplicates: false);
                  },
                  title: "Create password",
                ),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [


                        SpaceHelperWidget.v(18.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          textColor: ColorUtils.black96,
                          text: "Please create and enter a new password for your account",
                        ),


                        SpaceHelperWidget.v(32.h(context)),


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
                            obscureText: vendorCreateNewPasswordController.isObscure.value,
                            controller: vendorCreateNewPasswordController.passwordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(vendorCreateNewPasswordController.isObscure.value == true) {
                                  vendorCreateNewPasswordController.isObscure.value = false;
                                } else {
                                  vendorCreateNewPasswordController.isObscure.value = true;
                                }
                              },
                              child: Icon(
                                vendorCreateNewPasswordController.isObscure.value == true ? Icons.visibility_off : Icons.visibility,
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
                            obscureText: vendorCreateNewPasswordController.isConfirmObscure.value,
                            controller: vendorCreateNewPasswordController.confirmPasswordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(vendorCreateNewPasswordController.isConfirmObscure.value == true) {
                                  vendorCreateNewPasswordController.isConfirmObscure.value = false;
                                } else {
                                  vendorCreateNewPasswordController.isConfirmObscure.value = true;
                                }
                              },
                              child: Icon(
                                vendorCreateNewPasswordController.isConfirmObscure.value == true ? Icons.visibility_off : Icons.visibility,
                                size: 24.r(context),
                                color: ColorUtils.black96,
                              ),
                            )
                        ),



                        SpaceHelperWidget.v(24.h(context)),


                        vendorCreateNewPasswordController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(context: context) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(vendorCreateNewPasswordController.passwordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your password");
                            } else if(vendorCreateNewPasswordController.passwordController.value.text.length < 8 ) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please enter 8 character password");
                            } else if(vendorCreateNewPasswordController.confirmPasswordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your confirm password");
                            } else if(vendorCreateNewPasswordController.confirmPasswordController.value.text != vendorCreateNewPasswordController.passwordController.value.text) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Password is not match");
                            } else {
                              await vendorCreateNewPasswordController.vendorCreateNewPasswordController(
                                context: context,
                                email: email,
                                newPassword: vendorCreateNewPasswordController.passwordController.value.text,
                                confirmPassword: vendorCreateNewPasswordController.confirmPasswordController.value.text,
                              );
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
