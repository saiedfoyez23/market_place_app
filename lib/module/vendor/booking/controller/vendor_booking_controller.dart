import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';

class VendorBookingController extends GetxController {

  Rx<VendorBookingStatus> selectedTab = VendorBookingStatus.all.obs;

  RxBool isLoading = false.obs;

  RxList<VendorBookingModel> allBookings = <VendorBookingModel>[
    // VendorBookingModel(
    //   vendorName: "Party Perfect",
    //   serviceName: "Kids Birthday Party Extravaganza",
    //   days: "5 Days",
    //   price: "300",
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   status: VendorBookingStatus.complete,
    //   coverImage: '',
    // ),
    // VendorBookingModel(
    //   vendorName: "Party Perfect",
    //   serviceName: "Kids Birthday Party Extravaganza",
    //   days: "5 Days",
    //   price: "300",
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   status: VendorBookingStatus.active,
    //   coverImage: '',
    // ),
    // VendorBookingModel(
    //   vendorName: "Party Perfect",
    //   serviceName: "Kids Birthday Party Extravaganza",
    //   days: "5 Days",
    //   price: "300",
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   status: VendorBookingStatus.pending,
    //   coverImage: '',
    // ),
    // VendorBookingModel(
    //   vendorName: "Party Perfect",
    //   serviceName: "Kids Birthday Party Extravaganza",
    //   days: "5 Days",
    //   price: "300",
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   status: VendorBookingStatus.cancelled,
    //   coverImage: '',
    // ),
  ].obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  Rx<VendorGetAllOrderResponseModel> vendorGetAllOrderResponseModel = VendorGetAllOrderResponseModel().obs;
  BuildContext context;
  VendorBookingController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllOrderController(context: context);
    });
  }


  Future<void> getAllOrderController({
    required BuildContext context,
  }) async {

    BaseApiUtils.get(
      url: ApiUtils.getAllVendorOrder,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        vendorGetAllOrderResponseModel.value = VendorGetAllOrderResponseModel.fromJson(data);
        vendorGetAllOrderResponseModel.value.data?.forEach((value) {
          allBookings.add(
            VendorBookingModel(
              sid: value.sId ?? "",
              plannerName: value.receiver?.name ?? "",
              serviceName: value.title ?? "",
              days: "${value.duration} Days",
              price: "${value.totalAmount}",
              startDate: "${DateFormat("dd MMM yyyy").format(DateTime.parse(value.startDate))}",
              endDate: "${DateFormat("dd MMM yyyy").format(DateTime.parse(value.endDate))}",
              status: value.status == "complete" ? VendorBookingStatus.complete :
              value.status == "pending" ? VendorBookingStatus.pending :
              value.status == "cancelled" ? VendorBookingStatus.cancelled :
              VendorBookingStatus.active,
              coverImage: value.receiver?.photoUrl ?? "",
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



  RxList<VendorBookingModel> get filteredBookings {
    if (selectedTab.value == VendorBookingStatus.all) {
      return allBookings;
    }
    return allBookings
        .where((b) => b.status == selectedTab.value)
        .toList().obs;
  }

  void changeTab(VendorBookingStatus status) {
    selectedTab.value = status;
  }

}

enum VendorBookingStatus { all, active, complete, pending, cancelled }


class VendorBookingModel {
  final String sid;
  final String coverImage;
  final String plannerName;
  final String serviceName;
  final String days;
  final String price;
  final String startDate;
  final String endDate;
  final VendorBookingStatus status;

  VendorBookingModel({
    required this.sid,
    required this.coverImage,
    required this.plannerName,
    required this.serviceName,
    required this.days,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}