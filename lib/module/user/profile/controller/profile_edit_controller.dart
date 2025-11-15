import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditController extends GetxController {

  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> bioController = TextEditingController().obs;



}