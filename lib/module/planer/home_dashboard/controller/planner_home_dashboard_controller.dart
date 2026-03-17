import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class PlannerHomeDashboardController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<GetPlannerMetaResponseModel> getPlannerMetaResponseModel = GetPlannerMetaResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<PlannerMyProfileDetailsResponseModel> plannerMyProfileDetailsResponseModel = PlannerMyProfileDetailsResponseModel().obs;
  BuildContext context;
  PlannerHomeDashboardController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getPlannerProfileDetailsController(context: context);
      await getPlannerMetaController(context: context);
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

  Future<void> getPlannerMetaController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.planerMeta,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        getPlannerMetaResponseModel.value = GetPlannerMetaResponseModel.fromJson(data);
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

  String getDynamicTime(String start, String end) {
    final diff = DateTime.parse(end).difference(DateTime.parse(start));

    if (diff.inSeconds < 60) {
      int s = diff.inSeconds;
      return "$s second${s == 1 ? '' : 's'}";
    } else if (diff.inMinutes < 60) {
      int m = diff.inMinutes;
      return "$m minute${m == 1 ? '' : 's'}";
    } else if (diff.inHours < 24) {
      int h = diff.inHours;
      return "$h hour${h == 1 ? '' : 's'}";
    } else if (diff.inDays < 365) {
      int d = diff.inDays;
      return "$d day${d == 1 ? '' : 's'}";
    } else {
      int y = (diff.inDays / 365).floor();
      return "$y year${y == 1 ? '' : 's'}";
    }
  }


  final RxInt activeProject = 12.obs;
  final RxInt upcomingEvent = 3.obs;
  final RxInt newLeads = 220.obs;
  final RxString totalEarnings = '\$24,350'.obs;

  // Upcoming bookings data
  RxList<Map<String, dynamic>> upcomingBookings = [
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
  ].obs;

  // Top partnerships data
  RxList<Map<String, dynamic>> topPartnerships = [
    {'name': 'Payment received from client XYZ.', 'time': '2 hours ago', 'image': ImageUtils.recentActivitiesImage1},
    {'name': 'Vendor ABC confirmed for event..', 'time': 'Nov 5, 2025', 'image': ImageUtils.recentActivitiesImage2},
    {'name': 'Congratulations! You earned a Ver..', 'time': '1 day Ago', 'image': ImageUtils.recentActivitiesImage3},
  ].obs;


}