import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';

class VendorOrderDetailsController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<VendorOrderDetailsResponseModel> vendorOrderDetailsResponseModel = VendorOrderDetailsResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;

  BuildContext context;
  String orderID;
  VendorOrderDetailsController({required this.context,required this.orderID});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getOrderDetailsController(context: context, orderID: orderID);
    });
  }


  Future<void> getOrderDetailsController({
    required BuildContext context,
    required String orderID,
  }) async {
    BaseApiUtils.get(
      url: "${ApiUtils.getVendorOrderDetails}/$orderID",
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        vendorOrderDetailsResponseModel.value = VendorOrderDetailsResponseModel.fromJson(data);
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


}