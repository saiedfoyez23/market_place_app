import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerSearchController extends GetxController {

  Rx<PlannerSearchResponseModel> plannerSearchResponseModel = PlannerSearchResponseModel().obs;
  Rx<GetAllVendorSearchResponseModel> getAllVendorSearchResponseModel = GetAllVendorSearchResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  RxBool isLoading = false.obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  BuildContext context;
  RxString popularCategory = "".obs;
  RxString suggestedVendor = "".obs;
  RxString trendingCategories = ''.obs;
  PlannerSearchController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getUserSearchController(context: context);
    });
  }

  Future<void> getUserSearchController({required BuildContext context}) async {
    BaseApiUtils.get(
      url: ApiUtils.getUserSearchResponse,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        plannerSearchResponseModel.value = PlannerSearchResponseModel.fromJson(data);
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


  Future<void> getVendorSearchController({required BuildContext context,required String search}) async {
    BaseApiUtils.get(
      url: ApiUtils.getSearchResponse(search),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllVendorSearchResponseModel.value = GetAllVendorSearchResponseModel.fromJson(data);
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

  Future<void> createHistoryController({
    required BuildContext context,
    required Map<String,dynamic> data,
    required Function onComplete,
  }) async {
    BaseApiUtils.post(
      url: ApiUtils.createHistories,
      data: data,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        onComplete();
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


  Future<void> clearHistoryController({required BuildContext context}) async {
    BaseApiUtils.delete(
      url: ApiUtils.clearHistories,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        await getUserSearchController(context: context);
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


  Future<void> deleteHistoryController({required BuildContext context,required String searchId}) async {
    BaseApiUtils.delete(
      url: ApiUtils.deleteSingleResponse(searchId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        await getUserSearchController(context: context);
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