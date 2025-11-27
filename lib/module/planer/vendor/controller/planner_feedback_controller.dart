import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerFeedbackController extends GetxController {

  var communication = 1.obs;
  var service = 1.obs;
  var productQuality = 1.obs;

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

  var selectedOptions = <String>[].obs;

  Rx<TextEditingController> messageController = TextEditingController().obs;

  void toggleOption(String value) {
    if (selectedOptions.contains(value)) {
      selectedOptions.remove(value);
    } else {
      selectedOptions.add(value);
    }
  }

  void submitFeedback() {
    print("Communication: ${communication.value}");
    print("Service: ${service.value}");
    print("Product Quality: ${productQuality.value}");
    print("Selected: $selectedOptions");
    print("Message: ${messageController.value.text}");
  }



}