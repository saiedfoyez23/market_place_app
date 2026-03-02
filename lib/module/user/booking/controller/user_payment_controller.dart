import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class UserPaymentController extends GetxController {


  Future<void> getPaymentDetailsController({
    required BuildContext context,
    required String paymentUrl,
  }) async {

    BaseApiUtils.get(
      url: paymentUrl,
      onSuccess: (e,data) async {
        bool success = data['success'];
        if(success == true) {
          MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
          Get.off(()=>BookingPaymentSuccessView(),preventDuplicates: false);
        } else {
          MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
          Get.off(()=>DashboardUserView(index: 1),preventDuplicates: false);
        }
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        Get.off(()=>DashboardUserView(index: 1),preventDuplicates: false);
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        Get.off(()=>DashboardUserView(index: 1),preventDuplicates: false);
      },
    );
  }


}