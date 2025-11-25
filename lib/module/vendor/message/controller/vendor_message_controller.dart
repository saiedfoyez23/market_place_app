import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorMessageController extends GetxController {

  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxBool isSingleChat = true.obs;


}