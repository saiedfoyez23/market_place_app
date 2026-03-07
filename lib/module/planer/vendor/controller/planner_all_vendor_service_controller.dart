import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class PlannerAllVendorServiceController extends GetxController {

  RxBool isLoading = false.obs;
  BuildContext context;
  String userId;
  PlannerAllVendorServiceController({required this.context,required this.userId});
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<GetAllPlannerWiseServiceResponseModel> getAllPlannerWiseServiceResponseModel = GetAllPlannerWiseServiceResponseModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllPlannerWiseServiceDetailsController(context: context, userId: userId);
    });
  }


  Future<void> getAllPlannerWiseServiceDetailsController({
    required BuildContext context,
    required String userId,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getUserWisePlannerService(userId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllPlannerWiseServiceResponseModel.value = GetAllPlannerWiseServiceResponseModel.fromJson(data);
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