import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorLoginController extends GetxController {

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  RxBool isCheck = false.obs;

  RxBool isSubmit = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await vendorGetRememberMe();
    });
  }

  Future<void> vendorRememberMe() async {
    Map<String,dynamic> data = {
      "email" : emailController.value.text,
      "password" : passwordController.value.text,
    };
    await LocalStorageUtils.setString(AppConstantUtils.vendorRememberMeData, jsonEncode(data));
  }

  Future<void> vendorGetRememberMe() async {
    if(LocalStorageUtils.getString(AppConstantUtils.vendorRememberMeData) != null) {
      isCheck.value = true;
      emailController.value.text = jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorRememberMeData)!)["email"];
      passwordController.value.text = jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorRememberMeData)!)["password"];
    }
  }

  Future<void> vendorRemoveRememberMe() async {
    isCheck.value = false;
    emailController.value.clear();
    passwordController.value.clear();
    await LocalStorageUtils.remove(AppConstantUtils.vendorRememberMeData);
  }


  Future<void> vendorUserLoginController({
    required BuildContext context,
    required String password,
    required String email,
  }) async {

    isSubmit.value = true;

    Map<String,dynamic> data = {
      "email": email,
      "password": password,
    };

    print(data);

    BaseApiUtils.post(
      url: ApiUtils.userLogin,
      data: data,
      onSuccess: (e,data) async {
        await LocalStorageUtils.setString(AppConstantUtils.vendorLoginResponse, jsonEncode(data));
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        if(data['data']['user']['isKYCSubmit'] == false) {
          Get.off(()=>VendorCreateAccountSetUpProfileView(),preventDuplicates: false);
        } else {
          Get.off(()=>DashboardVendorView(index: 0,),preventDuplicates: false);
        }
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