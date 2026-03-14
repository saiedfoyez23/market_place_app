import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerProfileChangePasswordView extends StatelessWidget {
  PlannerProfileChangePasswordView({super.key});

  final PlannerProfileChangePasswordController plannerProfileChangePasswordController = Get.put(PlannerProfileChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
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
                    Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
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
                            obscureText: plannerProfileChangePasswordController.isOldObscure.value,
                            controller: plannerProfileChangePasswordController.oldPasswordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(plannerProfileChangePasswordController.isOldObscure.value == true) {
                                  plannerProfileChangePasswordController.isOldObscure.value = false;
                                } else {
                                  plannerProfileChangePasswordController.isOldObscure.value = true;
                                }
                              },
                              child: Icon(
                                plannerProfileChangePasswordController.isOldObscure.value == true ? Icons.visibility_off : Icons.visibility,
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
                            obscureText: plannerProfileChangePasswordController.isObscure.value,
                            controller: plannerProfileChangePasswordController.passwordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(plannerProfileChangePasswordController.isObscure.value == true) {
                                  plannerProfileChangePasswordController.isObscure.value = false;
                                } else {
                                  plannerProfileChangePasswordController.isObscure.value = true;
                                }
                              },
                              child: Icon(
                                plannerProfileChangePasswordController.isObscure.value == true ? Icons.visibility_off : Icons.visibility,
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
                            obscureText: plannerProfileChangePasswordController.isConfirmObscure.value,
                            controller: plannerProfileChangePasswordController.confirmPasswordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(plannerProfileChangePasswordController.isConfirmObscure.value == true) {
                                  plannerProfileChangePasswordController.isConfirmObscure.value = false;
                                } else {
                                  plannerProfileChangePasswordController.isConfirmObscure.value = true;
                                }
                              },
                              child: Icon(
                                plannerProfileChangePasswordController.isConfirmObscure.value == true ? Icons.visibility_off : Icons.visibility,
                                size: 24.r(context),
                                color: ColorUtils.black96,
                              ),
                            )
                        ),



                        SpaceHelperWidget.v(24.h(context)),

                        plannerProfileChangePasswordController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(
                          context: context,
                        ) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(plannerProfileChangePasswordController.oldPasswordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your old password");
                            } else if(plannerProfileChangePasswordController.oldPasswordController.value.text.length < 8) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please enter 8 character old password");
                            } else if(plannerProfileChangePasswordController.passwordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your password");
                            } else if(plannerProfileChangePasswordController.passwordController.value.text.length < 8 ) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please enter 8 character password");
                            } else if(plannerProfileChangePasswordController.confirmPasswordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your confirm password");
                            } else if(plannerProfileChangePasswordController.confirmPasswordController.value.text != plannerProfileChangePasswordController.passwordController.value.text) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Password is not match");
                            } else {
                              await plannerProfileChangePasswordController.plannerChangePasswordController(context: context);
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
