import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';

class ChatController extends GetxController {

  Rx<TextEditingController> chatController = TextEditingController().obs;
  Rx<UserMyProfileDetailsResponseModel> userMyProfileDetailsResponseModel = UserMyProfileDetailsResponseModel().obs;
  final SocketServiceController socketServiceController = Get.put(SocketServiceController());
  Rx<GetChatDetailsResponseModel> getChatDetailsResponseModel = GetChatDetailsResponseModel().obs;
  Rx<GetAllMessageResponseModel> getAllMessageResponseModel = GetAllMessageResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;
  RxBool isLoading = false.obs;
  String chatId;
  RxBool isTyping = false.obs;
  BuildContext context;

  ChatController({required this.chatId,required this.context});



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading = true.obs;
    Future.delayed(Duration(microseconds: 100),() async {
      await socketServiceController.init();
      socketServiceController.socket!.on('new-message', (data) async {
        print("user data : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      socketServiceController.socket!.on('onlineUser', (data) async {
        print("user data : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      socketServiceController.socket!.on('typing', (data) async {
        print("user data : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      socketServiceController.socket!.on('stopTyping', (data) async {
        print("user data : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      await getProfileController(context: context);
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

  Future<void> getProfileController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userProfileDetails,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        userMyProfileDetailsResponseModel.value = UserMyProfileDetailsResponseModel.fromJson(data);
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


  RxList<MessageModel> messages = [
    MessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance.",
      isSender: true,
      time: DateTime.now(),
    ),
    MessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made",
      isSender: false,
      time: DateTime.now(),
    ),
    MessageModel(
      text: "Listen, can you meet me at Twin Pines",
      isSender: true,
      time: DateTime.now(),
    ),
    MessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance. tonight at 1:15? I've made a major break-thro",
      isSender: false,
      time: DateTime.now(),
    ),
    MessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance.",
      isSender: true,
      time: DateTime.now(),
    ),
    MessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made",
      isSender: false,
      time: DateTime.now(),
    ),
    MessageModel(
      text: "Listen, can you meet me at Twin Pines",
      isSender: true,
      time: DateTime.now(),
    ),
    MessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance. tonight at 1:15? I've made a major break-thro",
      isSender: false,
      time: DateTime.now(),
    ),
  ].obs;




}

class MessageModel {
  final String text;
  final bool isSender;
  final DateTime time;

  MessageModel({
    required this.text,
    required this.isSender,
    required this.time,
  });
}
