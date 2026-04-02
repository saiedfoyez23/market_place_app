import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class CreateBankAccountController extends GetxController {


  RxString selectIdType = "".obs;
  RxString selectGender = "".obs;
  RxBool isSubmit = false.obs;
  Rx<DateTime> dateOfBirth = DateTime.now().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<TextEditingController> bankCodeController = TextEditingController().obs;
  Rx<TextEditingController> accountNumberController = TextEditingController().obs;
  Rx<TextEditingController> bankNameController = TextEditingController().obs;

  Future<void> createAccountController({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    await BaseApiUtils.post(
      url: ApiUtils.createPaystack,
      data: data,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isSubmit.value = false;
        Get.off(()=>PlannerBankDetailsView(),preventDuplicates: false);
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
    );
  }



}