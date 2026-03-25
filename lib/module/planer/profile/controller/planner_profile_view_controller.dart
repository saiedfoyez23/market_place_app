import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerProfileViewController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  Rx<GetAllFeaturedServiceResponseModel> getAllFeaturedServiceResponseModel = GetAllFeaturedServiceResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<PlannerMyProfileDetailsResponseModel> plannerMyProfileDetailsResponseModel = PlannerMyProfileDetailsResponseModel().obs;
  BuildContext context;
  PlannerProfileViewController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getPlannerProfileDetailsController(
        context: context,
        onComplete: (userId) async {
          await getAllPlannerFeatureServiceDetailsController(
            context: context,
            userId: userId,
          );
        }
      );
    });
  }


  Future<void> getPlannerProfileDetailsController({
    required BuildContext context,
    required Function onComplete,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userProfileDetails,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        plannerMyProfileDetailsResponseModel.value = PlannerMyProfileDetailsResponseModel.fromJson(data);
        onComplete(plannerMyProfileDetailsResponseModel.value.data?.sId);
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

  Future<void> getAllPlannerFeatureServiceDetailsController({
    required BuildContext context,
    required String userId,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getUserFeaturedService(userId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllFeaturedServiceResponseModel.value = GetAllFeaturedServiceResponseModel.fromJson(data);
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

  Future<void> addFeaturedController({
    required BuildContext context,
    required String serviceId,
  }) async {
    BaseApiUtils.patch(
      url: ApiUtils.addFeatureController(serviceId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = true;
        await getPlannerProfileDetailsController(
            context: context,
            onComplete: (userId) async {
              await getAllPlannerFeatureServiceDetailsController(
                context: context,
                userId: userId,
              );
            }
        );
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



  Future<void> getPlannerProfileDeleteController({
    required BuildContext context,
  }) async {

    isDelete.value = true;

    BaseApiUtils.delete(
      url: ApiUtils.userDeleteProfile,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isDelete.value = false;
        await LocalStorageUtils.remove(AppConstantUtils.plannerLoginResponse);
        Get.offAll(()=>PlannerLoginView());
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value = false;
        Get.back();
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value = false;
        Get.back();
      },
    );

  }


  Rx<PlannerProfileTab> selectedTab = PlannerProfileTab.overview.obs;

  void changeTab(PlannerProfileTab selectTab) {
    selectedTab.value = selectTab;
  }


}

enum PlannerProfileTab { overview, settings }


