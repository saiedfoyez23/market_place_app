import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';

class PlannerOfferController extends GetxController {

  Rx<PlannerBookingStatus> selectedTab = PlannerBookingStatus.all.obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxBool isLoading = false.obs;
  Rx<PlannerGetAllVendorOrderResponseModel> plannerGetAllVendorOrderResponseModel = PlannerGetAllVendorOrderResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  BuildContext context;
  RxString selectId = "".obs;
  RxBool isUpdate = false.obs;

  PlannerOfferController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      getAllVendorOrderController(context: context);
    });
  }


  Future<void> getAllVendorOrderController({
    required BuildContext context,
  }) async {

    BaseApiUtils.get(
      url: ApiUtils.getAllVendorOrder,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        plannerGetAllVendorOrderResponseModel.value = PlannerGetAllVendorOrderResponseModel.fromJson(data);
        plannerGetAllVendorOrderResponseModel.value.data?.forEach((value) {
          if(value.status != "denied") {
            allBookings.add(
              PlannerBookingModel(
                sid: value.sId ?? "",
                vendorName: value.sender?.name ?? "",
                serviceName: value.title ?? "",
                days: "${value.duration} Days",
                price: "${value.totalAmount}",
                startDate: "${DateFormat("dd MMM yyyy").format(DateTime.parse(value.startDate))}",
                endDate: "${DateFormat("dd MMM yyyy").format(DateTime.parse(value.endDate))}",
                status: value.status == "complete" ? PlannerBookingStatus.complete :
                value.status == "running" ? PlannerBookingStatus.inProcess :
                PlannerBookingStatus.pending,
                coverImage: value.sender?.photoUrl ?? "",
              ),
            );
          }
        });
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }


  Future<void> updateOrderStatusController({
    required BuildContext context,
    required String orderId,
  }) async {

    BaseApiUtils.patch(
      url: "${ApiUtils.updatePlannerOrderStatus}/$orderId",
      authorization: userLoginResponseModel.value.data?.accessToken,
      data: {
        "status": "running" // running | denied
      },
      onSuccess: (e,data) async {
        isUpdate.value = false;
        selectId.value = "";
        isLoading.value = true;
        await getAllVendorOrderController(context: context);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isUpdate.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isUpdate.value = false;
      },
    );
  }

  Future<void> getAllVendorOrderSearchController({
    required BuildContext context,
    required String searchTerm,
  }) async {

    BaseApiUtils.get(
      url: "${ApiUtils.getAllVendorOrder}&searchTerm=${searchTerm}",
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        plannerGetAllVendorOrderResponseModel.value = PlannerGetAllVendorOrderResponseModel.fromJson(data);
        plannerGetAllVendorOrderResponseModel.value.data?.forEach((value) {
          allBookings.add(
            PlannerBookingModel(
              sid: value.sId ?? "",
              vendorName: value.sender?.name ?? "",
              serviceName: value.title ?? "",
              days: "${value.duration} Days",
              price: "${value.totalAmount}",
              startDate: "${DateFormat("dd MMM yyyy").format(DateTime.parse(value.startDate))}",
              endDate: "${DateFormat("dd MMM yyyy").format(DateTime.parse(value.endDate))}",
              status: value.status == "complete" ? PlannerBookingStatus.complete :
              value.status == "pending" ? PlannerBookingStatus.pending :
              PlannerBookingStatus.inProcess,
              coverImage: value.sender?.photoUrl ?? "",
            ),
          );
        });
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }





  RxList<PlannerBookingModel> allBookings = <PlannerBookingModel>[
    // PlannerBookingModel(
    //   vendorName: "Party Perfect",
    //   serviceName: "Kids Birthday Party Extravaganza",
    //   days: "5 Days",
    //   price: "300",
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   status: PlannerBookingStatus.complete,
    // ),
    // PlannerBookingModel(
    //   vendorName: "Party Perfect",
    //   serviceName: "Kids Birthday Party Extravaganza",
    //   days: "5 Days",
    //   price: "300",
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   status: PlannerBookingStatus.inProcess,
    // ),
    // PlannerBookingModel(
    //   vendorName: "Party Perfect",
    //   serviceName: "Kids Birthday Party Extravaganza",
    //   days: "5 Days",
    //   price: "300",
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   status: PlannerBookingStatus.pending,
    // ),
    // PlannerBookingModel(
    //   vendorName: "Party Perfect",
    //   serviceName: "Kids Birthday Party Extravaganza",
    //   days: "5 Days",
    //   price: "300",
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   status: PlannerBookingStatus.inProcess,
    // ),
  ].obs;

  RxList<PlannerBookingModel> get filteredBookings {
    if (selectedTab.value == PlannerBookingStatus.all) {
      return allBookings;
    }
    return allBookings
        .where((b) => b.status == selectedTab.value)
        .toList().obs;
  }

  void changeTab(PlannerBookingStatus status) {
    selectedTab.value = status;
  }



}


enum PlannerBookingStatus { all, complete, pending, inProcess }


class PlannerBookingModel {
  final String sid;
  final String coverImage;
  final String vendorName;
  final String serviceName;
  final String days;
  final String price;
  final String startDate;
  final String endDate;
  final PlannerBookingStatus status;

  PlannerBookingModel({
    required this.sid,
    required this.coverImage,
    required this.vendorName,
    required this.serviceName,
    required this.days,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}