import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerCategoryWiseServiceController extends GetxController {

  String categoryId;
  BuildContext context;
  PlannerCategoryWiseServiceController({required this.context,required this.categoryId});
  RxBool isLoading = false.obs;
  RxBool isCreate = false.obs;
  RxString serviceId = "".obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<GetAllCategoryServiceResponseModel> getAllCategoryServiceResponseModel = GetAllCategoryServiceResponseModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllVendorCategoryServiceController(context: context,categoryId: categoryId);
    });
  }


  Future<void> getAllVendorCategoryServiceController({
    required BuildContext context,
    required String categoryId,
  }) async {
    print( "${ApiUtils.getAllVendorCategoryServiceResponse}${categoryId}");
    BaseApiUtils.get(
      url: "${ApiUtils.getAllVendorCategoryServiceResponse}${categoryId}",
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllCategoryServiceResponseModel.value = GetAllCategoryServiceResponseModel.fromJson(data);
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


  Future<void> createMessageController({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    BaseApiUtils.post(
      url: ApiUtils.createMessageResponseList,
      authorization: userLoginResponseModel.value.data?.accessToken,
      data: data,
      onSuccess: (e,data) async {
        isCreate.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        Get.off(()=>DashboardPlannerView(index: 3),preventDuplicates: false);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isCreate.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isCreate.value = false;
      },
    );

  }

}