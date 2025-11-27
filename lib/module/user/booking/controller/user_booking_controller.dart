import 'package:get/get.dart';

class UserBookingController extends GetxController {

  Rx<UserBookingStatus> selectedTab = UserBookingStatus.all.obs;

  RxList<UserBookingModel> allBookings = <UserBookingModel>[
    UserBookingModel(
      vendorName: "Party Perfect",
      serviceName: "Kids Birthday Party Extravaganza",
      days: "5 Days",
      price: "300",
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      status: UserBookingStatus.complete,
    ),
    UserBookingModel(
      vendorName: "Party Perfect",
      serviceName: "Kids Birthday Party Extravaganza",
      days: "5 Days",
      price: "300",
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      status: UserBookingStatus.inProcess,
    ),
    UserBookingModel(
      vendorName: "Party Perfect",
      serviceName: "Kids Birthday Party Extravaganza",
      days: "5 Days",
      price: "300",
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      status: UserBookingStatus.pending,
    ),
    UserBookingModel(
      vendorName: "Party Perfect",
      serviceName: "Kids Birthday Party Extravaganza",
      days: "5 Days",
      price: "300",
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      status: UserBookingStatus.inProcess,
    ),
  ].obs;

  RxList<UserBookingModel> get filteredBookings {
    if (selectedTab.value == UserBookingStatus.all) {
      return allBookings;
    }
    return allBookings
        .where((b) => b.status == selectedTab.value)
        .toList().obs;
  }

  void changeTab(UserBookingStatus status) {
    selectedTab.value = status;
  }


}


enum UserBookingStatus { all, complete, pending, inProcess }


class UserBookingModel {
  final String vendorName;
  final String serviceName;
  final String days;
  final String price;
  final String startDate;
  final String endDate;
  final UserBookingStatus status;

  UserBookingModel({
    required this.vendorName,
    required this.serviceName,
    required this.days,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}