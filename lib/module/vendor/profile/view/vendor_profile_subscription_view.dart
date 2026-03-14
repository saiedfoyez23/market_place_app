import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorProfileSubscriptionView extends StatelessWidget {
  const VendorProfileSubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorProfileSubscriptionController vendorProfileSubscriptionController = Get.put(VendorProfileSubscriptionController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>VendorProfileManageSubscriptionView(),preventDuplicates: false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(()=>Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: vendorProfileSubscriptionController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
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


                        Column(
                          children: List.generate(vendorProfileSubscriptionController.getAllPlannerPackagesResponseModel.value.data!.length, (index) {
                            return Column(
                              children: [

                                vendorProfileSubscriptionController.isSubmit.value == true && vendorProfileSubscriptionController.selectId.value == vendorProfileSubscriptionController.getAllPlannerPackagesResponseModel.value.data?[index].sId ?
                                LoadingHelperWidget.loadingHelperWidget(
                                  context: context,
                                ) :
                                planCard(
                                  title: "${vendorProfileSubscriptionController.getAllPlannerPackagesResponseModel.value.data?[index].title ?? ""} (${vendorProfileSubscriptionController.getAllPlannerPackagesResponseModel.value.data?[index].type ?? ""})",
                                  price: "\$${vendorProfileSubscriptionController.getAllPlannerPackagesResponseModel.value.data?[index].price ?? 0.0}/${vendorProfileSubscriptionController.getAllPlannerPackagesResponseModel.value.data?[index].billingCycle}",
                                  context: context,
                                  features: vendorProfileSubscriptionController.getAllPlannerPackagesResponseModel.value.data?[index].description ?? [],
                                  onPressed: () async {
                                    vendorProfileSubscriptionController.isSubmit.value = true;
                                    vendorProfileSubscriptionController.selectId.value = vendorProfileSubscriptionController.getAllPlannerPackagesResponseModel.value.data?[index].sId;
                                    Map<String,dynamic> data = {
                                      "user": vendorProfileSubscriptionController.vendorMyProfileDetailsResponseModel.value.data?.sId ?? "",
                                      "package": vendorProfileSubscriptionController.getAllPlannerPackagesResponseModel.value.data?[index].sId ?? "",
                                    };
                                    print(jsonEncode(data));
                                    await vendorProfileSubscriptionController.createSubscriptionController(
                                      context: context,
                                      data: data,
                                      onComplete: (sid) async {
                                        print("call");
                                        Map<String,dynamic> data = {
                                          "modelType": "Subscription",
                                          "user": vendorProfileSubscriptionController.vendorMyProfileDetailsResponseModel.value.data?.sId ?? "",
                                          "reference": sid,
                                        };
                                        print(jsonEncode(data));
                                        await vendorProfileSubscriptionController.createPaymentController(context: context, data: data);
                                      },
                                    );

                                  },
                                ),

                                SpaceHelperWidget.v(20.h(context)),


                              ],
                            );
                          }),
                        ),


                        SpaceHelperWidget.v(40.h(context)),

                      ],
                    ),
                  ),
                )

              ],
            ),
          )),
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
    required BuildContext context,
    required Function() onPressed,
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
            onPressed: onPressed,
            text: "Purchase Plan",
          ),


        ],
      ),
    );
  }
}
