import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class UserBookingController extends GetxController {

  Rx<UserBookingStatus> selectedTab = UserBookingStatus.all.obs;
  Rx<GetAllClientOrderResponseModel> getAllClientOrderResponseModel = GetAllClientOrderResponseModel().obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;
  BuildContext context;
  UserBookingController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllPlannerOrderController(context: context);
    });
  }


  Future<void> getAllPlannerOrderController({
    required BuildContext context,
  }) async {

    BaseApiUtils.get(
      url: ApiUtils.getAllUserOrder,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllClientOrderResponseModel.value = GetAllClientOrderResponseModel.fromJson(data);
        getAllClientOrderResponseModel.value.data?.forEach((value) {
          if (value.status == "denied") {
            return;
          }
          allBookings.add(
            UserBookingModel(
              sid: value.sId ?? "",
              userSid: value.receiver?.sId ?? "",
              plannerSid: value.sender?.sId ?? "",
              plannerName: value.sender?.name ?? "",
              serviceName: value.title ?? "",
              days: "${value.duration} Days",
              price: "${value.totalAmount}",
              startDate: "${DateFormat("dd MMM yyyy").format(DateTime.parse(value.startDate))}",
              endDate: "${DateFormat("dd MMM yyyy").format(DateTime.parse(value.endDate))}",
              status: value.status == "completed" ? UserBookingStatus.complete :
              value.status == "pending" ? UserBookingStatus.pending :
              value.status == "running" ? UserBookingStatus.active :
              UserBookingStatus.cancelled,
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


  Future<void> createPaymentController({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    BaseApiUtils.post(
      url: ApiUtils.createPayments,
      data: data,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
        Get.off(()=>UserPaymentView(paymentUrl: data["data"]),preventDuplicates: false);
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

  RxList<UserBookingModel> allBookings = <UserBookingModel>[
    // UserBookingModel(
    //   Name: "Party Perfect",
    //   serviceName: "Kids Birthday Party Extravaganza",
    //   days: "5 Days",
    //   price: "300",
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   status: UserBookingStatus.complete,
    // ),
    // UserBookingModel(
    //   vendorName: "Party Perfect",
    //   serviceName: "Kids Birthday Party Extravaganza",
    //   days: "5 Days",
    //   price: "300",
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   status: UserBookingStatus.inProcess,
    // ),
    // UserBookingModel(
    //   vendorName: "Party Perfect",
    //   serviceName: "Kids Birthday Party Extravaganza",
    //   days: "5 Days",
    //   price: "300",
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   status: UserBookingStatus.pending,
    // ),
    // UserBookingModel(
    //   vendorName: "Party Perfect",
    //   serviceName: "Kids Birthday Party Extravaganza",
    //   days: "5 Days",
    //   price: "300",
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   status: UserBookingStatus.inProcess,
    // ),
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


enum UserBookingStatus {all, complete, pending, active, cancelled}


class UserBookingModel {
  final String sid;
  final String plannerSid;
  final String userSid;
  final String plannerName;
  final String serviceName;
  final String days;
  final String price;
  final String startDate;
  final String endDate;
  final String coverImage;
  final UserBookingStatus status;

  UserBookingModel({
    required this.sid,
    required this.plannerSid,
    required this.userSid,
    required this.plannerName,
    required this.serviceName,
    required this.days,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.coverImage,
    required this.status,
  });
}