import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class ForgotPasswordController extends GetxController {
  RxBool isSubmit = false.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;


  Future<void> forgotPasswordController({
    required BuildContext context,
    required String email,
  }) async {

    isSubmit.value = true;

    Map<String,dynamic> data = {
      "email": email,
    };

    print(data);

    BaseApiUtils.post(
      url: ApiUtils.userForgetPassword,
      data: data,
      onSuccess: (e,data) async {
        await LocalStorageUtils.setString(AppConstantUtils.forgotPasswordUserResponse, jsonEncode(data));
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        Get.off(()=>ForgotPasswordOtpView(email: emailController.value.text,),preventDuplicates: false);
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