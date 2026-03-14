import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerAnalyticsController extends GetxController {

  Rx<PlannerMyProfileDetailsResponseModel> plannerMyProfileDetailsResponseModel = PlannerMyProfileDetailsResponseModel().obs;
  Rx<PlannerRevenueResponseModel> plannerRevenueResponseModel = PlannerRevenueResponseModel().obs;
  Rx<PlannerEventAnalysisResponseModel> plannerEventAnalysisResponseModel = PlannerEventAnalysisResponseModel().obs;
  Rx<PlannerVendorAnalysisResponseModel> plannerVendorAnalysisResponseModel = PlannerVendorAnalysisResponseModel().obs;
  RxBool isLoading = false.obs;
  BuildContext context;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  PlannerAnalyticsController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getPlannerProfileDetailsController(context: context);
      await getPlannerRevenueAnalysisController(context: context, eventYear: DateTime.now().year.toString(), categoryYear: DateTime.now().year.toString(), revenueYear: DateTime.now().year.toString());
      await getPlannerEventAnalysisController(context: context);
      await getPlannerVendorAnalysisController(context: context);
    });
  }


  Future<void> getPlannerProfileDetailsController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userProfileDetails,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        plannerMyProfileDetailsResponseModel.value = PlannerMyProfileDetailsResponseModel.fromJson(data);
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

  RxList<ServicePopularity> servicePopularity = <ServicePopularity>[].obs;



  Future<void> getPlannerRevenueAnalysisController({
    required BuildContext context,
    required String eventYear,
    required String categoryYear,
    required String revenueYear,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getPlannerAnalyticResponse(eventYear, categoryYear, revenueYear),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        plannerRevenueResponseModel.value = PlannerRevenueResponseModel.fromJson(data);
        for(var i = 0;i < plannerRevenueResponseModel.value.data!.eventManagedOverview!.length;i ++) {
          eventsBarData.add(
            BarChartGroupData(x: i, barRods: [BarChartRodData(toY: double.parse(plannerRevenueResponseModel.value.data!.eventManagedOverview![i].count.toString()),width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
          );
        }
        for(var i = 0;i < plannerRevenueResponseModel.value.data!.revenueGrowthOverview!.length;i ++) {
          revenueBarData.add(
            BarChartGroupData(x: i, barRods: [BarChartRodData(toY: plannerRevenueResponseModel.value.data!.revenueGrowthOverview?[i].amount / 1000,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
          );
        }
        for(var i = 0; i < plannerRevenueResponseModel.value.data!.vendorCategoryOverview!.length ; i++) {
          pieSections.add(
            PieChartSectionData(
              value: double.parse(plannerRevenueResponseModel.value.data!.vendorCategoryOverview![i].percentage.toString()),
              color: i%5 == 0 ? Colors.purple : i%5 == 1 ? Colors.green : i%5 == 2 ? Colors.orange : i%5 == 3 ? Colors.red : Colors.blue,
              title: '${plannerRevenueResponseModel.value.data!.vendorCategoryOverview![i].percentage}%',
              radius: 60,
            ),
          );
          servicePopularity.add(
              ServicePopularity(
                textColor: i%5 == 0 ? Colors.purple : i%5 == 1 ? Colors.green : i%5 == 2 ? Colors.orange : i%5 == 3 ? Colors.red : Colors.blue,
                title: plannerRevenueResponseModel.value.data!.vendorCategoryOverview![i].type,
                persentage: plannerRevenueResponseModel.value.data!.vendorCategoryOverview![i].percentage.toString(),
              )
          );
        }
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

  Future<void> getPlannerEventAnalysisController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getPlannerEventResponse,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        plannerEventAnalysisResponseModel.value = PlannerEventAnalysisResponseModel.fromJson(data);
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

  Future<void> getPlannerVendorAnalysisController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getPlannerVendorResponse,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        plannerVendorAnalysisResponseModel.value = PlannerVendorAnalysisResponseModel.fromJson(data);
        isLoading.value = false;
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


  RxInt eventManageYear = DateTime.now().year.obs;
  RxInt revenueGrowthYear = DateTime.now().year.obs;
  RxInt vendorCategoryYear = DateTime.now().year.obs;


  // Monthly events data for bar chart
  RxList<BarChartGroupData> eventsBarData = <BarChartGroupData>[].obs;

  // Pie chart data for vendor categories
  RxList<PieChartSectionData> pieSections = <PieChartSectionData>[].obs;

  // Revenue growth bar data (similar to events)
  RxList<BarChartGroupData> revenueBarData = <BarChartGroupData>[].obs;


  Rx<PlannerAnalyticTab> selectedTab = PlannerAnalyticTab.revenueTrends.obs;

  void changeTab(PlannerAnalyticTab status) {
    selectedTab.value = status;
  }


}

enum PlannerAnalyticTab {revenueTrends, eventTypes, topVendors}