import 'dart:convert';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:flutter/material.dart';

class VendorProfileViewController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  Rx<GetAllFeaturedServiceResponseModel> getAllFeaturedServiceResponseModel = GetAllFeaturedServiceResponseModel().obs;
  Rx<VendorMyProfileDetailsResponseModel> vendorMyProfileDetailsResponseModel = VendorMyProfileDetailsResponseModel().obs;
  BuildContext context;
  VendorProfileViewController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getVendorProfileDetailsController(
        context: context,
        onComplete: (userId) async {
          await getAllVendorFeatureServiceDetailsController(context: context, userId: userId);
        },
      );
    });
  }


  Future<void> getVendorProfileDetailsController({
    required BuildContext context,
    required Function onComplete,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userProfileDetails,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        vendorMyProfileDetailsResponseModel.value = VendorMyProfileDetailsResponseModel.fromJson(data);
        onComplete(vendorMyProfileDetailsResponseModel.value.data?.sId);
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

  Future<void> getAllVendorFeatureServiceDetailsController({
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
        await getVendorProfileDetailsController(
          context: context,
          onComplete: (userId) async {
            await getAllVendorFeatureServiceDetailsController(context: context, userId: userId);
          },
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


  Future<void> getVendorProfileDeleteController({
    required BuildContext context,
  }) async {

    isDelete.value = true;

    BaseApiUtils.delete(
      url: ApiUtils.userDeleteProfile,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isDelete.value = false;
        await LocalStorageUtils.remove(AppConstantUtils.vendorLoginResponse);
        Get.offAll(()=>VendorLoginView());
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



  Rx<VendorProfileTab> selectedTab = VendorProfileTab.overview.obs;

  void changeTab(VendorProfileTab selectTab) {
    selectedTab.value = selectTab;
  }


}

enum VendorProfileTab { overview, settings }


