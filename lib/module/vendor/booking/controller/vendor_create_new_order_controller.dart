import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VendorCreateNewOrderController extends GetxController {

  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> eventDetailsController = TextEditingController().obs;
  Rx<TextEditingController> serviceDetailsController = TextEditingController().obs;
  Rx<TextEditingController> deadlineController = TextEditingController().obs;
  Rx<TextEditingController> programStartDateController = TextEditingController().obs;
  Rx<TextEditingController> programEndDateController = TextEditingController().obs;
  Rx<TextEditingController> totalPriceController = TextEditingController().obs;
  Rx<TextEditingController> plannerNameController = TextEditingController().obs;
  Rx<TextEditingController> plannerEmailController = TextEditingController().obs;
  Rx<TextEditingController> plannerPhoneController = TextEditingController().obs;
  Rx<TextEditingController> plannerOrderLocationController = TextEditingController().obs;

  Rx<DateTime> programStartDate = DateTime.now().obs;
  Rx<DateTime> programEndDate = DateTime.now().obs;


  Future<void> pickProgramStartDate({required BuildContext context}) async {
    // Pick Date
    final DateTime? pick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pick != null) {
      programStartDate.value = pick;
      programStartDateController.value.text = DateFormat("dd-MM-yyyy").format(programEndDate.value.toLocal());
    } // user canceled
  }


  Future<void> pickProgramEndDate({required BuildContext context}) async {
    // Pick Date
    final DateTime? pick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pick != null) {
      programEndDate.value = pick;
      programEndDateController.value.text = DateFormat("dd-MM-yyyy").format(programEndDate.value.toLocal());
    } // user canceled
  }



}