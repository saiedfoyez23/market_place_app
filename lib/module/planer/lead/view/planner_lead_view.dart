import 'package:flutter/material.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerLeadView extends StatelessWidget {
  const PlannerLeadView({super.key});

  @override
  Widget build(BuildContext context) {
    final PlannerLeadController plannerLeadController = Get.put(PlannerLeadController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardPlannerView(index: 0),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white255,
            ),
            child: plannerLeadController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(context: context,height: 930.h(context)) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardPlannerView(index: 0),preventDuplicates: false);
                  },
                  title: "Leads",
                ),



                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [


                        /// Summary Cards


                        Row(
                          children: [

                            Expanded(
                              child: SummaryCardWidget(
                                title: "New Leads",
                                value: plannerLeadController.plannerLeadsResponseModel.value.data?.newLeads.toString() ?? "0",
                                logo: ImageUtils.newLeadImage,
                                borderColor: ColorUtils.newLeads,
                              ),
                            ),

                            SpaceHelperWidget.h(16.w(context)),


                            Expanded(
                              child: SummaryCardWidget(
                                title: "Contacted",
                                value: plannerLeadController.plannerLeadsResponseModel.value.data?.contracted.toString() ?? "0",
                                logo: ImageUtils.contactedLeadImage,
                                borderColor: ColorUtils.contactedLeads,
                              ),
                            )


                          ],
                        ),


                        SpaceHelperWidget.v(16.h(context)),


                        Row(
                          children: [

                            Expanded(
                              child: SummaryCardWidget(
                                title: "Qualified",
                                value: plannerLeadController.plannerLeadsResponseModel.value.data?.qualified.toString() ?? "0",
                                logo: ImageUtils.qualifiedLeadImage,
                                borderColor: ColorUtils.qualifiedLeads,
                              ),
                            ),

                            SpaceHelperWidget.h(16.w(context)),


                            Expanded(
                              child: SummaryCardWidget(
                                title: "Left",
                                value: plannerLeadController.plannerLeadsResponseModel.value.data?.left.toString() ?? "0",
                                logo: ImageUtils.leftLeadImage,
                                borderColor: ColorUtils.leftLeads,
                              ),
                            )


                          ],
                        ),


                        SpaceHelperWidget.v(32.h(context)),

                        /// Tabs
                        CustomTabBarWidget(
                          selectedIndex: plannerLeadController.selectedTab.value,
                          onTap: (context,index) async {
                            plannerLeadController.isLoading.value = true;
                            await plannerLeadController.changeTab(context: context,index: index);
                          },
                        ),

                        SpaceHelperWidget.v(16.h(context)),

                      ],
                    ),
                  ),
                ),


                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  sliver: plannerLeadController.plannerLeadsResponseModel.value.data?.leadList?.isNotEmpty == true ?
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context,int index) {
                      return Obx(()=> LeadCardWidget(
                        isVendor: false,
                        index: index,
                        selectedTab: plannerLeadController.selectedTab.value,
                        plannerLeadsResponseModel: plannerLeadController.plannerLeadsResponseModel.value,
                      ));
                    }, childCount: plannerLeadController.plannerLeadsResponseModel.value.data?.leadList?.length,),
                  ) :
                  SliverFillRemaining(
                    child: Align(
                      alignment: Alignment.center,
                      child: TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.center,
                        textAlign: TextAlign.start,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        textColor: ColorUtils.black48,
                        text: "No Leads Available",
                      ),
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
