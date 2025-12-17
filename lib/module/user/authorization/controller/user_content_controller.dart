import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';

class UserContentController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<UserContentResponseModel> userContentResponseModel = UserContentResponseModel().obs;
  BuildContext context;
  UserContentController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getContentController();
    });
  }

  Future<void> getContentController() async {
    BaseApiUtils.get(
      url: ApiUtils.userContent,
      onSuccess: (e,data) async {
        isLoading.value = false;
        userContentResponseModel.value = UserContentResponseModel.fromJson(data);
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