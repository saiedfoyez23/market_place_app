import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';
class DashboardVendorController extends GetxController {

  RxInt selectedIndex = 0.obs;
  int index;
  DashboardVendorController({required this.index});

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
    {'unselected': ImageUtils.unselectVendorDashboardImage, 'select': ImageUtils.selectVendorDashboardImage, 'label': 'Dashboard'},
    {'unselected': ImageUtils.unselectVendorServiceImage, 'select': ImageUtils.selectVendorServiceImage, 'label': 'Services'},
    {'unselected': ImageUtils.unselectVendorBookingImage, 'select': ImageUtils.selectVendorBookingImage, 'label': 'Bookings'},
    {'unselected': ImageUtils.unselectVendorMessageImage, 'select': ImageUtils.selectVendorMessageImage, 'label': 'Messages'},
    {'unselected': ImageUtils.unselectVendorAnalyticsImage, 'select': ImageUtils.selectVendorAnalyticsImage, 'label': 'Analytics'},
    {'unselected': ImageUtils.unselectVendorProfileImage, 'select': ImageUtils.selectVendorProfileImage, 'label': 'Profile'},
  ].obs;

  RxList<Widget> pages = [
    VendorHomeDashboardView(),
    VendorServicesView(),
    VendorBookingView(),
    VendorMessageView(),
    VendorAnalysisView(),
    VendorProfileView(),
  ].obs;



}