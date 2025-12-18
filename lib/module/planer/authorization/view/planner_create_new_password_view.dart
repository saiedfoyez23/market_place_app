import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerCreateNewPasswordView extends StatelessWidget {
  PlannerCreateNewPasswordView({super.key,required this.email});
  final String email;
  final PlannerCreateNewPasswordController plannerCreateNewPasswordController = Get.put(PlannerCreateNewPasswordController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>PlannerLoginView(),preventDuplicates: false);
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
                    Get.off(()=>PlannerLoginView(),preventDuplicates: false);
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
                            obscureText: plannerCreateNewPasswordController.isObscure.value,
                            controller: plannerCreateNewPasswordController.passwordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(plannerCreateNewPasswordController.isObscure.value == true) {
                                  plannerCreateNewPasswordController.isObscure.value = false;
                                } else {
                                  plannerCreateNewPasswordController.isObscure.value = true;
                                }
                              },
                              child: Icon(
                                plannerCreateNewPasswordController.isObscure.value == true ? Icons.visibility_off : Icons.visibility,
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
                            obscureText: plannerCreateNewPasswordController.isConfirmObscure.value,
                            controller: plannerCreateNewPasswordController.confirmPasswordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(plannerCreateNewPasswordController.isConfirmObscure.value == true) {
                                  plannerCreateNewPasswordController.isConfirmObscure.value = false;
                                } else {
                                  plannerCreateNewPasswordController.isConfirmObscure.value = true;
                                }
                              },
                              child: Icon(
                                plannerCreateNewPasswordController.isConfirmObscure.value == true ? Icons.visibility_off : Icons.visibility,
                                size: 24.r(context),
                                color: ColorUtils.black96,
                              ),
                            )
                        ),



                        SpaceHelperWidget.v(24.h(context)),

                        plannerCreateNewPasswordController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(context: context) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(plannerCreateNewPasswordController.passwordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your password");
                            } else if(plannerCreateNewPasswordController.passwordController.value.text.length < 8 ) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please enter 8 character password");
                            } else if(plannerCreateNewPasswordController.confirmPasswordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your confirm password");
                            } else if(plannerCreateNewPasswordController.confirmPasswordController.value.text != plannerCreateNewPasswordController.passwordController.value.text) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Password is not match");
                            } else {
                              await plannerCreateNewPasswordController.createNewPasswordController(
                                context: context,
                                email: email,
                                newPassword: plannerCreateNewPasswordController.passwordController.value.text,
                                confirmPassword: plannerCreateNewPasswordController.confirmPasswordController.value.text,
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
