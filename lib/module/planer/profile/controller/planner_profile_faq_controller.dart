import 'dart:convert';
import 'package:marketplaceapp/module/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerProfileFaqController extends GetxController {
  RxBool isLoading = false.obs;
  BuildContext context;
  PlannerProfileFaqController({required this.context});

  RxList<ExpansibleController> tileControllers = <ExpansibleController>[].obs;
  RxInt currentExpanded = (-1).obs;
  Rx<PlannerFAQResponseModel> plannerFAQResponseModel = PlannerFAQResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllFaqController(context: context);
    });
  }

  Future<void> getAllFaqController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userPlannerFAQ,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        plannerFAQResponseModel.value = PlannerFAQResponseModel.fromJson(data);
        tileControllers.value = List.generate(plannerFAQResponseModel.value.data!.length, (_) => ExpansibleController());
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