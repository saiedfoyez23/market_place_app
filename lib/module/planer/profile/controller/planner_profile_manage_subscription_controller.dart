import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerProfileManageSubscriptionController extends GetxController {

  Rx<GetUserSubscriptionResponseModel> getUserSubscriptionResponseModel = GetUserSubscriptionResponseModel().obs;
  RxBool isLoading = false.obs;
  RxBool isCancel = false.obs;
  BuildContext context;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  PlannerProfileManageSubscriptionController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllPlannerPackagesController(context: context);
    });
  }

  String getDynamicTime(String start, String end) {
    final diff = DateTime.parse(end).difference(DateTime.parse(start));

    if (diff.inMinutes < 60) {
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

  Future<void> getAllPlannerPackagesController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userMySubscription,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        getUserSubscriptionResponseModel.value = GetUserSubscriptionResponseModel.fromJson(data);
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


  Future<void> cancelPlannerPackagesController({
    required BuildContext context,
    required String plainId,
  }) async {
    BaseApiUtils.patch(
      url: ApiUtils.cancelSubscriptionResponse(plainId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = true;
        isCancel.value = false;
        Get.back();
        await getAllPlannerPackagesController(context: context);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isCancel.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isCancel.value = false;
      },
    );
  }


}