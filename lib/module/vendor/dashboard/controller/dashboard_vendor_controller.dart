import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';


class DashboardVendorController extends GetxController {

  RxInt selectedIndex = 0.obs;
  int index;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  Rx<VendorMyProfileDetailsResponseModel> vendorMyProfileDetailsResponseModel = VendorMyProfileDetailsResponseModel().obs;
  BuildContext context;
  DashboardVendorController({required this.index,required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await changeIndex(index: index);
      await getVendorProfileDetailsController(context: context);
    });
  }


  Future<void> getVendorProfileDetailsController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userProfileDetails,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        vendorMyProfileDetailsResponseModel.value = VendorMyProfileDetailsResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
    );
  }


  Future<void> changeIndex({required int index}) async {
    selectedIndex.value = index;
  }


  RxList<Map<String, dynamic>> items = [
    {'unselected': ImageUtils.unselectVendorDashboardImage, 'select': ImageUtils.selectVendorDashboardImage, 'label': 'Dashboard', "isMessage": false},
    {'unselected': ImageUtils.unselectVendorServiceImage, 'select': ImageUtils.selectVendorServiceImage, 'label': 'Services', "isMessage": false},
    {'unselected': ImageUtils.unselectVendorBookingImage, 'select': ImageUtils.selectVendorBookingImage, 'label': 'Bookings', "isMessage": false},
    {'unselected': ImageUtils.unselectVendorMessageImage, 'select': ImageUtils.selectVendorMessageImage, 'label': 'Messages', "isMessage": true},
    {'unselected': ImageUtils.unselectVendorAnalyticsImage, 'select': ImageUtils.selectVendorAnalyticsImage, 'label': 'Analytics', "isMessage": false},
    {'unselected': ImageUtils.unselectVendorProfileImage, 'select': ImageUtils.selectVendorProfileImage, 'label': 'Profile', "isMessage": false},
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