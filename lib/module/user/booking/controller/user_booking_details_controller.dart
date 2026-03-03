import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';

class UserBookingDetailsController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  RxBool isDenied = false.obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;
  Rx<GetClientOrderDetailsResponseModel> getClientOrderDetailsResponseModel = GetClientOrderDetailsResponseModel().obs;
  BuildContext context;
  String orderId;
  UserBookingDetailsController({required this.context,required this.orderId});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getOrderDetailsController(context: context, orderId: orderId);
    });
  }


  Future<void> getOrderDetailsController({
    required BuildContext context,
    required String orderId,
  }) async {

    BaseApiUtils.get(
      url: ApiUtils.getUserOrderDetails(orderId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getClientOrderDetailsResponseModel.value = GetClientOrderDetailsResponseModel.fromJson(data);
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


  Future<void> createPaymentController({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    BaseApiUtils.post(
      url: ApiUtils.createPayments,
      data: data,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        Get.off(()=>UserPaymentView(paymentUrl: data["data"]),preventDuplicates: false);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
    );
  }


  Future<void> deniedOfferController({
    required BuildContext context,
    required Map<String,dynamic> data,
    required String orderId,
  }) async {
    BaseApiUtils.patch(
      url: ApiUtils.userOrderDenied(orderId),
      data: data,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isDenied.value = false;
        Get.off(()=>DashboardUserView(index: 1),preventDuplicates: false);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDenied.value = false;
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDenied.value = false;
      },
    );
  }


}