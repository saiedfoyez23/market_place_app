import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerOpenOrderDetailsController extends GetxController {


  Rx<PlannerAllVendorOrderDetailsResponseModel> plannerAllVendorOrderDetailsResponseModel = PlannerAllVendorOrderDetailsResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;

  RxBool isLoading = false.obs;
  RxBool isUpdate = false.obs;
  BuildContext context;
  String orderID;
  PlannerOpenOrderDetailsController({required this.orderID,required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getPlannerOrderDetailsController(context: context, orderID: orderID);
    });
  }


  Future<void> getPlannerOrderDetailsController({
    required BuildContext context,
    required String orderID,
  }) async {
    BaseApiUtils.get(
      url: "${ApiUtils.getPlannerOrderDetails}/$orderID",
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) {
        print(data);
        isLoading.value = false;
        plannerAllVendorOrderDetailsResponseModel.value = PlannerAllVendorOrderDetailsResponseModel.fromJson(data);
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


  Future<void> updateOrderStatusController({
    required BuildContext context,
    required String orderId,
    required String orderStatus
  }) async {

    BaseApiUtils.patch(
      url: "${ApiUtils.updatePlannerOrderStatus}/$orderId",
      authorization: userLoginResponseModel.value.data?.accessToken,
      data: {
        "status": orderStatus // running | denied
      },
      onSuccess: (e,data) async {
        isUpdate.value = false;
        isLoading.value = true;
        Get.off(()=>PlannerOfferView(),preventDuplicates: false);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isUpdate.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isUpdate.value = false;
      },
    );
  }


}