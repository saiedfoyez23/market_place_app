import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';

class PlannerVendorProfilePortfolioController extends GetxController {

  BuildContext context;
  String userId;
  RxBool isLoading = false.obs;
  Rx<GetPlannerAllPortfolioResponseModel> getPlannerAllPortfolioResponseModel = GetPlannerAllPortfolioResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  PlannerVendorProfilePortfolioController({required this.context,required this.userId});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getPlannerAllPortfolioController(context: context, userId: userId);
    });
  }


  Future<void> getPlannerAllPortfolioController({
    required BuildContext context,
    required String userId,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getPlannerAllPortfolio(userId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getPlannerAllPortfolioResponseModel.value = GetPlannerAllPortfolioResponseModel.fromJson(data);
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