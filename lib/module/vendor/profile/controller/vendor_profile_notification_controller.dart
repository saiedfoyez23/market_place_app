import 'dart:convert';

import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:flutter/material.dart';


class VendorProfileNotificationController extends GetxController {

  RxBool newProfile = false.obs;
  RxBool newBookings = false.obs;
  RxBool newService = false.obs;
  RxBool newSubscription = false.obs;
  RxBool newPayment = false.obs;
  RxBool isLoading = false.obs;
  BuildContext context;
  VendorProfileNotificationController({required this.context});

  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  Rx<VendorMyProfileDetailsResponseModel> vendorMyProfileDetailsResponseModel = VendorMyProfileDetailsResponseModel().obs;

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
        newProfile.value = vendorMyProfileDetailsResponseModel.value.data?.notifySettings?.profile;
        newBookings.value = vendorMyProfileDetailsResponseModel.value.data?.notifySettings?.bookings;
        newService.value = vendorMyProfileDetailsResponseModel.value.data?.notifySettings?.service;
        newSubscription.value = vendorMyProfileDetailsResponseModel.value.data?.notifySettings?.subscription;
        newPayment.value = vendorMyProfileDetailsResponseModel.value.data?.notifySettings?.payment;
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


  Future<void> updateVendorChangeNotifyController({
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
        await getVendorProfileDetailsController(context: context);
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