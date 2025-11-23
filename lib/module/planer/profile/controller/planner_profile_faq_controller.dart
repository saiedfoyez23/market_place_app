import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlannerProfileFaqController extends GetxController {

  RxList<Map<String, String>> faqList = <Map<String, String>>[
    {
      'question': 'How does SaveKey work?',
      'answer': 'SaveKey connects you to local businesses offering exclusive deals and discounts. Simply sign up, choose your plan, and start redeeming offers in-store using your unique QR code.'
    },
    {
      'question': 'How do I redeem a deal?',
      'answer': 'You can redeem a deal by visiting the partnered business and scanning your unique QR code at checkout.'
    },
    {
      'question': 'Can I use a deal more than once?',
      'answer': 'Each deal can be used according to the terms specified in the app.'
    },
    {
      'question': 'What happens if my QR code expires?',
      'answer': 'You can generate a new QR code from your account page anytime.'
    },
    {
      'question': 'What’s included in the Monthly and Annual plans?',
      'answer': 'Both plans give access to exclusive offers and discounts at participating businesses.'
    },
    {
      'question': 'How do I upgrade, downgrade, or cancel my plan?',
      'answer': 'You can manage your subscription anytime from your account settings in the app.'
    },
  ].obs;

  RxList<ExpansibleController> tileControllers = <ExpansibleController>[].obs;
  RxInt currentExpanded = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    tileControllers.value = List.generate(faqList.length, (_) => ExpansibleController());
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