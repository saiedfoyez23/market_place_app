import 'dart:convert';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorCreateNewPasswordController extends GetxController {

  RxBool isSubmit = false.obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool isConfirmObscure = true.obs;

  Rx<UserForgotPasswordResponseModel> userForgotPasswordResponseModel = UserForgotPasswordResponseModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await vendorForgotPasswordResponseController();
    });
  }


  Future<void> vendorForgotPasswordResponseController() async {
    print(LocalStorageUtils.getString(AppConstantUtils.forgotPasswordUserResponse)!);
    userForgotPasswordResponseModel.value = UserForgotPasswordResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.forgotPasswordUserResponse)!));
    print(userForgotPasswordResponseModel.value.data?.verifyToken);
  }

  Future<void> vendorCreateNewPasswordController({
    required BuildContext context,
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {

    isSubmit.value = true;

    Map<String,dynamic> data = {
      "email": email,
      "newPassword": newPassword,
      "confirmPassword": confirmPassword,
    };

    print(data);

    BaseApiUtils.post(
      url: ApiUtils.userResetPassword,
      authorization: userForgotPasswordResponseModel.value.data?.verifyToken,
      data: data,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        Get.off(()=>VendorCreateNewPasswordSuccessView(),preventDuplicates: false);
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