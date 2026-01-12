import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:dio/dio.dart' as dio;

class PlannerProfileCreateNewServiceController extends GetxController {

  late QuillController serviceQuillController;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> eventDetailsController = TextEditingController().obs;
  Rx<TextEditingController> priceController = TextEditingController().obs;
  Rx<TextEditingController> serviceDetailsController = TextEditingController().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<CategoryResponseModel> categoryResponseModel = CategoryResponseModel().obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  BuildContext context;
  double long;
  double lat;
  String address;
  PlannerProfileCreateNewServiceController({required this.context,required this.long,required this.lat,required this.address});
  Rx<File> uploadFile = File("").obs;
  Rx<CategoryResponseData> selectCategory = CategoryResponseData().obs;
  RxDouble submitLong = 0.0.obs;
  RxDouble submitLat = 0.0.obs;


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

  /// Stores delta JSON (for API / local DB)
  final RxString serviceQuillJson = ''.obs;

  Rx<PlannerServiceDropdownModel> selectServicePaymentModel = PlannerServiceDropdownModel().obs;

  RxList<PlannerServiceDropdownModel> servicePaymentList = <PlannerServiceDropdownModel>[
    PlannerServiceDropdownModel(key: "Fixed", value: "fixed"),
    PlannerServiceDropdownModel(key: "Per Person", value: "per_person"),
    PlannerServiceDropdownModel(key: "Hourly", value: "hourly"),
    PlannerServiceDropdownModel(key: "Per Day", value: "per_day"),
    PlannerServiceDropdownModel(key: "Per Event", value: "per_event"),
    PlannerServiceDropdownModel(key: "Per Unit", value: "per_unit"),
    PlannerServiceDropdownModel(key: "Package", value: "package"),
    PlannerServiceDropdownModel(key: "Custom", value: "custom"),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    addressController.value.text = address;
    submitLong.value = long;
    submitLat.value = lat;
    serviceQuillController = QuillController(
      document: Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );
    Future.delayed(Duration(seconds: 1),() async {
      await plannerGetCategoryController(context: context);
    });
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

  void saveServiceContent() {
    final delta = serviceQuillController.document.toDelta();
    serviceQuillJson.value = jsonEncode(delta);

    final converter = QuillDeltaToHtmlConverter(
      delta.toJson(),
      ConverterOptions.forEmail(),
    );

    serviceQuillJson.value = converter.convert();
  }


  Future<void> plannerGetCategoryController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.categoryResponse,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        categoryResponseModel.value = CategoryResponseModel.fromJson(data);
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


  Future<void> createPlannerServiceController({
    required BuildContext context,
  }) async {
    isSubmit.value = true;

    Map<String,dynamic> data = {
      "category": selectCategory.value.sId,
      "title": titleController.value.text,
      "subtitle": eventDetailsController.value.text,
      "description": "${serviceQuillJson.value}",
      "longitude": submitLong.value,
      "latitude": submitLat.value,
      "address": addressController.value.text,
      "price": double.parse(priceController.value.text),
      "priceType": selectServicePaymentModel.value.value
    };
    print(jsonEncode(data));

    dio.FormData formData = dio.FormData.fromMap({
      "files": await dio.MultipartFile.fromFile(
        uploadFile.value.path,
        filename: uploadFile.value.path.split('/').last,
        contentType: dio.DioMediaType(
          MimeTypeUtils.getMimeType(uploadFile.value.path).split('/').first,
          MimeTypeUtils.getMimeType(uploadFile.value.path).split('/').last,
        ),
      ),
      "data": jsonEncode(data),  // important → JSON encoded string!
    });

    await BaseApiUtils.post(
      url: ApiUtils.createService,
      formData: formData,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isSubmit.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        Get.off(()=>PlannerProfileServiceView(),preventDuplicates: false);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
      onExceptionFail: (e,data) {
        print(e);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
    );
  }


  @override
  void onClose() {
    print("call");
    serviceQuillController.dispose();
    super.onClose();
  }

}


class PlannerServiceDropdownModel {
  String? key;
  String? value;

  PlannerServiceDropdownModel({this.key,this.value});

}


