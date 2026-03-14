import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerProfileServiceController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  Rx<PlannerMyProfileDetailsResponseModel> plannerMyProfileDetailsResponseModel = PlannerMyProfileDetailsResponseModel().obs;
  Rx<PlannerGetAllServiceModelResponse> plannerGetAllServiceModelResponse = PlannerGetAllServiceModelResponse().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  BuildContext context;
  PlannerProfileServiceController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getPlannerProfileDetailsController(context: context);
      await getPlannerAllServiceController(context: context);
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

  Future<void> getPlannerAllServiceController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.myAllService,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        plannerGetAllServiceModelResponse.value = PlannerGetAllServiceModelResponse.fromJson(data);
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


  Future<void> addFeaturedController({
    required BuildContext context,
    required String serviceId,
  }) async {
    BaseApiUtils.patch(
      url: ApiUtils.addFeatureController(serviceId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = true;
        await getPlannerAllServiceController(context: context);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value = false;
      },
    );
  }

  Future<void> deletePlannerServiceController({
    required BuildContext context,
    required String serviceId,
  }) async {
    BaseApiUtils.delete(
      url: "${ApiUtils.deleteService}/${serviceId}",
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = true;
        isDelete.value = false;
        Navigator.pop(context);
        await getPlannerAllServiceController(context: context);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value = false;
      },
    );
  }


}