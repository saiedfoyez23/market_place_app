import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class ProfileNotificationController extends GetxController {

  RxBool newProfile = false.obs;
  RxBool newBookings = false.obs;
  RxBool newService = false.obs;
  RxBool newSubscription = false.obs;
  RxBool newPayment = false.obs;

  RxBool isLoading = false.obs;
  Rx<UserMyProfileDetailsResponseModel> userMyProfileDetailsResponseModel = UserMyProfileDetailsResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;
  BuildContext context;
  ProfileNotificationController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getProfileController(context: context);
    });
  }


  Future<void> getProfileController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userProfileDetails,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        print(data);
        userMyProfileDetailsResponseModel.value = UserMyProfileDetailsResponseModel.fromJson(data);
        newProfile.value = userMyProfileDetailsResponseModel.value.data?.notifySettings?.profile;
        newBookings.value = userMyProfileDetailsResponseModel.value.data?.notifySettings?.bookings;
        newService.value = userMyProfileDetailsResponseModel.value.data?.notifySettings?.service;
        newSubscription.value = userMyProfileDetailsResponseModel.value.data?.notifySettings?.subscription;
        newPayment.value = userMyProfileDetailsResponseModel.value.data?.notifySettings?.payment;
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


  Future<void> updateUserChangeNotifyController({
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
        await getProfileController(context: context);
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