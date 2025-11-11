import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordOtpController extends GetxController {

  RxInt timeCounter = 120.obs;
  RxString otp = "".obs;
  RxBool isResendOtpSend = false.obs;
  Rx<TextEditingController> pinController = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await otpTimer();
    });
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


  Future<void> resetVariable() async {
    timeCounter.value = 120;
    pinController.value.clear();
    await otpTimer();
    isResendOtpSend.value = false;
  }





}