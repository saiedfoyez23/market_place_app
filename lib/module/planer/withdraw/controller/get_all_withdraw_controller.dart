import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class GetAllWithdrawController extends GetxController {


  RxBool isLoading = false.obs;
  BuildContext context;
  GetAllWithdrawController({required this.context});
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<GetAllWithdrawResponseModel> getAllWithdrawResponseModel = GetAllWithdrawResponseModel().obs;
  RxBool isCreate = false.obs;
  RxString serviceId = "".obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllWithdrawController(context: context);
    });
  }


  Future<void> getAllWithdrawController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getWithdraw,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllWithdrawResponseModel.value = GetAllWithdrawResponseModel.fromJson(data);
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