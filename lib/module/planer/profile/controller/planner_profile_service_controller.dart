import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerProfileServiceController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<PlannerGetAllServiceModelResponse> plannerGetAllServiceModelResponse = PlannerGetAllServiceModelResponse().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  BuildContext context;
  PlannerProfileServiceController({required this.context});

  final List<Map<String, dynamic>> serviceList = [
    {
      "image": ImageUtils.wishlistImage,
      "title": "Kids Birthday Party Extravaganza",
      "description":
      "Colorful themed decorations with games, entertainment, and birthday cake arrangement.",
      "location": "Mohakhali, gulsan 01",
    },
    {
      "image": ImageUtils.wishlistImage,
      "title": "Kids Birthday Party Extravaganza",
      "description":
      "Colorful themed decorations with games, entertainment, and birthday cake arrangement.",
      "location": "Mohakhali, gulsan 01",
    },
    {
      "image": ImageUtils.wishlistImage,
      "title": "Kids Birthday Party Extravaganza",
      "description":
      "Colorful themed decorations with games, entertainment, and birthday cake arrangement.",
      "location": "Mohakhali, gulsan 01",
    },
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getPlannerAllServiceController(context: context);
    });
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


}