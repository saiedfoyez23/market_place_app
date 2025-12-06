import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class ForgotPasswordOtpController extends GetxController {

  RxInt timeCounter = 120.obs;
  RxString otp = "".obs;
  RxBool isResendOtpSend = false.obs;
  RxBool isSubmit = false.obs;
  Rx<TextEditingController> pinController = TextEditingController().obs;
  Rx<UserForgotPasswordResponseModel> userForgotPasswordResponseModel = UserForgotPasswordResponseModel().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await otpTimer();
      await userForgotPasswordResponseController();
    });
  }

  Future<void> userForgotPasswordResponseController() async {
    print(LocalStorageUtils.getString(AppConstantUtils.crateUserResponse)!);
    userForgotPasswordResponseModel.value = UserForgotPasswordResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.forgotPasswordUserResponse)!));
    print(userForgotPasswordResponseModel.value.data?.verifyToken);
  }



  Future<void> otpTimer() async {
    Future.delayed(Duration(seconds: 1), () async {
      if(timeCounter > 0) {
        timeCounter.value = timeCounter.value - 1;
        otpTimer();
      } else {
        timeCounter.value = 0;
      }
    });
  }


  Future<void> resendOtpCodeController({
    required BuildContext context,
    required String email,
  }) async {

    isResendOtpSend.value = true;

    Map<String,dynamic> data = {
      "email": email,
    };

    print(data);

    BaseApiUtils.post(
      url: ApiUtils.userRegistrationResendOtp,
      data: data,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        await resetVariable();
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isResendOtpSend.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isResendOtpSend.value = false;
      },
    );

  }


  Future<void> verifyOtpCodeController({
    required BuildContext context,
    required String otp,
    required String email,
  }) async {

    isSubmit.value = true;

    Map<String,dynamic> data = {
      "otp": otp,
    };

    print(data);

    BaseApiUtils.post(
      url: ApiUtils.userRegistrationVerifyOtp,
      authorization: userForgotPasswordResponseModel.value.data?.verifyToken,
      data: data,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        Get.off(()=>CreateNewPasswordView(email: email,),preventDuplicates: false);
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


  Future<void> resetVariable() async {
    timeCounter.value = 120;
    pinController.value.clear();
    await otpTimer();
    isResendOtpSend.value = false;
  }





}