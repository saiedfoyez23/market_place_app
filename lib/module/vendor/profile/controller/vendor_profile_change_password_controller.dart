import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorProfileChangePasswordController extends GetxController {

  Rx<TextEditingController> oldPasswordController = TextEditingController().obs;
  RxBool isOldObscure = true.obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool isConfirmObscure = true.obs;

}