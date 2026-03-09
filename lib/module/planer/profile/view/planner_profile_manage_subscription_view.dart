import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerProfileManageSubscriptionView extends StatelessWidget {
  const PlannerProfileManageSubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final PlannerProfileManageSubscriptionController plannerProfileManageSubscriptionController = Get.put(PlannerProfileManageSubscriptionController(context: context));
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
            child: plannerProfileManageSubscriptionController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
                  },
                  title: "Subscription",
                ),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [

                        SpaceHelperWidget.v(16.h(context)),

                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          textAlign: TextAlign.start,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.black48,
                          text: "Current Plan",
                        ),

                        SpaceHelperWidget.v(16.h(context)),


                        plannerProfileManageSubscriptionController.getUserSubscriptionResponseModel.value.data == null ?
                        SizedBox(
                          height: 330.h(context),
                          width: 428.w(context),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.center,
                              textAlign: TextAlign.start,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              textColor: ColorUtils.black48,
                              text: "No Subscription Available",
                            ),
                          ),
                        ) :
                        Container(
                          width: 428.w(context),
                          padding: EdgeInsets.symmetric(horizontal: 16.hpm(context),vertical: 20.vpm(context)),
                          decoration: BoxDecoration(
                            color: ColorUtils.orange241,
                            borderRadius: BorderRadius.circular(12.r(context)),
                          ),
                          child: Column(
                            children: [

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
                                      text: "${plannerProfileManageSubscriptionController.getUserSubscriptionResponseModel.value.data?.package?.title ?? ""} (${plannerProfileManageSubscriptionController.getUserSubscriptionResponseModel.value.data?.package?.type ?? ""})",
                                    ),
                                  ),

                                  SpaceHelperWidget.h(10.w(context)),


                                  Expanded(
                                    child:  RichTextHelperWidget.headingRichText(
                                      context: context,
                                      alignment: Alignment.centerRight,
                                      textSpans: [
                                        CustomTextSpan(
                                          text: '\$${plannerProfileManageSubscriptionController.getUserSubscriptionResponseModel.value.data?.package?.price ?? "0.0"}/',
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600,
                                          color: ColorUtils.black61,
                                        ).toTextSpan(),
                                        CustomTextSpan(
                                          text: plannerProfileManageSubscriptionController.getUserSubscriptionResponseModel.value.data?.package?.billingCycle,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: ColorUtils.black61,
                                        ).toTextSpan(),
                                      ],
                                    ),
                                  ),




                                ],
                              ),

                              SpaceHelperWidget.v(14.5.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                textAlign: TextAlign.start,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black48,
                                text: "${plannerProfileManageSubscriptionController.getDynamicTime(plannerProfileManageSubscriptionController.getUserSubscriptionResponseModel.value.data?.createdAt, plannerProfileManageSubscriptionController.getUserSubscriptionResponseModel.value.data?.expiredAt)} Remaining",
                              ),


                              SpaceHelperWidget.v(20.5.h(context)),

                              ButtonHelperWidget.customButtonWidgetAdventPro(
                                context: context,
                                textColor: ColorUtils.red202,
                                backgroundColor: ColorUtils.red9,
                                onPressed: () async {
                                  CancelSubscriptionPlanDialogBoxWidget().cancelSubscriptionPlanDialogBoxWidget(
                                    context: context,
                                    planId: plannerProfileManageSubscriptionController.getUserSubscriptionResponseModel.value.data?.sId,
                                    plannerProfileManageSubscriptionController: plannerProfileManageSubscriptionController,
                                  );
                                },
                                text: "Cancel Plan",
                              ),

                            ],
                          ),
                        ),


                        SpaceHelperWidget.v(24.h(context)),


                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            Get.off(()=>PlannerProfileSubscriptionView(),preventDuplicates: false);
                          },
                          text: "Update Plan",
                        ),

                        SpaceHelperWidget.v(24.h(context)),




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
