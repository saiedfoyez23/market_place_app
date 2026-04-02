import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorCreateBankAccountController extends GetxController {

  RxString selectIdType = "".obs;
  RxString selectGender = "".obs;
  RxBool isSubmit = false.obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  Rx<TextEditingController> bankCodeController = TextEditingController().obs;
  Rx<TextEditingController> accountNumberController = TextEditingController().obs;
  Rx<TextEditingController> bankNameController = TextEditingController().obs;

  Future<void> vendorCreateAccountController({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    await BaseApiUtils.post(
      url: ApiUtils.createPaystack,
      data: data,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isSubmit.value = false;
        Get.off(()=>VendorBankDetailsView(),preventDuplicates: false);
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