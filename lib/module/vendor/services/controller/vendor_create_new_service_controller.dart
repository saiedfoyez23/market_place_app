import 'dart:convert';
import 'dart:io';
import 'package:marketplaceapp/module/module.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';

class VendorCreateNewServiceController extends GetxController {

  late QuillController quillController;
  RxBool isLoading = false.obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> eventDetailsController = TextEditingController().obs;
  Rx<TextEditingController> serviceDetailsController = TextEditingController().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  RxList<CategoryResponseData> selectCategory = <CategoryResponseData>[].obs;
  RxList<String> selectCategoryString = <String>[].obs;
  Rx<CategoryResponseModel> categoryResponseModel = CategoryResponseModel().obs;
  BuildContext context;
  double long;
  double lat;
  String address;

  VendorCreateNewServiceController({
    required this.context,
    required this.long,
    required this.lat,
    required this.address
  });

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      print(long);
      print(lat);
      print(address);
      await vendorGetCategoryController(context: context);
    });
  }


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

  Future<void> vendorGetCategoryController({
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




}