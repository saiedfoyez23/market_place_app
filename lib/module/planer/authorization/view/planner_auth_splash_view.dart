import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerAuthSplashView extends StatelessWidget {
  const PlannerAuthSplashView({super.key});

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

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                child: Column(
                  children: [


                    SpaceHelperWidget.v(177.h(context)),

                    ImageHelperWidget.assetImageWidget(
                      context: context,
                      height: 70,
                      width: 344,
                      imageString: ImageUtils.logoImage,
                    ),


                    SpaceHelperWidget.v(24.h(context)),


                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.center,
                      textAlign: TextAlign.center,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      textColor: ColorUtils.black96,
                      text: "Join Verified Plug to connect with trusted vendors, manage your events, and enjoy a seamless booking experience - all in one place!",
                    ),


                    SpaceHelperWidget.v(130.h(context)),


                    ButtonHelperWidget.customButtonWidgetAdventPro(
                      context: context,
                      onPressed: () async {
                        Get.off(()=>PlannerCreateAccountView(),preventDuplicates: false);
                      },
                      text: "Sign Up",
                    ),


                    SpaceHelperWidget.v(16.h(context)),


                    ButtonHelperWidget.customIconButtonWidgetAdventPro(
                      context: context,
                      onPressed: () async {
                        Get.off(()=>PlannerLoginView(),preventDuplicates: false);
                      },
                      textSize: 24,
                      iconPath: "",
                      text: "Sign In",
                      isIcon: false,
                      textColor: ColorUtils.orange119,
                      borderColor: ColorUtils.orange119,
                      borderWidth: 1,
                    ),


                    SpaceHelperWidget.v(32.h(context)),


                    RichTextHelperWidget.headingRichText(
                      context: context,
                      alignment: Alignment.center,
                      textAlign: TextAlign.center,
                      textSpans: [
                        CustomTextSpan(
                          text: 'By signing up you confirm that you have read & agree to the our ',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ).toTextSpan(),
                        CustomTextSpan(
                          text: 'Privacy Policy',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.blue96,
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Get.off(()=>PlannerPrivacyPolicyView(),preventDuplicates: false);
                          },
                        ).toTextSpan(),
                        CustomTextSpan(
                          text: ' and ',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ).toTextSpan(),
                        CustomTextSpan(
                          text: 'Terms & conditions',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.blue96,
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Get.off(()=>PlannerTermsAndConditionsView(),preventDuplicates: false);
                          },
                        ).toTextSpan(),
                      ],
                    ),


                    SpaceHelperWidget.v(32.h(context)),







                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
