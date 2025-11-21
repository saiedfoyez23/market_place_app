import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlannerCreateNewPasswordController extends GetxController {

  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool isConfirmObscure = true.obs;

}