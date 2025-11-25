import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserCreateAccountController extends GetxController {


  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool isConfirmObscure = true.obs;
  RxBool isCheck = false.obs;


  Rx<File> profileImageFile = File("").obs;
  Rx<File> coverImageFile = File("").obs;

  Future<void> pickProfileImage({required ImageSource source,required BuildContext context}) async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      Navigator.pop(context); // close dialog after selection
      profileImageFile.value = File(pickedFile.path);
    }
  }


  Future<void> pickCoverImage({required ImageSource source,required BuildContext context}) async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      coverImageFile.value = File(pickedFile.path);
    }
  }


}