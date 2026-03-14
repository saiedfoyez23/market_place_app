import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class ProfileFaqController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ExpansibleController> tileControllers = <ExpansibleController>[].obs;
  RxInt currentExpanded = (-1).obs;
  Rx<UserFAQResponseModel> userFAQResponseModel = UserFAQResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;
  BuildContext context;
  ProfileFaqController({required this.context});


  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getUserAllFaqController(context: context);
    });
  }


  Future<void> getUserAllFaqController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userCustomerFAQ,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        userFAQResponseModel.value = UserFAQResponseModel.fromJson(data);
        tileControllers.value = List.generate(userFAQResponseModel.value.data!.length, (_) => ExpansibleController());
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

  @override
  void onClose() {
    for (final controller in tileControllers) {
      controller.dispose();
    }
    super.onClose();
  }

  void expandOnly(int index) {
    // Collapse all other tiles
    for (int i = 0; i < tileControllers.length; i++) {
      if (i != index) {
        tileControllers[i].collapse();
      }
    }
    // Expand the selected tile
    tileControllers[index].expand();
    currentExpanded.value = index;
  }

  void collapseCurrent() {
    if (currentExpanded.value != -1) {
      tileControllers[currentExpanded.value].collapse();
      currentExpanded.value = -1;
    }
  }


}