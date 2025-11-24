import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PlannerCreateAccountController extends GetxController {

  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool isConfirmObscure = true.obs;
  RxBool isCheck = false.obs;



  Rx<TextEditingController> businessNameController = TextEditingController().obs;
  Rx<TextEditingController> aboutYouController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> addInstagramController = TextEditingController().obs;
  Rx<TextEditingController> addLinkedInController = TextEditingController().obs;
  Rx<TextEditingController> addWebsiteController = TextEditingController().obs;
  RxString selectCategory = "".obs;

  RxList<String> categoryList = <String>[
    "All",
    "Furniture",
    "Clothing",
    "Electronics",
    "Food",
    "Cycling",
    "Others",
  ].obs;

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
  Rx<DateTime> dateOfBirth = DateTime.now().obs;


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