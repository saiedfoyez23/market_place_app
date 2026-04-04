import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class VendorChatController extends GetxController {

  Rx<TextEditingController> chatController = TextEditingController().obs;
  Rx<VendorMyProfileDetailsResponseModel> vendorMyProfileDetailsResponseModel = VendorMyProfileDetailsResponseModel().obs;
  final VendorSocketServiceController vendorSocketServiceController = Get.put(VendorSocketServiceController());
  Rx<GetChatDetailsResponseModel> getChatDetailsResponseModel = GetChatDetailsResponseModel().obs;
  Rx<GetAllMessageResponseModel> getAllMessageResponseModel = GetAllMessageResponseModel().obs;
  Rx<GetAllMessageFileResponseModel> getAllMessageFileResponseModel = GetAllMessageFileResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  RxBool isLoading = false.obs;
  String chatId;
  RxBool isTyping = false.obs;
  Rx<ScrollController> scrollController = ScrollController().obs;
  RxList<File> selectedFile = <File>[].obs;
  RxList<dio.MultipartFile> filesList = <dio.MultipartFile>[].obs;
  RxBool isSubmit = false.obs;
  RxList<String> selectFile = <String>[].obs;
  BuildContext context;

  VendorChatController({required this.chatId,required this.context});



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading = true.obs;
    Future.delayed(Duration(microseconds: 100),() async {
      await vendorSocketServiceController.init();
      vendorSocketServiceController.socket!.on('new-message', (data) async {
        print("user data : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      vendorSocketServiceController.socket!.on('onlineUser', (data) async {
        print("user data : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      vendorSocketServiceController.socket!.on('typing', (data) async {
        print("user data : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      vendorSocketServiceController.socket!.on('stopTyping', (data) async {
        print("user data : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      await getPlannerProfileDetailsController(context: context);
      await getChatDetailsController(
        context: context,
        chatId: chatId,
        onComplete: (chatId) async {
          await getAllMessageController(chatId: chatId,context: context);
        },
      );
    });
  }

  Future<void> scrollToBottom() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.value.hasClients) {
        scrollController.value.animateTo(
          scrollController.value.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> getChatDetailsController({
    required BuildContext context,
    required String chatId,
    required Function onComplete,
  }) async {

    BaseApiUtils.get(
      url: ApiUtils.getChatDetails(chatId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        getChatDetailsResponseModel.value = GetChatDetailsResponseModel.fromJson(data);
        onComplete(getChatDetailsResponseModel.value.data?.sId);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }

  Future<void> getPlannerProfileDetailsController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userProfileDetails,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        vendorMyProfileDetailsResponseModel.value = VendorMyProfileDetailsResponseModel.fromJson(data);
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


  Future<void> getAllMessageController({
    required BuildContext context,
    required String chatId
  }) async {

    BaseApiUtils.get(
      url: ApiUtils.getAllMessage(chatId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllMessageResponseModel.value = GetAllMessageResponseModel.fromJson(data);
        await scrollToBottom();
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }


  Future<void> pickImage({
    required BuildContext context,
    required Function onComplete,
  }) async {
    selectedFile.clear();
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
        await createImageController(
          context: context,
          onComplete: onComplete,
        );
      });
    }
  }



  Future<void> pickFile({
    required BuildContext context,
    required Function onComplete,
  }) async {
    selectedFile.clear();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'csv', 'rtf',
      ],
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
        await createImageController(
          context: context,
          onComplete: onComplete,
        );
      });
    }
  }

  Future<void> createImageController({
    required BuildContext context,
    required Function onComplete,
  }) async {
    // Clear old files
    filesList.clear();
    selectFile.clear();

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
      url: ApiUtils.uploadFile,
      formData: formData,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isSubmit.value = false;
        getAllMessageFileResponseModel.value = GetAllMessageFileResponseModel.fromJson(data);
        getAllMessageFileResponseModel.value.data?.forEach((value) {
          selectFile.add(value.url);
        });
        onComplete();
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




}
