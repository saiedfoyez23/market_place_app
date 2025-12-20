import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class PlannerCreateAccountKycVerificationController extends GetxController {

  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> bankNameController = TextEditingController().obs;
  Rx<TextEditingController> accountNumberController = TextEditingController().obs;
  Rx<TextEditingController> tinNidNumberController = TextEditingController().obs;
  Rx<TextEditingController> permanentAddressController = TextEditingController().obs;
  Rx<TextEditingController> currentAddressController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> postalCodeController = TextEditingController().obs;
  Rx<TextEditingController> nidNumberController = TextEditingController().obs;
  RxString selectIdType = "".obs;
  RxString selectGender = "".obs;
  RxBool isSubmit = false.obs;
  Rx<DateTime> dateOfBirth = DateTime.now().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;



  Future<void> dateTimeController({required BuildContext context}) async {
    // Pick Date
    final DateTime? pick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pick != null) {
      dateOfBirth.value = pick;
      dateController.value.text = DateFormat("dd-MM-yyyy").format(dateOfBirth.value.toLocal());
    } // user canceled
  }


  Rx<File> selectedUploadFrontSideFile = File("").obs;
  Rx<File> selectedUploadBackSideFile = File("").obs;


  Future<void> pickUploadFrontSideFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      selectedUploadFrontSideFile.value = File(result.files.single.path!);
    }
  }


  Future<void> pickUploadBackSideFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      selectedUploadBackSideFile.value = File(result.files.single.path!);
    }
  }


  Future<void> userKycVerificationController({
    required BuildContext context,
  }) async {
    isSubmit.value = true;

    final Map<String, dynamic> jsonData = {
      "personalInfo": {
        "name": fullNameController.value.text,
        "dob": dateController.value.text,
        "gender": selectGender.value,
      },
      "address": {
        "currentAddress": currentAddressController.value.text,
        "permanentAddress": permanentAddressController.value.text,
        "city": cityController.value.text,
        "postalCode": postalCodeController.value.text,
      },
      "identityVerification": {
        "idType": selectIdType.value,
        "number": nidNumberController.value.text,
      },
      "bankInfo": {
        "bankName": bankNameController.value.text,
        "accountNumber": accountNumberController.value.text,
        "tinOrNID": tinNidNumberController.value.text,
      }
    };

    print(jsonData);
    print(selectedUploadFrontSideFile.value.path);
    print(selectedUploadBackSideFile.value.path);

    // Prepare list of files for the "files" key
    List<dio.MultipartFile> filesList = [];
    if (selectedUploadFrontSideFile.value.path != "") {
      filesList.add(await dio.MultipartFile.fromFile(
        selectedUploadFrontSideFile.value.path,
        filename: selectedUploadFrontSideFile.value.path.split('/').last,
        contentType: dio.DioMediaType(
          MimeTypeUtils.getMimeType(selectedUploadFrontSideFile.value.path).split('/').first,
          MimeTypeUtils.getMimeType(selectedUploadFrontSideFile.value.path).split('/').last,
        ),
      ));
    }
    if (selectedUploadBackSideFile.value.path != "") {
      filesList.add(await dio.MultipartFile.fromFile(
        selectedUploadBackSideFile.value.path,
        filename: selectedUploadBackSideFile.value.path.split('/').last,
        contentType: dio.DioMediaType(
          MimeTypeUtils.getMimeType(selectedUploadBackSideFile.value.path).split('/').first,
          MimeTypeUtils.getMimeType(selectedUploadBackSideFile.value.path).split('/').last,
        ),
      ));
    }

    dio.FormData formData = dio.FormData.fromMap({
      if (filesList.isNotEmpty) "files": filesList, // Send as list under "files" key to match UI structure
      "data": jsonEncode(jsonData), // JSON encoded string under "data" key
    });


    await BaseApiUtils.post(
      url: ApiUtils.userKycVerification,
      formData: formData,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isSubmit.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        await LocalStorageUtils.remove(AppConstantUtils.plannerLoginResponse);
        Get.offAll(()=>PlannerLoginView());
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