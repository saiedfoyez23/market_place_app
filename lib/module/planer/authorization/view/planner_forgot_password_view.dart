import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerForgotPasswordView extends StatelessWidget {
  PlannerForgotPasswordView({super.key});

  final PlannerForgotPasswordController plannerForgotPasswordController = Get.put(PlannerForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              title: "Forgot password",
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
                      text: "Please enter your email address which was used to create your account ",
                    ),


                    SpaceHelperWidget.v(32.h(context)),


                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textColor: ColorUtils.black96,
                      text: "Email",
                    ),

                    SpaceHelperWidget.v(6.h(context)),


                    TextFormFieldWidget.build(
                      context: context,
                      hintText: "Enter your email",
                      controller: plannerForgotPasswordController.emailController.value,
                      keyboardType: TextInputType.emailAddress,
                    ),


                    SpaceHelperWidget.v(24.h(context)),


                    ButtonHelperWidget.customButtonWidgetAdventPro(
                      context: context,
                      onPressed: () async {
                        Get.off(()=>PlannerForgotPasswordOtpView(),preventDuplicates: false);
                      },
                      text: "Next",
                    ),





                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
