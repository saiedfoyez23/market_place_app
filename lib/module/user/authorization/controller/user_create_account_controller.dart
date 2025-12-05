import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class UserCreateAccountController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool isConfirmObscure = true.obs;
  RxBool isCheck = false.obs;


  Rx<File> profileImageFile = File("").obs;

  Future<void> pickProfileImage({required ImageSource source,required BuildContext context}) async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      Get.back(); // close dialog after selection
      profileImageFile.value = File(pickedFile.path);
    }
  }


  Future<void> createUserAccountController({
    required BuildContext context,
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required File imageFile,
  }) async {
    isLoading.value = true;

    final Map<String, dynamic> jsonData = {
      "name": userName,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword
    };
    print(jsonData);
    print(imageFile.path);

    if(imageFile.path != "") {

      String mimeTypeImage = MimeTypeUtils.getMimeType(imageFile.path);
      dio.FormData formData = dio.FormData.fromMap({
        "image": await dio.MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
          contentType: dio.DioMediaType(mimeTypeImage.split('/').first,mimeTypeImage.split('/').last),
        ),
        "data": jsonEncode(jsonData),  // important → JSON encoded string!
      });

      await BaseApiUtils.post(
        url: ApiUtils.userRegistration,
        formData: formData,
        onSuccess: (e,data) async {
          await LocalStorageUtils.setString(AppConstantUtils.crateUserResponse, jsonEncode(data));
          isLoading.value = false;
          MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
          Get.delete<UserCreateAccountController>();
          Get.off(()=>UserCreateAccountOtpView(),preventDuplicates: false);
        },
        onFail: (e,data) {
          MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
          isLoading.value = false;
        },
        onExceptionFail: (e,data) {
          MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
          isLoading.value = false;
        },
      );

    } else {

      print("hello");

      dio.FormData formData = dio.FormData.fromMap({
        "data": jsonEncode(jsonData),  // important → JSON encoded string!
      });
      await BaseApiUtils.post(
        url: ApiUtils.userRegistration,
        formData: formData,
        onSuccess: (e,data) async {
          await LocalStorageUtils.setString(AppConstantUtils.crateUserResponse, jsonEncode(data));
          isLoading.value = false;
          MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
          Get.delete<UserCreateAccountController>();
          Get.off(()=>UserCreateAccountOtpView(),preventDuplicates: false);
        },
        onFail: (e,data) {
          MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
          isLoading.value = false;
        },
        onExceptionFail: (e,data) {
          MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
          isLoading.value = false;
        },
      );
    }

  }

}