import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class VendorForgotPasswordController extends GetxController {

  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxBool isSubmit = false.obs;


  Future<void> vendorForgotPasswordController({
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
        Get.off(()=>VendorForgotPasswordOtpView(email: emailController.value.text,),preventDuplicates: false);
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