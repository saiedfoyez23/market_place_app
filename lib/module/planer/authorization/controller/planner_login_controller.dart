import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/module/vendor/authorization/controller/jwt_validator_controller.dart';
import '../../../../utils/utils.dart';

class PlannerLoginController extends GetxController {


  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  RxBool isCheck = false.obs;
  RxBool isSubmit = false.obs;
  RxString fmcToken = "".obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await plannerGetRememberMe();
      await initialFirebaseMessaging();
    });
  }

  Future<void> initialFirebaseMessaging() async {
    String? token = await FirebaseMessaging.instance.getToken();
    fmcToken.value = token!;
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
    required String fmcToken,
  }) async {

    isSubmit.value = true;

    Map<String,dynamic> data = {
      "email": email,
      "password": password,
      "fcmToken": fmcToken,
    };
    print(data);
    await LocalStorageUtils.setString(AppConstantUtils.plannerLoginLocalData, jsonEncode(data));
    BaseApiUtils.post(
      url: ApiUtils.userLogin,
      data: data,
      onSuccess: (e,data) async {
        final result = JwtValidatorController.validateToken(
          token: data["data"]["accessToken"],
          allowedRoles: ['planer'],
        );
        if (result['isValid'] == true) {
          await LocalStorageUtils.setString(AppConstantUtils.plannerLoginResponse, jsonEncode(data));
          MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
          isSubmit.value = false;
          if(data['data']['user']['isKYCSubmit'] == false) {
            Get.off(()=>PlannerCreateAccountSetUpProfileView(),preventDuplicates: false);
          } else {
            Get.off(()=>DashboardPlannerView(index: 0,),preventDuplicates: false);
          }
          print("Planner Email: ${result['data']['email']}");
        } else {
          isSubmit.value = false;
          MessageSnackBarWidget.errorSnackBarWidget(context: context, message: result['message']);
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