import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class PlannerCreateNewProjectController extends GetxController {

  final dropdownController = Get.put(SearchableDropdownController<GetAllUserResponse>());
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> eventDetailsController = TextEditingController().obs;
  Rx<HtmlEditorController> serviceDetailsController = HtmlEditorController().obs;
  //Rx<TextEditingController> serviceDetailsController = TextEditingController().obs;
  Rx<TextEditingController> deadlineController = TextEditingController().obs;
  Rx<TextEditingController> programStartDateController = TextEditingController().obs;
  //Rx<TextEditingController> programEndDateController = TextEditingController().obs;
  Rx<TextEditingController> totalPriceController = TextEditingController().obs;
  Rx<TextEditingController> plannerNameController = TextEditingController().obs;
  Rx<TextEditingController> plannerEmailController = TextEditingController().obs;
  Rx<TextEditingController> plannerPhoneController = TextEditingController().obs;
  Rx<TextEditingController> plannerOrderLocationController = TextEditingController().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<GetAllUserResponseModel> getAllUserResponseModel = GetAllUserResponseModel().obs;

  Rx<DateTime> programStartDate = DateTime.now().obs;
  //Rx<DateTime> programEndDate = DateTime.now().obs;

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  Rx<GetAllUserResponse> selectUser = GetAllUserResponse().obs;


  double long;
  double lat;
  String address;
  BuildContext context;
  PlannerCreateNewProjectController({
    required this.long,
    required this.lat,
    required this.address,
    required this.context,
  });


  RxList<String> eventType = <String>[
    "Corporate Event",
    "Music Festivals",
    "Weddings and Anniversaries",
    "Outdoor / sporting events",
    "Educational Conferences",
    "Bar & Bat Mitzvahs",
    "Product Launches",
    "Gala Fundraisers",
    "Trade Shows",
    "Social Gatherings",
    "Others"
  ].obs;

  RxString selectEventType = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllUserController(
        context: context,
        onComplete: () {
          plannerOrderLocationController.value.text = address;
          latitude.value = lat;
          longitude.value = long;
        },
      );
    });
  }


  Future<void> getAllUserController({
    required BuildContext context,
    required Function onComplete,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllUsers,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllUserResponseModel.value = GetAllUserResponseModel.fromJson(data);
        onComplete();
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
      programStartDateController.value.text = DateFormat("yyyy-MM-dd").format(programStartDate.value.toLocal());
    } // user canceled
  }

  Rx<TimeOfDay?> startTime = Rx<TimeOfDay?>(null);
  Rx<TimeOfDay?> endTime = Rx<TimeOfDay?>(null);

  Rx<TextEditingController> startTimeController = TextEditingController().obs;
  Rx<TextEditingController> endTimeController = TextEditingController().obs;


  Future<void> pickStartTime({required BuildContext context}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      startTime.value = picked;

      startTimeController.value.text = picked.format(context);

      // Reset end time if it's now invalid
      if (endTime.value != null) {
        final startMinutes = picked.hour * 60 + picked.minute;
        final endMinutes = endTime.value!.hour * 60 + endTime.value!.minute;

        if (endMinutes <= startMinutes) {
          endTime.value = null;
          endTimeController.value.clear();
        }
      }
    }
  }


  Future<void> pickEndTime({required BuildContext context}) async {
    if (startTime.value == null) {
      MessageSnackBarWidget.errorSnackBarWidget(context: context,message:"Please select start time first");
      return;
    }

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: startTime.value!,
    );

    if (picked != null) {
      final startMinutes =
          startTime.value!.hour * 60 + startTime.value!.minute;
      final endMinutes = picked.hour * 60 + picked.minute;

      if (endMinutes > startMinutes) {
        endTime.value = picked;
        endTimeController.value.text = picked.format(context);
      } else {
        MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "End time must be greater than start time");
      }
    }
  }



  Future<void> plannerCreateNewOrderController({
    required BuildContext context,
    required Map<String,dynamic> data
  }) async {

    BaseApiUtils.post(
      url: ApiUtils.plannerCreateOrder,
      authorization: userLoginResponseModel.value.data?.accessToken,
      data: data,
      onSuccess: (e,data) async {
        print(data);
        isSubmit.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        Get.off(()=>DashboardPlannerView(index: 1),preventDuplicates: false);
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



// Future<void> pickProgramEndDate({required BuildContext context}) async {
  //   // Pick Date
  //   final DateTime? pick = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1950),
  //     lastDate: DateTime(2100),
  //   );
  //
  //   if (pick != null) {
  //     programEndDate.value = pick;
  //     programEndDateController.value.text = DateFormat("dd-MM-yyyy").format(programEndDate.value.toLocal());
  //   } // user canceled
  // }



}