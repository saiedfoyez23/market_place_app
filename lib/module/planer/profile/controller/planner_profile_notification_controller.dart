import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerProfileNotificationController extends GetxController {

  RxBool newProfile = false.obs;
  RxBool newBookings = false.obs;
  RxBool newService = false.obs;
  RxBool newSubscription = false.obs;
  RxBool newPayment = false.obs;
  RxBool isLoading = false.obs;

  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<PlannerMyProfileDetailsResponseModel> plannerMyProfileDetailsResponseModel = PlannerMyProfileDetailsResponseModel().obs;

  BuildContext context;
  PlannerProfileNotificationController({required this.context});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
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
        isLoading.value = false;
        plannerMyProfileDetailsResponseModel.value = PlannerMyProfileDetailsResponseModel.fromJson(data);
        newProfile.value = plannerMyProfileDetailsResponseModel.value.data?.notifySettings?.profile;
        newBookings.value = plannerMyProfileDetailsResponseModel.value.data?.notifySettings?.bookings;
        newService.value = plannerMyProfileDetailsResponseModel.value.data?.notifySettings?.service;
        newSubscription.value = plannerMyProfileDetailsResponseModel.value.data?.notifySettings?.subscription;
        newPayment.value = plannerMyProfileDetailsResponseModel.value.data?.notifySettings?.payment;
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


  Future<void> updatePlannerChangeNotifyController({
    required BuildContext context,
  }) async {

    print(userLoginResponseModel.value.data?.accessToken);

    Map<String,dynamic> data = {
      "all": false,
      "profile": newProfile.value,
      "service": newService.value,
      "bookings": newBookings.value,
      "subscription": newSubscription.value,
      "payment": newPayment.value,
    };

    print(data);

    BaseApiUtils.put(
      url: ApiUtils.userChangeNotify,
      authorization: userLoginResponseModel.value.data?.accessToken,
      data: data,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        await getPlannerProfileDetailsController(context: context);
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


}