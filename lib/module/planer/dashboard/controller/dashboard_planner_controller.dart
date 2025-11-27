import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class DashboardPlannerController extends GetxController {

  RxInt selectedIndex = 0.obs;
  int index;
  DashboardPlannerController({required this.index});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await changeIndex(index: index);
    });
  }


  Future<void> changeIndex({required int index}) async {
    selectedIndex.value = index;
  }


  RxList<Map<String, dynamic>> items = [
    {'unselected': ImageUtils.unselectPlannerDashboardImage, 'select': ImageUtils.selectPlannerDashboardImage, 'label': 'Dashboard'},
    {'unselected': ImageUtils.unselectPlannerProjectImage, 'select': ImageUtils.selectPlannerProjectImage, 'label': 'Project'},
    {'unselected': ImageUtils.unselectPlannerVendorImage, 'select': ImageUtils.selectPlannerVendorImage, 'label': 'Vendor'},
    {'unselected': ImageUtils.unselectPlannerMessageImage, 'select': ImageUtils.selectPlannerMessageImage, 'label': 'Message'},
    {'unselected': ImageUtils.unselectPlannerAnalyticsImage, 'select': ImageUtils.selectPlannerAnalyticsImage, 'label': 'Analytics'},
    {'unselected': ImageUtils.unselectPlannerProfileImage, 'select': ImageUtils.selectPlannerProjectImage, 'label': 'Profile'},
  ].obs;

  RxList<Widget> pages = [
    PlannerHomeDashboardView(),
    PlannerProjectPage(),
    PlannerVendorView(),
    PlannerMessageView(),
    PlannerAnalyticsPage(),
    PlannerProfileView(),
  ].obs;




}