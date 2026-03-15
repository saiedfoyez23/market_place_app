import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';

class MessageController extends GetxController {

  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxBool isSingleChat = true.obs;
  RxString selectChatType = "".obs;
  Rx<GetAllChatResponseModel> getAllChatResponseModel = GetAllChatResponseModel().obs;
  RxBool isLoading = false.obs;
  final SocketServiceController socketServiceController = Get.put(SocketServiceController());
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;
  BuildContext context;
  MessageController({required this.context});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(microseconds: 100),() async {
      await socketServiceController.init();
      socketServiceController.socket!.on('new-message', (data) async {
        print("user data : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      socketServiceController.socket!.on('chat-list::${userLoginResponseModel.value.data?.user?.sId}', (data) async {
        print("chat list : ${data}");
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
      await getAllChatMessageController(context: context,modelType: "User");
    });
  }


  Future<void> getAllChatMessageController({
    required BuildContext context,
    required String modelType
  }) async {

    BaseApiUtils.get(
      url: ApiUtils.getAllMessageResponseModelType(modelType),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllChatResponseModel.value = GetAllChatResponseModel.fromJson(data);
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

  Future<void> getSearchChatMessageController({
    required BuildContext context,
    required String modelType,
    required String searchTerm,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllMessageResponseSearch(modelType,searchTerm),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllChatResponseModel.value = GetAllChatResponseModel.fromJson(data);
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


}