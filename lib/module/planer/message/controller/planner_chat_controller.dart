import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlannerChatController extends GetxController {

  Rx<TextEditingController> chatController = TextEditingController().obs;

  RxList<PlannerMessageModel> messages = [
    PlannerMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance.",
      isSender: true,
      time: DateTime.now(),
    ),
    PlannerMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made",
      isSender: false,
      time: DateTime.now(),
    ),
    PlannerMessageModel(
      text: "Listen, can you meet me at Twin Pines",
      isSender: true,
      time: DateTime.now(),
    ),
    PlannerMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance. tonight at 1:15? I've made a major break-thro",
      isSender: false,
      time: DateTime.now(),
    ),
    PlannerMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance.",
      isSender: true,
      time: DateTime.now(),
    ),
    PlannerMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made",
      isSender: false,
      time: DateTime.now(),
    ),
    PlannerMessageModel(
      text: "Listen, can you meet me at Twin Pines",
      isSender: true,
      time: DateTime.now(),
    ),
    PlannerMessageModel(
      text: "Listen, can you meet me at Twin Pines Mall tonight at 1:15? I've made a major break-through... I'll need your assistance. tonight at 1:15? I've made a major break-thro",
      isSender: false,
      time: DateTime.now(),
    ),
  ].obs;

}


class PlannerMessageModel {
  final String text;
  final bool isSender;
  final DateTime time;

  PlannerMessageModel({
    required this.text,
    required this.isSender,
    required this.time,
  });
}