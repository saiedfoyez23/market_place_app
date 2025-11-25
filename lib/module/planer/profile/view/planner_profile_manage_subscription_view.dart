import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerProfileManageSubscriptionView extends StatelessWidget {
  const PlannerProfileManageSubscriptionView({super.key});

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
                                    text: "Verified",
                                  ),
                                ),


                                Expanded(
                                  child:  RichTextHelperWidget.headingRichText(
                                    context: context,
                                    alignment: Alignment.centerRight,
                                    textSpans: [
                                      CustomTextSpan(
                                        text: '199/',
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600,
                                        color: ColorUtils.black61,
                                      ).toTextSpan(),
                                      CustomTextSpan(
                                        text: 'month',
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
                              text: "12 Days Remaining",
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
      ),
    );
  }
}
