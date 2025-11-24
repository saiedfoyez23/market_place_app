import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorLoginController extends GetxController {

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  RxBool isCheck = false.obs;

}