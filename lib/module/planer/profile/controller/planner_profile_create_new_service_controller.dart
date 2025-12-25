import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

class PlannerProfileCreateNewServiceController extends GetxController {

  late QuillController eventQuillController;
  late QuillController serviceQuillController;
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

  /// Stores delta JSON (for API / local DB)
  final RxString eventQuillJson = ''.obs;
  final RxString serviceQuillJson = ''.obs;

  @override
  void onInit() {
    super.onInit();
    eventQuillController = QuillController(
      document: Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );
    serviceQuillController = QuillController(
      document: Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );
  }

  /// Load content from API / DB
  // void loadFromJson(String jsonString) {
  //   final decoded = jsonDecode(jsonString);
  //   quillController = QuillController(
  //     document: Document.fromJson(decoded),
  //     selection: const TextSelection.collapsed(offset: 0),
  //   );
  //   update();
  // }

  /// Save content
  void saveEventContent() {
    final delta = eventQuillController.document.toDelta();
    eventQuillJson.value = jsonEncode(delta.toJson());
  }

  void saveServiceContent() {
    final delta = serviceQuillController.document.toDelta();
    serviceQuillJson.value = jsonEncode(delta);

    final converter = QuillDeltaToHtmlConverter(
      delta.toJson(),
      ConverterOptions.forEmail(),
    );

    serviceQuillJson.value = converter.convert();
  }


  @override
  void onClose() {
    eventQuillController.dispose();
    serviceQuillController.dispose();
    super.onClose();
  }

}