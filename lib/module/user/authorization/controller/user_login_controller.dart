import 'dart:convert';
import 'package:marketplaceapp/module/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserLoginController extends GetxController {

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
      await getRememberMe();
    });
  }

  Future<void> rememberMe() async {
    Map<String,dynamic> data = {
      "email" : emailController.value.text,
      "password" : passwordController.value.text,
    };
    await LocalStorageUtils.setString(AppConstantUtils.rememberMeData, jsonEncode(data));
  }

  Future<void> getRememberMe() async {
    if(LocalStorageUtils.getString(AppConstantUtils.rememberMeData) != null) {
      isCheck.value = true;
      emailController.value.text = jsonDecode(LocalStorageUtils.getString(AppConstantUtils.rememberMeData)!)["email"];
      passwordController.value.text = jsonDecode(LocalStorageUtils.getString(AppConstantUtils.rememberMeData)!)["password"];
    }
  }

  Future<void> removeRememberMe() async {
    isCheck.value = false;
    emailController.value.clear();
    passwordController.value.clear();
    await LocalStorageUtils.remove(AppConstantUtils.rememberMeData);
  }


  Future<void> userLoginController({
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
        await LocalStorageUtils.setString(AppConstantUtils.userLoginResponse, jsonEncode(data));
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        Get.off(()=>DashboardUserView(index: 0,),preventDuplicates: false);
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