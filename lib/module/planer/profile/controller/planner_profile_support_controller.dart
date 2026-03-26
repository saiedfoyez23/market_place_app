import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerProfileSupportController extends GetxController {

  Rx<TextEditingController> subjectController = TextEditingController().obs;
  Rx<TextEditingController> messageController = TextEditingController().obs;
  RxBool isSubmit = false.obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;


  Future<void> createSupportController({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    print(userLoginResponseModel.value.data?.accessToken);
    BaseApiUtils.post(
      url: ApiUtils.createSupport,
      authorization: userLoginResponseModel.value.data?.accessToken,
      data: data,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        subjectController.value.clear();
        messageController.value.clear();
        isSubmit.value = false;
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
    );
  }




}