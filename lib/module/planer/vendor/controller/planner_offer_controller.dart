import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlannerOfferController extends GetxController {

  Rx<PlannerBookingStatus> selectedTab = PlannerBookingStatus.all.obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<PlannerBookingModel> allBookings = <PlannerBookingModel>[
    PlannerBookingModel(
      vendorName: "Party Perfect",
      serviceName: "Kids Birthday Party Extravaganza",
      days: "5 Days",
      price: "300",
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      status: PlannerBookingStatus.complete,
    ),
    PlannerBookingModel(
      vendorName: "Party Perfect",
      serviceName: "Kids Birthday Party Extravaganza",
      days: "5 Days",
      price: "300",
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      status: PlannerBookingStatus.inProcess,
    ),
    PlannerBookingModel(
      vendorName: "Party Perfect",
      serviceName: "Kids Birthday Party Extravaganza",
      days: "5 Days",
      price: "300",
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      status: PlannerBookingStatus.pending,
    ),
    PlannerBookingModel(
      vendorName: "Party Perfect",
      serviceName: "Kids Birthday Party Extravaganza",
      days: "5 Days",
      price: "300",
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      status: PlannerBookingStatus.inProcess,
    ),
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
  final String vendorName;
  final String serviceName;
  final String days;
  final String price;
  final String startDate;
  final String endDate;
  final PlannerBookingStatus status;

  PlannerBookingModel({
    required this.vendorName,
    required this.serviceName,
    required this.days,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}