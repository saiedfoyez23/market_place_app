import 'dart:convert';

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
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  RxBool isLoading = false.obs;
  String chatId;
  RxBool isTyping = false.obs;
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


  RxList<VendorMessageModel> messages = [
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance.",
      isSender: true,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made",
      isSender: false,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines",
      isSender: true,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance. tonight at 1:15? I've made a major break-thro",
      isSender: false,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance.",
      isSender: true,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made",
      isSender: false,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines",
      isSender: true,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance. tonight at 1:15? I've made a major break-thro",
      isSender: false,
      time: DateTime.now(),
    ),
  ].obs;

}


class VendorMessageModel {
  final String text;
  final bool isSender;
  final DateTime time;

  VendorMessageModel({
    required this.text,
    required this.isSender,
    required this.time,
  });
}