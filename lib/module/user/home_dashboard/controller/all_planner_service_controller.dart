import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class AllPlannerServiceController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;
  Rx<GetAllPlannerServiceResponseModel> getAllPlannerServiceResponseModel = GetAllPlannerServiceResponseModel().obs;
  BuildContext context;
  AllPlannerServiceController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllPlannerServiceController(context: context);
    });
  }


  Future<void> getAllPlannerServiceController({required BuildContext context}) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllPlannerServiceResponse,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllPlannerServiceResponseModel.value = GetAllPlannerServiceResponseModel.fromJson(data);
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