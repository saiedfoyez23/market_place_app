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
  Rx<TextEditingController> eventDetailsController = TextEditingController().obs;
  Rx<TextEditingController> priceController = TextEditingController().obs;
  Rx<FocusNode> quillFocusNode = FocusNode().obs;
  Rx<TextEditingController> serviceDetailsController = TextEditingController().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<CategoryResponseModel> categoryResponseModel = CategoryResponseModel().obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  BuildContext context;
  PlannerProfileCreateNewServiceController({required this.context});
  Rx<CategoryResponseData> selectCategory = CategoryResponseData().obs;
  RxDouble submitLong = 0.0.obs;
  RxDouble submitLat = 0.0.obs;


  RxList<File> selectedFile = <File>[].obs;
  RxList<dio.MultipartFile> filesList = <dio.MultipartFile>[].obs;

  RxInt index = 0.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;

  void changeIndex(int changeValue) {
    index.value = changeValue;
  }


  Future<void> pickUploadFrontSideFile({required BuildContext context}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      withData: false,
      allowMultiple: true,
    );

    if (result != null) {
      result.files.forEach((value) {
        selectedFile.add(File(value.path!));
      });
    }
  }

  /// Stores delta JSON (for API / local DB)
  final RxString serviceQuillJson = ''.obs;

  Rx<PlannerServiceDropdownModel> selectServicePaymentModel = PlannerServiceDropdownModel().obs;

  RxList<String> serviceArea = <String>[
    "Gauteng",
    "Western Cape",
    "KwaZulu-Natal",
    "Eastern Cape",
    "Mpumalanga",
    "Limpopo",
    "North West",
    "Free State",
    "Northern Cape",
  ].obs;

  RxList<Map<String,dynamic>> selectServiceArea = <Map<String,dynamic>>[].obs;

  RxList<PlannerServiceDropdownModel> servicePaymentList = <PlannerServiceDropdownModel>[
    PlannerServiceDropdownModel(key: "Fixed", value: "fixed"),
    PlannerServiceDropdownModel(key: "Starting From", value: "starting_from"),
    PlannerServiceDropdownModel(key: "Request Quote", value: "request_quote"),
  ].obs;


  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    serviceQuillController = QuillController(
      document: Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );
    Future.delayed(Duration(seconds: 1),() async {
      await plannerGetCategoryController(context: context);
    });
  }

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

    filesList.clear();

    // Convert selected files to MultipartFile list
    for (final file in selectedFile) {
      final mimeType = MimeTypeUtils.getMimeType(file.path);

      filesList.add(
        await dio.MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: dio.DioMediaType(
            mimeType.split('/')[0],
            mimeType.split('/')[1],
          ),
        ),
      );
    }


    Map<String,dynamic> data = {
      "category": selectCategory.value.sId,
      "title": titleController.value.text,
      "subtitle": eventDetailsController.value.text,
      "description": "${serviceQuillJson.value}",
      "serviceAreas": selectServiceArea,
      "price": double.parse(priceController.value.text),
      "priceType": selectServicePaymentModel.value.value
    };

    print(jsonEncode(data));

    dio.FormData formData = dio.FormData.fromMap({
      "files": filesList,
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


