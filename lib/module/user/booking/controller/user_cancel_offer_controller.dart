import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class UserCancelOfferController extends GetxController {

  RxString selectedOption = "".obs;
  RxList<String> options = <String>[
    "Not satisfied with planner communication",
    "Delay in planning progress",
    "Vendor availability issue",
    "Services not matching expectations",
    "Others"
  ].obs;
  RxBool isSubmit = false.obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;
  Rx<TextEditingController> otherController = TextEditingController().obs;
  Rx<TextEditingController> cancelReasonController = TextEditingController().obs;


  Future<void> orderCancelController({
    required BuildContext context,
    required String orderId,
    required Map<String,dynamic> data,
  }) async {

    BaseApiUtils.patch(
      url: ApiUtils.userOrderCancel(orderId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      data: data,
      onSuccess: (e,data) async {
        isSubmit.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        Get.off(()=>DashboardUserView(index: 1),preventDuplicates: false);
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