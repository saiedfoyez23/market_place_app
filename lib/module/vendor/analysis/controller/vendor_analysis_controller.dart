import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class VendorAnalysisController extends GetxController {
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  Rx<VendorMyProfileDetailsResponseModel> vendorMyProfileDetailsResponseModel = VendorMyProfileDetailsResponseModel().obs;
  Rx<VendorAnalysisResponseModel> vendorAnalysisResponseModel = VendorAnalysisResponseModel().obs;
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
      await getVendorAnalyticController(
        context: context,
        orderYear: DateTime.now().year.toString(),
        subscriptionYear: DateTime.now().year.toString(),
        bookingYear: DateTime.now().year.toString(),
      );
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

  RxList<PieChartSectionData> pieSections = <PieChartSectionData>[].obs;
  RxList<ServicePopularity> servicePopularity = <ServicePopularity>[].obs;
  RxInt eventManageYear = DateTime.now().year.obs;


  Future<void> getVendorAnalyticController({
    required BuildContext context,
    required String orderYear,
    required String subscriptionYear,
    required String bookingYear,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getVendorAnalyticResponse(orderYear, subscriptionYear, bookingYear),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        vendorAnalysisResponseModel.value = VendorAnalysisResponseModel.fromJson(data);
        for(var i = 0; i < vendorAnalysisResponseModel.value.data!.servicePopularity!.length ; i++) {
          pieSections.add(
            PieChartSectionData(
              value: double.parse(vendorAnalysisResponseModel.value.data!.servicePopularity![i].percentage.toString()),
              color: i%5 == 0 ? Colors.purple : i%5 == 1 ? Colors.green : i%5 == 2 ? Colors.orange : i%5 == 3 ? Colors.red : Colors.blue,
              title: '${vendorAnalysisResponseModel.value.data!.servicePopularity![i].percentage}%',
              radius: 60,
            ),
          );
          servicePopularity.add(
            ServicePopularity(
              textColor: i%5 == 0 ? Colors.purple : i%5 == 1 ? Colors.green : i%5 == 2 ? Colors.orange : i%5 == 3 ? Colors.red : Colors.blue,
              title: vendorAnalysisResponseModel.value.data!.servicePopularity![i].type,
              persentage: vendorAnalysisResponseModel.value.data!.servicePopularity![i].percentage.toString(),
            )
          );
        }
      },
      onFail: (e,data) {
        //MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        //MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
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


class ServicePopularity {
  Color textColor;
  String title;
  String persentage;

  ServicePopularity({
    required this.textColor,
    required this.title,
    required this.persentage,
  });
}