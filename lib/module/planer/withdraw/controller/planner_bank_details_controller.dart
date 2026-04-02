import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerBankDetailsController extends GetxController {
  RxBool isDelete = false.obs;
  RxBool isLoading = false.obs;
  BuildContext context;
  PlannerBankDetailsController({required this.context});
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<GetAllPaystackResponseModel> getAllPaystackResponseModel = GetAllPaystackResponseModel().obs;
  RxBool isCreate = false.obs;
  RxString selectType = "All".obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllPlannerBankController(context: context);
    });
  }


  Future<void> getAllPlannerBankController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllPaystack,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllPaystackResponseModel.value = GetAllPaystackResponseModel.fromJson(data);
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


  Future<void> deletePlannerBankInformationController({
    required BuildContext context,
    required String bankInformationId
  }) async {
    BaseApiUtils.delete(
      url: ApiUtils.deletePaystack(bankInformationId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isDelete.value = false;
        isLoading.value = true;
        Get.back();
        await getAllPlannerBankController(context: context);
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