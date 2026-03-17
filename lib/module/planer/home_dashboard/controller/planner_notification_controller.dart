import 'dart:convert';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerNotificationController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  Rx<GetAllNotificationResponseModel> getAllNotificationResponseModel = GetAllNotificationResponseModel().obs;
  BuildContext context;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  PlannerNotificationController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllNotificationController(context: context);
    });
  }


  Future<void> getAllNotificationController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllNotification,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllNotificationResponseModel.value = GetAllNotificationResponseModel.fromJson(data);
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


  Future<void> markAllAsReadNotificationController({
    required BuildContext context,
  }) async {
    BaseApiUtils.patch(
      url: ApiUtils.markAllAsRead,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = true;
        await getAllNotificationController(context: context);
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


  Future<void> deleteNotificationController({
    required BuildContext context,
    required String notificationId,
  }) async {
    print(ApiUtils.deleteNotification(notificationId));
    BaseApiUtils.delete(
      url: ApiUtils.deleteNotification(notificationId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isDelete.value  = false;
        Get.delete<PlannerNotificationController>(force: true);
        Get.off(()=>PlannerNotificationView(),preventDuplicates: false);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value  = false;
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value  = false;
      },
    );
  }


  String getDynamicTime(String start, String end) {
    final diff = DateTime.parse(end).difference(DateTime.parse(start));

    if (diff.inSeconds < 60) {
      int s = diff.inSeconds;
      return "$s s";
    } else if (diff.inMinutes < 60) {
      int m = diff.inMinutes;
      return "$m m";
    } else if (diff.inHours < 24) {
      int h = diff.inHours;
      return "$h h";
    } else if (diff.inDays < 365) {
      int d = diff.inDays;
      return "$d d";
    } else {
      int y = (diff.inDays / 365).floor();
      return "$y y";
    }
  }





}