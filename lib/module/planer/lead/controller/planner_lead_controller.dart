import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerLeadController extends GetxController {
  RxInt selectedTab = 0.obs;
  RxBool isLoading = false.obs;

  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<PlannerLeadsResponseModel> plannerLeadsResponseModel = PlannerLeadsResponseModel().obs;
  BuildContext context;
  PlannerLeadController({required this.context});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await changeTab(index: 0, context: context);
    });
  }


  Future<void> changeTab({required int index,required BuildContext context}) async {
    selectedTab.value = index;
    if(index == 0) {
      await getAllPlannerLeadsController(context: context,tab: "new");
    } else if(index == 1) {
      await getAllPlannerLeadsController(context: context,tab: "contacted");
    } else if(index == 2) {
      await getAllPlannerLeadsController(context: context,tab: "qualified");
    } else if(index == 3) {
      await getAllPlannerLeadsController(context: context,tab: "cancel");
    }
  }


  Future<void> getAllPlannerLeadsController({
    required BuildContext context,
    required String tab,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllPlannerLeads(tab),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        plannerLeadsResponseModel.value = PlannerLeadsResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }

}