import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorProfileChangePasswordController extends GetxController {

  Rx<TextEditingController> oldPasswordController = TextEditingController().obs;
  RxBool isOldObscure = true.obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool isConfirmObscure = true.obs;


  RxBool isSubmit = false.obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;


  Future<void> vendorChangePasswordController({
    required BuildContext context,
  }) async {
    print(userLoginResponseModel.value.data?.accessToken);

    isSubmit.value = true;

    Map<String,dynamic> data = {
      "oldPassword": oldPasswordController.value.text,
      "newPassword": passwordController.value.text,
    };

    print(data);

    BaseApiUtils.post(
      url: ApiUtils.userChangePassword,
      authorization: userLoginResponseModel.value.data?.accessToken,
      data: data,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        await LocalStorageUtils.remove(AppConstantUtils.vendorLoginResponse);
        Get.offAll(()=>VendorLoginView());
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