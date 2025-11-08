import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserOnboardingController extends GetxController {

  RxInt index = 0.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;


  void changeIndex(int changeValue) {
    index.value = changeValue;
  }


}