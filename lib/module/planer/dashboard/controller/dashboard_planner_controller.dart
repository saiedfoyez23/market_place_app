import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class DashboardPlannerController extends GetxController {

  RxInt selectedIndex = 0.obs;
  int index;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<PlannerMyProfileDetailsResponseModel> plannerMyProfileDetailsResponseModel = PlannerMyProfileDetailsResponseModel().obs;
  BuildContext context;
  DashboardPlannerController({required this.index,required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await changeIndex(index: index);
      await getPlannerProfileDetailsController(context: context);
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
    {'unselected': ImageUtils.unselectPlannerDashboardImage, 'select': ImageUtils.selectPlannerDashboardImage, 'label': 'Dashboard', "isMessage": false},
    {'unselected': ImageUtils.unselectPlannerProjectImage, 'select': ImageUtils.selectPlannerProjectImage, 'label': 'Projects', "isMessage": false},
    {'unselected': ImageUtils.unselectPlannerVendorImage, 'select': ImageUtils.selectPlannerVendorImage, 'label': 'Vendor', "isMessage": false},
    {'unselected': ImageUtils.unselectPlannerMessageImage, 'select': ImageUtils.selectPlannerMessageImage, 'label': 'Messages', "isMessage": true},
    {'unselected': ImageUtils.unselectPlannerAnalyticsImage, 'select': ImageUtils.selectPlannerAnalyticsImage, 'label': 'Analytics', "isMessage": false},
    {'unselected': ImageUtils.unselectPlannerProfileImage, 'select': ImageUtils.selectPlannerProfileImage, 'label': 'Profile', "isMessage": false},
  ].obs;

  RxList<Widget> pages = [
    PlannerHomeDashboardView(),
    PlannerProjectView(),
    PlannerVendorView(),
    PlannerMessageView(),
    PlannerAnalyticsView(),
    PlannerProfileView(),
  ].obs;




}