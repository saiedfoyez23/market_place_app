import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class VendorCreateAccountController extends GetxController {

  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool isConfirmObscure = true.obs;
  RxBool isCheck = false.obs;
  RxBool isLoading = false.obs;


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


  Future<void> createVendorAccountController({
    required BuildContext context,
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required File imageFile,
    required File coverImageFile,
  }) async {
    isLoading.value = true;

    final Map<String, dynamic> jsonData = {
      "name": userName,
      "email": email,
      "role": "vendor",
      "password": password,
      "confirmPassword": confirmPassword
    };
    print(jsonData);
    print(imageFile.path);
    print(coverImageFile.path);

    dio.FormData formData = dio.FormData.fromMap({
      if(imageFile.path != "")
        "image": await dio.MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
          contentType: dio.DioMediaType(
            MimeTypeUtils.getMimeType(imageFile.path).split('/').first,
            MimeTypeUtils.getMimeType(imageFile.path).split('/').last,
          ),
        ),
      if(coverImageFile.path != "")
        "coverPhoto": await dio.MultipartFile.fromFile(
          coverImageFile.path,
          filename: coverImageFile.path.split('/').last,
          contentType: dio.DioMediaType(
            MimeTypeUtils.getMimeType(coverImageFile.path).split('/').first,
            MimeTypeUtils.getMimeType(coverImageFile.path).split('/').last,
          ),
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
        Get.delete<VendorCreateAccountController>();
        Get.off(()=>VendorCreateAccountOtpView(),preventDuplicates: false);
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