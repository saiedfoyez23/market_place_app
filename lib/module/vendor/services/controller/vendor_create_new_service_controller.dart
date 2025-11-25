import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class VendorCreateNewServiceController extends GetxController {

  late QuillController quillController;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> eventDetailsController = TextEditingController().obs;
  Rx<TextEditingController> serviceDetailsController = TextEditingController().obs;
  RxString selectCategory = "".obs;


  Rx<File> uploadFile = File("").obs;


  Future<void> pickUploadFrontSideFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      uploadFile.value = File(result.files.single.path!);
    }
  }



  RxList<String> categoryList = <String>[
    "All",
    "Furniture",
    "Clothing",
    "Electronics",
    "Food",
    "Cycling",
    "Others",
  ].obs;



}