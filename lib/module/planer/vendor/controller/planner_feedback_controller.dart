import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerFeedbackController extends GetxController {

  var communication = 0.obs;
  var service = 0.obs;
  var productQuality = 0.obs;
  RxBool isSubmit = false.obs;

  List<String> image = [
    ImageUtils.greateQuality,
    ImageUtils.helpfulSupportImage,
    ImageUtils.lovedTheBehaveImage,
    ImageUtils.unsatisfiedImage,
    ImageUtils.likeIt,
    ImageUtils.minorIssueNoUnhappyImage,
    ImageUtils.wouldExchangeAgainImage,
  ];

  List<String> options = [
    "Great quality",
    "Helpful support",
    "Loved the behave",
    "Unsatisfied",
    "Like it",
    "Minor issue, so unhappy",
    "Would exchange again",
  ];

  RxString selectedOptions = "".obs;

  Rx<TextEditingController> messageController = TextEditingController().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;

  void toggleOption(String value) {
    if (selectedOptions.contains(value)) {
      selectedOptions.value = "";
    } else {
      selectedOptions.value = value;
    }
  }

  Future<void> createReviewController({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    BaseApiUtils.post(
      url: ApiUtils.createReview,
      data: data,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        Get.off(()=>PlannerFeedbackSuccessfullView(),preventDuplicates: false);
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

  void submitFeedback() {
    print("Communication: ${communication.value}");
    print("Service: ${service.value}");
    print("Product Quality: ${productQuality.value}");
    print("Selected: $selectedOptions");
    print("Message: ${messageController.value.text}");
  }



}