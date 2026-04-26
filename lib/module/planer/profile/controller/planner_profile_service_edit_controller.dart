import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_delta_from_html/flutter_quill_delta_from_html.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

class PlannerProfileServiceEditController extends GetxController {

  late QuillController serviceQuillController;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> eventDetailsController = TextEditingController().obs;
  Rx<TextEditingController> priceController = TextEditingController().obs;
  Rx<PlannerGetServiceDetailsResponseModel> plannerGetServiceDetailsResponseModel = PlannerGetServiceDetailsResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<CategoryResponseModel> categoryResponseModel = CategoryResponseModel().obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  BuildContext context;
  String serviceId;

  PlannerProfileServiceEditController({
    required this.context,
    required this.serviceId,
  });


  RxList<File> selectedFile = <File>[].obs;
  RxList<dio.MultipartFile> filesList = <dio.MultipartFile>[].obs;

  RxInt index = 0.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;

  void changeIndex(int changeValue) {
    index.value = changeValue;
  }

  Rx<File> uploadFile = File("").obs;
  RxDouble submitLong = 0.0.obs;
  RxDouble submitLat = 0.0.obs;
  Rx<CategoryResponseData> selectCategory = CategoryResponseData().obs;



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
      await plannerGetCategoryController(
        context: context,
        onComplete: () async {
          await getPlannerDetailsServiceController(context: context, serviceId: serviceId);
        },
      );
    });
  }

  Future<void> plannerGetCategoryController({
    required BuildContext context,
    required Function onComplete,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.categoryResponse,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        categoryResponseModel.value = CategoryResponseModel.fromJson(data);
        onComplete();
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



  Future<void> getPlannerDetailsServiceController({
    required BuildContext context,
    required String serviceId,
  }) async {
    BaseApiUtils.get(
      url: "${ApiUtils.serviceDetails}/${serviceId}",
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        plannerGetServiceDetailsResponseModel.value = PlannerGetServiceDetailsResponseModel.fromJson(data);
        titleController.value.text = plannerGetServiceDetailsResponseModel.value.data?.title ?? "";
        eventDetailsController.value.text = plannerGetServiceDetailsResponseModel.value.data?.subtitle ?? "";
        priceController.value.text = plannerGetServiceDetailsResponseModel.value.data?.price.toString() ?? "";
        selectServicePaymentModel.value = servicePaymentList.where((payment)=> payment.value == plannerGetServiceDetailsResponseModel.value.data?.priceType).first;
        selectCategory.value = categoryResponseModel.value.data!.where((category)=> category.title == plannerGetServiceDetailsResponseModel.value.data?.category?.title).first;
        final delta = HtmlToDelta().convert(plannerGetServiceDetailsResponseModel.value.data?.description);
        serviceQuillController = QuillController(
          document: Document.fromDelta(delta),
          selection: const TextSelection.collapsed(offset: 0),
        );
        plannerGetServiceDetailsResponseModel.value.data?.serviceAreas?.forEach((value) {
          selectServiceArea.add(
              {
                "name": value.name,
              }
          );
        });
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


  Future<void> editPlannerServiceController({
    required BuildContext context,
    required String serviceId,
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

    await BaseApiUtils.put(
      url: "${ApiUtils.editService}/${serviceId}",
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