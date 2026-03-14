import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';

class VendorHomeDashboardController extends GetxController {
  Rx<VendorMyProfileDetailsResponseModel> vendorMyProfileDetailsResponseModel = VendorMyProfileDetailsResponseModel().obs;
  Rx<VendorHomePageResponseModel> vendorHomePageResponseModel = VendorHomePageResponseModel().obs;
  BuildContext context;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  VendorHomeDashboardController({required this.context});
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getVendorProfileDetailsController(context: context);
      await getVendorHomeDashboardController(context: context);
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
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }


  Future<void> getVendorHomeDashboardController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getVendorHomePage,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        vendorHomePageResponseModel.value = VendorHomePageResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }

  final RxInt activeBookings = 12.obs;
  final RxString monthlyRevenue = '\$241'.obs;
  final RxInt totalBookings = 220.obs;
  final RxString totalEarnings = '\$24,350'.obs;

  // Upcoming bookings data
  RxList<Map<String, dynamic>> upcomingBookings = [
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
  ].obs;

  // Top partnerships data
  RxList<Map<String, dynamic>> topPartnerships = [
    {'name': 'Elegant Catering Co.', 'projects': '8 projects together', 'rating': 4.8},
    {'name': 'Elegant Catering Co.', 'projects': '8 projects together', 'rating': 4.8},
    {'name': 'Elegant Catering Co.', 'projects': '8 projects together', 'rating': 4.8},
    {'name': 'Elegant Catering Co.', 'projects': '8 projects together', 'rating': 4.8},
  ].obs;

}