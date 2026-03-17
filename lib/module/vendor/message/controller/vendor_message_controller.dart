import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class VendorMessageController extends GetxController {


  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxBool isSingleChat = true.obs;
  RxBool isGroupChat = false.obs;
  RxString selectChatType = "".obs;
  Rx<GetAllChatResponseModel> getAllChatResponseModel = GetAllChatResponseModel().obs;
  RxBool isLoading = false.obs;
  final VendorSocketServiceController vendorSocketServiceController = Get.put(VendorSocketServiceController());
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  BuildContext context;
  VendorMessageController({required this.context});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(microseconds: 100),() async {
      await vendorSocketServiceController.init();
      vendorSocketServiceController.socket!.on('new-message', (data) async {
        print("newMessage data : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      vendorSocketServiceController.socket!.on('chat-list::${userLoginResponseModel.value.data?.user?.sId}', (data) async {
        print("chat list : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      vendorSocketServiceController.socket!.on('onlineUser', (data) async {
        print("onLineUser data : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      vendorSocketServiceController.socket!.on('typing', (data) async {
        print("typing data : ${data}");
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      vendorSocketServiceController.socket!.on('stopTyping', (data) async {
        print("stopTyping data : ${data}");
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


  Future<void> seenMessageController({
    required BuildContext context,
    required String chatId,
  }) async {

    BaseApiUtils.patch(
      url: ApiUtils.seenAllMessage(chatId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        Get.off(()=>VendorChatView(chatId: chatId,),preventDuplicates: false);
        //Get.off(()=>ChatView(chatId: chatId,),preventDuplicates: false);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
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

  String getDynamicTime(String start, String end) {
    final diff = DateTime.parse(end).difference(DateTime.parse(start));

    if (diff.inMinutes < 60) {
      int m = diff.inMinutes;
      return "$m minute${m == 1 ? '' : 's'}";
    } else if (diff.inHours < 24) {
      int h = diff.inHours;
      return "$h hour${h == 1 ? '' : 's'}";
    } else if (diff.inDays < 365) {
      int d = diff.inDays;
      return "$d day${d == 1 ? '' : 's'}";
    } else {
      int y = (diff.inDays / 365).floor();
      return "$y year${y == 1 ? '' : 's'}";
    }
  }



}