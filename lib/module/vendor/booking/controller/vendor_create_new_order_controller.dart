import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorCreateNewOrderController extends GetxController {
  final dropdownController = Get.put(SearchableDropdownController<GetAllPlannerResponse>());
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> eventDetailsController = TextEditingController().obs;
  Rx<HtmlEditorController> serviceDetailsController = HtmlEditorController().obs;
  //Rx<TextEditingController> serviceDetailsController = TextEditingController().obs;
  Rx<TextEditingController> deadlineController = TextEditingController().obs;
  Rx<TextEditingController> programStartDateController = TextEditingController().obs;
  Rx<TextEditingController> programEndDateController = TextEditingController().obs;
  Rx<TextEditingController> totalPriceController = TextEditingController().obs;
  Rx<TextEditingController> plannerNameController = TextEditingController().obs;
  Rx<TextEditingController> plannerEmailController = TextEditingController().obs;
  Rx<TextEditingController> plannerPhoneController = TextEditingController().obs;
  Rx<TextEditingController> plannerOrderLocationController = TextEditingController().obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  Rx<DateTime> programStartDate = DateTime.now().obs;
  Rx<DateTime> programEndDate = DateTime.now().obs;

  double long;
  double lat;
  String address;

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  VendorCreateNewOrderController({required this.long,required this.lat,required this.address,required this.context});

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

  Rx<GetAllPlannerResponse> selectUser = GetAllPlannerResponse().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  Rx<GetAllPlannerResponseModel> getAllPlannerResponseModel = GetAllPlannerResponseModel().obs;
  BuildContext context;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    print(address);
    Future.delayed(Duration(seconds: 1),() async {
      await getAllPlannerController(
        context: context,
        onComplete: () {
          plannerOrderLocationController.value.text = address;
          latitude.value = lat;
          longitude.value = long;
        },
      );
    });
  }


  Future<void> getAllPlannerController({
    required BuildContext context,
    required Function onComplete,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllPlanner,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllPlannerResponseModel.value = GetAllPlannerResponseModel.fromJson(data);
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


  Future<void> createNewOrderController({
    required BuildContext context,
    required Map<String,dynamic> data
  }) async {

    isSubmit.value = true;

    BaseApiUtils.post(
      url: ApiUtils.vendorCreateOrder,
      authorization: userLoginResponseModel.value.data?.accessToken,
      data: data,
      onSuccess: (e,data) async {
        print(data);
        isSubmit.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        Get.off(()=>DashboardVendorView(index: 2),preventDuplicates: false);
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