import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorProfileSubscriptionView extends StatelessWidget {
  const VendorProfileSubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  Get.off(()=>VendorProfileManageSubscriptionView(),preventDuplicates: false);
                },
                title: "Choose your plan",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SpaceHelperWidget.v(16.h(context)),

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        textAlign: TextAlign.start,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "Pick the right plan for your pet",
                      ),

                      SpaceHelperWidget.v(16.h(context)),


                      /// ------- VERIFIED PLAN -------
                      planCard(
                        title: "Verified",
                        price: "\$199/month",
                        context: context,
                        features: const [
                          "Verified badge",
                          "Review access",
                          "Photo uploads",
                          "Portfolio display",
                          "Analytics Dashboard",
                        ],
                      ),

                      SpaceHelperWidget.v(20.h(context)),


                      /// ------- PREMIUM PLAN -------
                      planCard(
                        title: "Premium",
                        price: "\$399/month",
                        context: context,
                        features: const [
                          "All Verified features",
                          "Featured listing priority",
                          "Ad boost",
                          "Lead insights",
                          "Detailed sales reports",
                        ],
                      ),

                      SpaceHelperWidget.v(20.h(context)),


                      /// ------- PLANNER PRO PLAN -------
                      planCard(
                        title: "Planner Pro",
                        price: "\$249/month",
                        context: context,
                        features: const [
                          "Advanced project tools",
                          "Vendor matching",
                          "Budget management dashboard",
                        ],
                      ),

                      SpaceHelperWidget.v(40.h(context)),

                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  /// ------------------------------
  /// PLAN CARD WIDGET
  /// ------------------------------
  Widget planCard({
    required String title,
    required String price,
    required List<String> features,
    required BuildContext context
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 20.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white255,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ColorUtils.white208),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP TITLE + PRICE


          Row(
            children: [


              Expanded(
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  textAlign: TextAlign.start,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textColor: ColorUtils.black61,
                  text: title,
                ),
              ),


              Expanded(
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerRight,
                  textAlign: TextAlign.start,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textColor: ColorUtils.black61,
                  text: price,
                ),
              ),




            ],
          ),


          SpaceHelperWidget.v(20.h(context)),

          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black64,
            text: "Features list",
          ),

          SpaceHelperWidget.v(10.h(context)),


          /// FEATURES LIST
          Column(
            children: features.map((feature) => Padding(
              padding: EdgeInsets.only(bottom: 12.bpm(context)),
              child: Row(
                children: [

                  ImageHelperWidget.assetImageWidget(
                    context: context,
                    height: 26.h(context),
                    width: 26.w(context),
                    imageString: ImageUtils.blackRigthSignImage,
                  ),

                  SpaceHelperWidget.h(8.w(context)),


                  Expanded(
                    child: TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      textAlign: TextAlign.start,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textColor: ColorUtils.black48,
                      text: feature,
                    ),
                  )
                ],
              ),
            )).toList(),
          ),

          SpaceHelperWidget.v(20.h(context)),


          ButtonHelperWidget.customButtonWidgetAdventPro(
            context: context,
            onPressed: () async {
              Get.off(()=>VendorProfilePaymentSuccessView(),preventDuplicates: false);
            },
            text: "Purchase Plan",
          ),


        ],
      ),
    );
  }
}
