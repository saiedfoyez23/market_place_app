import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorChatController extends GetxController {

  Rx<TextEditingController> chatController = TextEditingController().obs;

  RxList<VendorMessageModel> messages = [
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance.",
      isSender: true,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made",
      isSender: false,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines",
      isSender: true,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance. tonight at 1:15? I've made a major break-thro",
      isSender: false,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance.",
      isSender: true,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made",
      isSender: false,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines",
      isSender: true,
      time: DateTime.now(),
    ),
    VendorMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance. tonight at 1:15? I've made a major break-thro",
      isSender: false,
      time: DateTime.now(),
    ),
  ].obs;

}


class VendorMessageModel {
  final String text;
  final bool isSender;
  final DateTime time;

  VendorMessageModel({
    required this.text,
    required this.isSender,
    required this.time,
  });
}