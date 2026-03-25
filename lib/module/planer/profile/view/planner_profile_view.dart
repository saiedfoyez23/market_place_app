import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';


class PlannerProfileView extends StatelessWidget {
  const PlannerProfileView({super.key});


  @override
  Widget build(BuildContext context) {
    final PlannerProfileViewController plannerProfileViewController = Get.put(PlannerProfileViewController(context: context));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.type == null && plannerProfileViewController.isLoading.value == false ?
          RefreshIndicator(
            onRefresh: () async {
              Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
            },
            child: PlannerWithoutSubscriptionProfileWidget().plannerWithoutSubscriptionProfileWidget(context: context, plannerProfileViewController: plannerProfileViewController),
          ) : plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.type != null &&  plannerProfileViewController.isLoading.value == false ?
          RefreshIndicator(
            onRefresh: () async {
              Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
            },
            child: PlannerWithSubscriptionProfileWidget().plannerWithSubscriptionProfileWidget(context: context, plannerProfileViewController: plannerProfileViewController),
          ) :
          LoadingHelperWidget.loadingHelperWidget(
            context: context,
            height: 930.h(context),
          ),
        ),
      )),
    );
  }
}
