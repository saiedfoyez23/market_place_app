import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());

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
                  Get.off(()=>UserLoginView(),preventDuplicates: false);
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
                        controller: forgotPasswordController.emailController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),


                      SpaceHelperWidget.v(24.h(context)),

                      // forgotPasswordController.isSubmit.value == true ?
                      // LoadingHelperWidget.loadingHelperWidget(context: context) :
                      ButtonHelperWidget.customButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {
                          // if(forgotPasswordController.emailController.value.text == "") {
                          //   MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your email name");
                          // } else {
                          //   await forgotPasswordController.forgotPasswordController(context: context, email: forgotPasswordController.emailController.value.text);
                          // }
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
      )),
    );
  }
}
