import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorServiceController extends GetxController {
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  Rx<VendorGetAllServiceModelResponse> vendorGetAllServiceModelResponse = VendorGetAllServiceModelResponse().obs;
  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  BuildContext context;
  VendorServiceController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getVendorAllServiceController(context: context);
    });
  }

  Future<void> getVendorAllServiceController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.myAllService,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        vendorGetAllServiceModelResponse.value = VendorGetAllServiceModelResponse.fromJson(data);
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

  Future<void> deleteVendorServiceController({
    required BuildContext context,
    required String serviceId,
  }) async {
    BaseApiUtils.delete(
      url: "${ApiUtils.deleteService}/${serviceId}",
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = true;
        isDelete.value = false;
        Navigator.pop(context);
        await getVendorAllServiceController(context: context);
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


  RxList<Map<String, dynamic>> serviceList = <Map<String, dynamic>>[
    {
      "image": ImageUtils.wishlistImage,
      "title": "Kids Birthday Party Extravaganza",
      "description":
      "Colorful themed decorations with games, entertainment, and birthday cake arrangement.",
      "location": "Mohakhali, gulsan 01",
    },
    {
      "image": ImageUtils.wishlistImage,
      "title": "Kids Birthday Party Extravaganza",
      "description":
      "Colorful themed decorations with games, entertainment, and birthday cake arrangement.",
      "location": "Mohakhali, gulsan 01",
    },
    {
      "image": ImageUtils.wishlistImage,
      "title": "Kids Birthday Party Extravaganza",
      "description":
      "Colorful themed decorations with games, entertainment, and birthday cake arrangement.",
      "location": "Mohakhali, gulsan 01",
    },
  ].obs;



}