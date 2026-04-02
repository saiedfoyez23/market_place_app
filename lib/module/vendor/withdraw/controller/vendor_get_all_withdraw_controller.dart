import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorGetAllWithdrawController extends GetxController {

  RxBool isLoading = false.obs;
  BuildContext context;
  VendorGetAllWithdrawController({required this.context});
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  Rx<GetAllWithdrawResponseModel> getAllWithdrawResponseModel = GetAllWithdrawResponseModel().obs;
  RxList<GetAllWithdrawResponseWithdrawList> filterWithdrawList = <GetAllWithdrawResponseWithdrawList>[].obs;
  RxList<GetAllWithdrawResponseWithdrawList> getAllWithdrawResponseWithdrawList = <GetAllWithdrawResponseWithdrawList>[].obs;
  RxBool isCreate = false.obs;
  RxString selectType = "All".obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await vendorGetAllWithdrawController(context: context);
    });
  }


  Future<void> vendorGetAllWithdrawController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getWithdraw,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllWithdrawResponseModel.value = GetAllWithdrawResponseModel.fromJson(data);
        getAllWithdrawResponseModel.value.data?.withdrawList?.forEach((value) {
          getAllWithdrawResponseWithdrawList.add(value);
          filterWithdrawList.add(value);
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



}