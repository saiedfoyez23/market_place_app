import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class PlannerLoginController extends GetxController {


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
      await plannerGetRememberMe();
    });
  }

  Future<void> plannerRememberMe() async {
    Map<String,dynamic> data = {
      "email" : emailController.value.text,
      "password" : passwordController.value.text,
    };
    await LocalStorageUtils.setString(AppConstantUtils.plannerRememberMeData, jsonEncode(data));
  }

  Future<void> plannerGetRememberMe() async {
    if(LocalStorageUtils.getString(AppConstantUtils.plannerRememberMeData) != null) {
      isCheck.value = true;
      emailController.value.text = jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerRememberMeData)!)["email"];
      passwordController.value.text = jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerRememberMeData)!)["password"];
    }
  }

  Future<void> plannerRemoveRememberMe() async {
    isCheck.value = false;
    emailController.value.clear();
    passwordController.value.clear();
    await LocalStorageUtils.remove(AppConstantUtils.plannerRememberMeData);
  }


  Future<void> plannerUserLoginController({
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
        await LocalStorageUtils.setString(AppConstantUtils.plannerLoginResponse, jsonEncode(data));
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        if(data['data']['user']['isKYCSubmit'] == false) {
          Get.off(()=>PlannerCreateAccountSetUpProfileView(),preventDuplicates: false);
        } else {
          Get.off(()=>DashboardPlannerView(index: 0,),preventDuplicates: false);
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