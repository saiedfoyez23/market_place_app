import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';

class PlannerVendorProfileFeatureController extends GetxController {

  RxBool isLoading = false.obs;
  BuildContext context;
  String userId;
  PlannerVendorProfileFeatureController({required this.context,required this.userId});
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;
  Rx<GetAllFeaturedServiceResponseModel> getAllFeaturedServiceResponseModel = GetAllFeaturedServiceResponseModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllPlannerFeatureServiceDetailsController(context: context, userId: userId);
    });
  }


  Future<void> getAllPlannerFeatureServiceDetailsController({
    required BuildContext context,
    required String userId,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getUserFeaturedService(userId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllFeaturedServiceResponseModel.value = GetAllFeaturedServiceResponseModel.fromJson(data);
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