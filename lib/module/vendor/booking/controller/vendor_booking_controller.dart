import 'package:get/get.dart';

class VendorBookingController extends GetxController {

  Rx<VendorBookingStatus> selectedTab = VendorBookingStatus.all.obs;

  RxList<VendorBookingModel> allBookings = <VendorBookingModel>[
    VendorBookingModel(
      vendorName: "Party Perfect",
      serviceName: "Kids Birthday Party Extravaganza",
      days: "5 Days",
      price: "300",
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      status: VendorBookingStatus.complete,
    ),
    VendorBookingModel(
      vendorName: "Party Perfect",
      serviceName: "Kids Birthday Party Extravaganza",
      days: "5 Days",
      price: "300",
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      status: VendorBookingStatus.active,
    ),
    VendorBookingModel(
      vendorName: "Party Perfect",
      serviceName: "Kids Birthday Party Extravaganza",
      days: "5 Days",
      price: "300",
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      status: VendorBookingStatus.pending,
    ),
    VendorBookingModel(
      vendorName: "Party Perfect",
      serviceName: "Kids Birthday Party Extravaganza",
      days: "5 Days",
      price: "300",
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      status: VendorBookingStatus.cancelled,
    ),
  ].obs;

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
  final String vendorName;
  final String serviceName;
  final String days;
  final String price;
  final String startDate;
  final String endDate;
  final VendorBookingStatus status;

  VendorBookingModel({
    required this.vendorName,
    required this.serviceName,
    required this.days,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}