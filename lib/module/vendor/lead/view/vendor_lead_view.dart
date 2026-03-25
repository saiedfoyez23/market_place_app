import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorLeadView extends StatelessWidget {
  const VendorLeadView({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorLeadController vendorLeadController = Get.put(VendorLeadController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardVendorView(index: 0),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white255,
            ),
            child: vendorLeadController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(context: context,height: 930.h(context)) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardVendorView(index: 0),preventDuplicates: false);
                  },
                  title: "Leads",
                ),



                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [


                        /// Summary Cards
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.8,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            SummaryCardWidget(
                              title: "New Leads",
                              value: vendorLeadController.plannerLeadsResponseModel.value.data?.newLeads.toString() ?? "0",
                              logo: ImageUtils.newLeadImage,
                              borderColor: ColorUtils.newLeads,
                            ),
                            SummaryCardWidget(
                              title: "Contacted",
                              value: vendorLeadController.plannerLeadsResponseModel.value.data?.contracted.toString() ?? "0",
                              logo: ImageUtils.contactedLeadImage,
                              borderColor: ColorUtils.contactedLeads,
                            ),
                            SummaryCardWidget(
                              title: "Qualified",
                              value: vendorLeadController.plannerLeadsResponseModel.value.data?.qualified.toString() ?? "0",
                              logo: ImageUtils.qualifiedLeadImage,
                              borderColor: ColorUtils.qualifiedLeads,
                            ),
                            SummaryCardWidget(
                              title: "Left",
                              value: vendorLeadController.plannerLeadsResponseModel.value.data?.left.toString() ?? "0",
                              logo: ImageUtils.leftLeadImage,
                              borderColor: ColorUtils.leftLeads,
                            ),
                          ],
                        ),


                        SpaceHelperWidget.v(32.h(context)),

                        /// Tabs
                        CustomTabBarWidget(
                          selectedIndex: vendorLeadController.selectedTab.value,
                          onTap: (context,index) async {
                            vendorLeadController.isLoading.value = true;
                            await vendorLeadController.changeTab(context: context,index: index);
                          },
                        ),

                        SpaceHelperWidget.v(16.h(context)),

                      ],
                    ),
                  ),
                ),


                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  sliver: vendorLeadController.plannerLeadsResponseModel.value.data?.leadList?.isNotEmpty == true ?
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context,int index) {
                      return Obx(()=> LeadCardWidget(
                        isVendor: true,
                        index: index,
                        selectedTab: vendorLeadController.selectedTab.value,
                        plannerLeadsResponseModel: vendorLeadController.plannerLeadsResponseModel.value,
                      ));
                    }, childCount: vendorLeadController.plannerLeadsResponseModel.value.data?.leadList?.length,),
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
