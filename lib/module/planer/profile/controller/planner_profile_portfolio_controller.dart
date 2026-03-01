import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart'as dio;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:marketplaceapp/module/module.dart';


class PlannerProfilePortfolioController extends GetxController {

  RxList<File> selectedFile = <File>[].obs;
  RxList<dio.MultipartFile> filesList = <dio.MultipartFile>[].obs;
  RxBool isSubmit = false.obs;
  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  RxString portfolioId = "".obs;
  Rx<PlannerUserWisePortfolioModel> plannerUserWisePortfolioModel = PlannerUserWisePortfolioModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  BuildContext context;
  PlannerProfilePortfolioController({required this.context});

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
        await createPlannerPortfolioController(context: context);
      });
    }
  }
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getPlannerAllPortfolioController(context: context);
    });
  }


  Future<void> getPlannerAllPortfolioController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userWisePortfolio,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        plannerUserWisePortfolioModel.value = PlannerUserWisePortfolioModel.fromJson(data);
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

  Future<void> deletePlannerPortfolioController({
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
        await getPlannerAllPortfolioController(context: context);
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

  Future<void> createPlannerPortfolioController({
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
        Get.delete<PlannerProfilePortfolioController>(force: true);
        Get.off(()=>PlannerProfilePortfolioView(),preventDuplicates: false);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        selectedFile.clear();
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value= false;
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