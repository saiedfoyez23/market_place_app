import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerPrivacyPolicyView extends StatelessWidget {
  const PlannerPrivacyPolicyView({super.key});

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
                Get.off(()=>PlannerAuthSplashView(),preventDuplicates: false);
              },
              title: "Privacy & Policy",
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
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black64,
                      text: "October 30, 2025",
                    ),

                    SpaceHelperWidget.v(6.h(context)),


                    RichTextHelperWidget.headingRichText(
                      context: context,
                      alignment: Alignment.centerLeft,
                      textAlign: TextAlign.start,
                      textSpans: [
                        CustomTextSpan(
                            text: 'Welcome to ',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ColorUtils.black96
                        ).toTextSpan(),
                        CustomTextSpan(
                          text: 'Verifiedplug',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.blue96,
                        ).toTextSpan(),
                        CustomTextSpan(
                          text: ' These Terms and Conditions outline the rules and regulations for the use of our exchange platform. By accessing or using our app, you agree to these terms.',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorUtils.black96,
                        ).toTextSpan(),
                      ],
                    ),


                    SpaceHelperWidget.v(30.h(context)),


                    Container(
                      height: 2.h(context),
                      decoration: BoxDecoration(
                        color: ColorUtils.white204,
                      ),
                    ),


                    SpaceHelperWidget.v(30.h(context)),



                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black64,
                      text: "1. Account Registration",
                    ),


                    SpaceHelperWidget.v(6.h(context)),



                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      textColor: ColorUtils.black96,
                      text: "To use our services, you must create an account. You agree to provide accurate and complete information and to keep your account credentials confidential.",
                    ),

                    SpaceHelperWidget.v(30.h(context)),


                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black64,
                      text: "2. Product Exchange Policy",
                    ),


                    SpaceHelperWidget.v(10.h(context)),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(top: 6.tpm(context)),
                          child: ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 24.h(context),
                            width: 24.w(context),
                            imageString: ImageUtils.blueCheckMarkImage,
                          ),
                        ),

                        SpaceHelperWidget.h(10.w(context)),


                        Expanded(
                          child: TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textColor: ColorUtils.black96,
                            text: "We reserve the right to update these terms at any time. Continued use of the app constitutes your acceptance of the revised terms.",
                          ),
                        ),
                      ],
                    ),


                    SpaceHelperWidget.v(20.h(context)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(top: 6.tpm(context)),
                          child: ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 24.h(context),
                            width: 24.w(context),
                            imageString: ImageUtils.blueCheckMarkImage,
                          ),
                        ),

                        SpaceHelperWidget.h(10.w(context)),


                        Expanded(
                          child: TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textColor: ColorUtils.black96,
                            text: "Items must be returned in their original condition, unopened, and with all tags attached.",
                          ),
                        ),
                      ],
                    ),


                    SpaceHelperWidget.v(20.h(context)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(top: 6.tpm(context)),
                          child: ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 24.h(context),
                            width: 24.w(context),
                            imageString: ImageUtils.blueCheckMarkImage,
                          ),
                        ),

                        SpaceHelperWidget.h(10.w(context)),


                        Expanded(
                          child: TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textColor: ColorUtils.black96,
                            text: "Certain categories may be non-returnable or non exchangeable.",
                          ),
                        ),
                      ],
                    ),



                    SpaceHelperWidget.v(30.h(context)),


                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black64,
                      text: "3. Refunds and Credits",
                    ),


                    SpaceHelperWidget.v(10.h(context)),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(top: 6.tpm(context)),
                          child: ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 24.h(context),
                            width: 24.w(context),
                            imageString: ImageUtils.blueCheckMarkImage,
                          ),
                        ),

                        SpaceHelperWidget.h(10.w(context)),


                        Expanded(
                          child: TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textColor: ColorUtils.black96,
                            text: "Refunds are processed once the returned item is received and inspected.",
                          ),
                        ),
                      ],
                    ),


                    SpaceHelperWidget.v(20.h(context)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(top: 6.tpm(context)),
                          child: ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 24.h(context),
                            width: 24.w(context),
                            imageString: ImageUtils.blueCheckMarkImage,
                          ),
                        ),

                        SpaceHelperWidget.h(10.w(context)),


                        Expanded(
                          child: TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textColor: ColorUtils.black96,
                            text: "Refunds are processed once the returned item is received and inspected.",
                          ),
                        ),
                      ],
                    ),


                    SpaceHelperWidget.v(20.h(context)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(top: 6.tpm(context)),
                          child: ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 24.h(context),
                            width: 24.w(context),
                            imageString: ImageUtils.blueCheckMarkImage,
                          ),
                        ),

                        SpaceHelperWidget.h(10.w(context)),


                        Expanded(
                          child: TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textColor: ColorUtils.black96,
                            text: "In certain cases, exchanges may be preferred over refunds, depending product availability.",
                          ),
                        ),
                      ],
                    ),



                    SpaceHelperWidget.v(30.h(context)),


                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black64,
                      text: "4. Changes to Terms",
                    ),


                    SpaceHelperWidget.v(6.h(context)),



                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      textColor: ColorUtils.black96,
                      text: "We reserve the right to update these terms at any time. Continued use of the app constitutes your acceptance of the revised terms.",
                    ),


                    SpaceHelperWidget.v(30.h(context)),


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
