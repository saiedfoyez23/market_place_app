import 'dart:convert';
import 'dart:io';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';

class VendorProfilePortfolioController extends GetxController {

  RxList<File> selectedFile = <File>[].obs;
  RxBool isSubmit = false.obs;
  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  RxList<dio.MultipartFile> filesList = <dio.MultipartFile>[].obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  Rx<VendorUserWisePortfolioModel> vendorUserWisePortfolioModel = VendorUserWisePortfolioModel().obs;
  BuildContext context;
  VendorProfilePortfolioController({required this.context});

  Future<void> pickFile({required BuildContext context}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'svg', 'tiff', 'bmp', 'heic'],
      withData: false,
      allowMultiple: true,
    );

    if (result != null) {
      result.files.forEach((value) {
        selectedFile.add(File(value.path!));
      });
      selectedFile.refresh();
      print(selectedFile.length);
      isSubmit.value = true;
      Future.delayed(Duration(seconds: 1),() async {
        await createVendorPortfolioController(context: context);
      });
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getVendorAllPortfolioController(context: context);
    });
  }


  Future<void> getVendorAllPortfolioController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userWisePortfolio,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        vendorUserWisePortfolioModel.value = VendorUserWisePortfolioModel.fromJson(data);
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


  Future<void> deleteVendorPortfolioController({
    required BuildContext context,
    required String id,
  }) async {
    isDelete.value = true;
    BaseApiUtils.delete(
      url: "${ApiUtils.deletePortfolio}${id}",
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isDelete.value = false;
        Get.back();
        isLoading.value = true;
        await getVendorAllPortfolioController(context: context);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value = false;
      },
    );
  }

  Future<void> createVendorPortfolioController({
    required BuildContext context,
  }) async {
    // Clear old files
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

    // Create FormData exactly like Postman
    final formData = dio.FormData.fromMap({
      "files": filesList, // multiple files under same key
    });


    await BaseApiUtils.post(
      url: ApiUtils.createPortfolio,
      formData: formData,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isSubmit.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        Get.delete<VendorProfilePortfolioController>(force: true);
        Get.off(()=>VendorProfilePortfolioView(),preventDuplicates: false);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        selectedFile.clear();
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        selectedFile.clear();
      },
    );
  }





  RxList<String> imageString = <String>[
    ImageUtils.portfolioImage1,
    ImageUtils.portfolioImage2,
    ImageUtils.portfolioImage3,
    ImageUtils.portfolioImage4,
    ImageUtils.portfolioImage5,
    ImageUtils.portfolioImage1,
    ImageUtils.portfolioImage2,
    ImageUtils.portfolioImage3,
    ImageUtils.portfolioImage4,
    ImageUtils.portfolioImage5,
    ImageUtils.portfolioImage1,
    ImageUtils.portfolioImage5,
  ].obs;


}