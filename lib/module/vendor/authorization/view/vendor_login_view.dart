import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorLoginView extends StatelessWidget {
  VendorLoginView({super.key});

  final VendorLoginController vendorLoginController = Get.put(VendorLoginController());

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
                  Get.off(()=>VendorAuthSplashView(),preventDuplicates: false);
                },
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [



                      SpaceHelperWidget.v(48.h(context)),


                      ImageHelperWidget.assetImageWidget(
                        context: context,
                        height: 70,
                        width: 344,
                        imageString: ImageUtils.logoImage,
                      ),

                      SpaceHelperWidget.v(48.h(context)),


                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        textColor: ColorUtils.black48,
                        text: "Login",
                      ),

                      SpaceHelperWidget.v(6.h(context)),

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        textColor: ColorUtils.black96,
                        text: "Hi Welcome back..! Please enter your correct Information And continue ",
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
                        controller: vendorLoginController.emailController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),


                      SpaceHelperWidget.v(20.h(context)),

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "Password",
                      ),

                      SpaceHelperWidget.v(6.h(context)),


                      TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter your password",
                          obscureText: vendorLoginController.isObscure.value,
                          controller: vendorLoginController.passwordController.value,
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: InkWell(
                            onTap: () async {
                              if(vendorLoginController.isObscure.value == true) {
                                vendorLoginController.isObscure.value = false;
                              } else {
                                vendorLoginController.isObscure.value = true;
                              }
                            },
                            child: Icon(
                              vendorLoginController.isObscure.value == true ? Icons.visibility_off : Icons.visibility,
                              size: 24.r(context),
                              color: ColorUtils.black96,
                            ),
                          )
                      ),


                      SpaceHelperWidget.v(20.h(context)),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          ButtonHelperWidget.customIconButtonWidget(
                            context: context,
                            onPressed: () async {
                              if(vendorLoginController.isCheck.value == true) {
                                vendorLoginController.isCheck.value = false;
                              } else {
                                vendorLoginController.isCheck.value = true;
                              }
                            },
                            iconPath: vendorLoginController.isCheck.value == true ? ImageUtils.checkboxIcon : ImageUtils.uncheckboxIcon,
                            text: "Remember Me",
                            textColor: ColorUtils.black96,
                            fontWeight: FontWeight.w500,
                            padding: EdgeInsets.only(right: 14.5.vpm(context)),
                          ),




                          ButtonHelperWidget.customButtonWidget(
                            context: context,
                            onPressed: () async {
                              Get.off(()=>VendorForgotPasswordView(),preventDuplicates: false);
                            },
                            text: "Forgot password?",
                            padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                            alignment: Alignment.center,
                            textColor: ColorUtils.blue96,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            backgroundColor: Colors.transparent,
                          ),

                        ],
                      ),

                      SpaceHelperWidget.v(20.h(context)),


                      ButtonHelperWidget.customButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {
                          Get.off(()=>VendorCreateAccountSetUpProfileView(),preventDuplicates: false);
                        },
                        text: "Sign In",
                      ),

                      SpaceHelperWidget.v(32.h(context)),


                      Row(
                        children: [

                          Expanded(
                            child: Container(
                              height: 2.h(context),
                              decoration: BoxDecoration(
                                color: ColorUtils.gray153,
                              ),
                            ),
                          ),

                          SpaceHelperWidget.h(10.w(context)),

                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            textColor: ColorUtils.black96,
                            text: "Continue with",
                          ),

                          SpaceHelperWidget.h(10.w(context)),

                          Expanded(
                            child: Container(
                              height: 2.h(context),
                              decoration: BoxDecoration(
                                color: ColorUtils.gray153,
                              ),
                            ),
                          ),


                        ],
                      ),


                      SpaceHelperWidget.v(32.h(context)),


                      ButtonHelperWidget.customIconButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {},
                        iconPath: ImageUtils.appleImage,
                        text: "Login with apple",
                        borderColor: ColorUtils.orange119,
                        borderWidth: 1,
                        textSize: 24,
                      ),


                      SpaceHelperWidget.v(16.h(context)),

                      ButtonHelperWidget.customIconButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {},
                          iconPath: ImageUtils.googleImage,
                          text: "Login with Google",
                          borderColor: ColorUtils.orange119,
                          borderWidth: 1,
                          textSize: 24
                      ),


                      SpaceHelperWidget.v(32.h(context)),


                      RichTextHelperWidget.headingRichText(
                        context: context,
                        alignment: Alignment.center,
                        textSpans: [
                          CustomTextSpan(
                            text: 'Do you have an account? ',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ).toTextSpan(),
                          CustomTextSpan(
                            text: 'Sign Up',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.blue96,
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Get.off(()=>VendorCreateAccountView(),preventDuplicates: false);
                            },
                          ).toTextSpan(),
                        ],
                      ),


                      SpaceHelperWidget.v(32.h(context)),


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
