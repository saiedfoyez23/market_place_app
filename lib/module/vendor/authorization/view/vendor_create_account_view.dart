import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorCreateAccountView extends StatelessWidget {
  VendorCreateAccountView({super.key});

  final VendorCreateAccountController vendorCreateAccountController = Get.put(VendorCreateAccountController());

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
                        text: "Create account",
                      ),

                      SpaceHelperWidget.v(6.h(context)),

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        textColor: ColorUtils.black96,
                        text: "Fill your information below or register with your account..",
                      ),

                      SpaceHelperWidget.v(32.h(context)),


                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "User name",
                      ),

                      SpaceHelperWidget.v(6.h(context)),


                      TextFormFieldWidget.build(
                        context: context,
                        hintText: "Enter your user name",
                        controller: vendorCreateAccountController.userNameController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),


                      SpaceHelperWidget.v(20.h(context)),

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
                        controller: vendorCreateAccountController.emailController.value,
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
                          hintText: "Enter password",
                          obscureText: vendorCreateAccountController.isObscure.value,
                          controller: vendorCreateAccountController.passwordController.value,
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: InkWell(
                            onTap: () async {
                              if(vendorCreateAccountController.isObscure.value == true) {
                                vendorCreateAccountController.isObscure.value = false;
                              } else {
                                vendorCreateAccountController.isObscure.value = true;
                              }
                            },
                            child: Icon(
                              vendorCreateAccountController.isObscure.value == true ? Icons.visibility_off : Icons.visibility,
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
                          obscureText: vendorCreateAccountController.isConfirmObscure.value,
                          controller: vendorCreateAccountController.confirmPasswordController.value,
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: InkWell(
                            onTap: () async {
                              if(vendorCreateAccountController.isConfirmObscure.value == true) {
                                vendorCreateAccountController.isConfirmObscure.value = false;
                              } else {
                                vendorCreateAccountController.isConfirmObscure.value = true;
                              }
                            },
                            child: Icon(
                              vendorCreateAccountController.isConfirmObscure.value == true ? Icons.visibility_off : Icons.visibility,
                              size: 24.r(context),
                              color: ColorUtils.black96,
                            ),
                          )
                      ),


                      SpaceHelperWidget.v(20.h(context)),


                      ButtonHelperWidget.customIconButtonWidget(
                        context: context,
                        onPressed: () async {
                          if(vendorCreateAccountController.isCheck.value == true) {
                            vendorCreateAccountController.isCheck.value = false;
                          } else {
                            vendorCreateAccountController.isCheck.value = true;
                          }
                        },
                        iconPath: vendorCreateAccountController.isCheck.value == true ? ImageUtils.checkboxIcon : ImageUtils.uncheckboxIcon,
                        padding: EdgeInsets.only(right: 14.5.vpm(context)),
                        mainAxisAlignment: MainAxisAlignment.start,
                        textWidget: RichTextHelperWidget.headingWithoutWidthRichText(
                          context: context,
                          alignment: Alignment.centerLeft,
                          textSpans: [
                            CustomTextSpan(
                              text: 'By agreeing to the ',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ).toTextSpan(),
                            CustomTextSpan(
                              text: 'Terms & Condition',
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.blue96,
                              recognizer: TapGestureRecognizer()..onTap = () {
                                Get.off(()=>VendorCreateAccountTermsAndConditionsView(),preventDuplicates: false);
                              },
                            ).toTextSpan(),
                          ],
                        ),
                      ),


                      SpaceHelperWidget.v(20.h(context)),


                      ButtonHelperWidget.customButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {
                          Get.off(()=>VendorCreateAccountPickImageView(),preventDuplicates: false);
                        },
                        text: "Sign Up",
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
                            text: 'Already have an account? ',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ).toTextSpan(),
                          CustomTextSpan(
                            text: 'Sign In',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.blue96,
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Get.off(()=>VendorLoginView(),preventDuplicates: false);
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
