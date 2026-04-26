import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorServiceController extends GetxController {
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  Rx<VendorGetAllServiceModelResponse> vendorGetAllServiceModelResponse = VendorGetAllServiceModelResponse().obs;
  RxList<VendorGetAllServiceModel> vendorGetAllServiceModelList = <VendorGetAllServiceModel>[].obs;
  Rx<VendorMyProfileDetailsResponseModel> vendorMyProfileDetailsResponseModel = VendorMyProfileDetailsResponseModel().obs;
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
      await getVendorProfileDetailsController(context: context);
      await getVendorAllServiceController(context: context);
    });
  }

  Rx<VendorServiceStatus> selectedTab = VendorServiceStatus.all.obs;

  RxList<VendorGetAllServiceModel> get filteredService {
    if (selectedTab.value == VendorServiceStatus.all) {
      return vendorGetAllServiceModelList;
    } else {
      return vendorGetAllServiceModelList.where((b) => b.status == selectedTab.value.name).toList().obs;
    }
  }

  void changeTab(VendorServiceStatus status) {
    selectedTab.value = status;
  }

  Future<void> getVendorProfileDetailsController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userProfileDetails,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        vendorMyProfileDetailsResponseModel.value = VendorMyProfileDetailsResponseModel.fromJson(data);
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
        vendorGetAllServiceModelResponse.value.data?.forEach((value) {
          vendorGetAllServiceModelList.add(value);
        });
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


  Future<void> addFeaturedController({
    required BuildContext context,
    required String serviceId,
  }) async {
    BaseApiUtils.patch(
      url: ApiUtils.addFeatureController(serviceId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        vendorGetAllServiceModelList.clear();
        await getVendorAllServiceController(context: context);
      },
      onFail: (e,data) {
        isLoading.value = false;
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
      onExceptionFail: (e,data) {
        isLoading.value = false;
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
    );
  }


}


enum VendorServiceStatus {all, active, pending, denied}