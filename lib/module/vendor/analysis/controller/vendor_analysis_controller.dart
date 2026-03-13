import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class VendorAnalysisController extends GetxController {
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  Rx<VendorMyProfileDetailsResponseModel> vendorMyProfileDetailsResponseModel = VendorMyProfileDetailsResponseModel().obs;
  RxBool isLoading = false.obs;
  BuildContext context;
  VendorAnalysisController({required this.context});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
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
        isLoading.value = false;
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


  // Monthly Revenue Data
  RxList<double> monthlyRevenue = <double>[
    150, 130, 280, 180, 160, 310, 100, 100, 102, 103, 105, 110
  ].obs;

  // Client Satisfaction
  RxList<double> clientSatisfaction = <double>[
    240, 250, 260, 300, 220, 260, 280, 240, 300, 270, 260, 280
  ].obs;

  // Service Popularity Pie Chart
  Map<String, double> serviceData = {
    "Corporate": 35,
    "Weddings": 25,
    "Party": 15,
    "Other": 20,
    "Birthday": 5,
  };

  // Booking Trends (Line)
  RxList<double> bookingTrends = <double>[
    240, 260, 250, 300, 220, 260, 280, 240, 300, 290, 270, 260
  ].obs;

}