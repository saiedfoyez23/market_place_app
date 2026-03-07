import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';



class PlannerVendorController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<GetAllVendorServiceResponseModel> getAllVendorServiceResponseModel = GetAllVendorServiceResponseModel().obs;
  BuildContext context;
  Rx<PlannerMyProfileDetailsResponseModel> plannerMyProfileDetailsResponseModel = PlannerMyProfileDetailsResponseModel().obs;
  PlannerVendorController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getPlannerProfileDetailsController(context: context);
      await getAllVendorServiceController(context: context);
    });
  }

  Future<void> getAllVendorServiceController({required BuildContext context}) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllVendorServiceResponse,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllVendorServiceResponseModel.value = GetAllVendorServiceResponseModel.fromJson(data);
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

  // Future<void> createFavoritesController({
  //   required BuildContext context,
  //   required String serviceId,
  // }) async {
  //   BaseApiUtils.post(
  //     url: "${ApiUtils.createFavoriteResponse}/${serviceId}",
  //     authorization: userLoginResponseModel.value.data?.accessToken,
  //     onSuccess: (e,data) async {
  //       isLoading.value = true;
  //       MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
  //       await getAllVendorServiceController(context: context);
  //     },
  //     onFail: (e,data) {
  //       MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
  //       isLoading.value = false;
  //     },
  //     onExceptionFail: (e,data) {
  //       MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
  //       isLoading.value = false;
  //     },
  //   );
  //
  // }


}
