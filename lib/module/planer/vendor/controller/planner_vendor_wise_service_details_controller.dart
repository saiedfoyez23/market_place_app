import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';

class PlannerVendorWiseServiceDetailsController extends GetxController {

  Rx<GetServiceDetailsResponseModel> getServiceDetailsResponseModel = GetServiceDetailsResponseModel().obs;
  Rx<GetAllUserReviewResponseModel> getAllUserReviewResponseModel = GetAllUserReviewResponseModel().obs;
  BuildContext context;
  String serviceId;
  PlannerVendorWiseServiceDetailsController({required this.context,required this.serviceId});
  RxBool isLoading = false.obs;
  RxBool isCreate = false.obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    print(serviceId);
    Future.delayed(Duration(seconds: 1),() async {
      await getServiceDetailsController(
        context: context,
        serviceId: serviceId,
        onComplete: (userId) async {
          await getAllUserReviewController(context: context, userId: userId);
        },
      );
    });
  }

  Future<void> getAllUserReviewController({
    required BuildContext context,
    required String userId,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllUserReview(userId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllUserReviewResponseModel.value = GetAllUserReviewResponseModel.fromJson(data);
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


  Future<void> getServiceDetailsController({
    required BuildContext context,
    required String serviceId,
    required Function onComplete,
  }) async {
    BaseApiUtils.get(
      url: "${ApiUtils.serviceDetailsResponse}/${serviceId}",
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        getServiceDetailsResponseModel.value = GetServiceDetailsResponseModel.fromJson(data);
        onComplete(getServiceDetailsResponseModel.value.data?.author?.sId);
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