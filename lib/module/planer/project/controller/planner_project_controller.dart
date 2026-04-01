import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';

class PlannerProjectController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<PlannerGetAllClientOrderResponseModel> plannerGetAllClientOrderResponseModel = PlannerGetAllClientOrderResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  BuildContext context;
  PlannerProjectController({required this.context});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAllClientOrderController(context: context);
    });
  }

  Future<void> getAllClientOrderController({
    required BuildContext context,
  }) async {

    BaseApiUtils.get(
      url: ApiUtils.getPlannerAllClientOrder,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        plannerGetAllClientOrderResponseModel.value = PlannerGetAllClientOrderResponseModel.fromJson(data);
        plannerGetAllClientOrderResponseModel.value.data?.forEach((value) {
          if (value.status == "denied") {
            return;
          }
          allProjects.add(
            ProjectModel(
              sid: value.sId ?? "",
              clientName: value.receiver?.name ?? "",
              serviceName: value.title ?? "",
              days: int.parse(value.duration.toString()),
              budgetUsed: value.pendingAmount.toString() == "0" ? double.parse(value.totalAmount.toString()) : double.parse(value.pendingAmount.toString()),
              budgetTotal: double.parse(value.totalAmount.toString()),
              startDate: "${DateFormat("dd MMM yyyy").format(DateTime.parse(value.startDate))}",
              endDate: "${DateFormat("dd MMM yyyy").format(DateTime.parse(value.endDate))}",
              status: value.status == "completed" ? PlannerProjectStatus.complete :
              value.status == "pending" ? PlannerProjectStatus.pending :
              value.status == "cancelled" ?PlannerProjectStatus.cancelled :
              PlannerProjectStatus.active,
              userImage: value.receiver?.photoUrl ?? "",
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


  RxList<ProjectModel> allProjects = <ProjectModel>[
    // ProjectModel(
    //   title: "Kids Birthday Party Extravaganza",
    //   status: PlannerProjectStatus.complete,
    //   days: 5,
    //   budgetUsed: 300,
    //   budgetTotal: 300,
    //   progress: 100,
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   userImage: "https://i.pravatar.cc/150?img=3",
    // ),
    // ProjectModel(
    //   title: "Kids Birthday Party Extravaganza",
    //   status: PlannerProjectStatus.complete,
    //   days: 5,
    //   budgetUsed: 300,
    //   budgetTotal: 300,
    //   progress: 100,
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   userImage: "https://i.pravatar.cc/150?img=3",
    // ),
    // ProjectModel(
    //   title: "Kids Birthday Party Extravaganza",
    //   status: PlannerProjectStatus.cancelled,
    //   days: 5,
    //   budgetUsed: 300,
    //   budgetTotal: 300,
    //   progress: 100,
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   userImage: "https://i.pravatar.cc/150?img=3",
    // ),
    // ProjectModel(
    //   title: "Kids Birthday Party Extravaganza",
    //   status: PlannerProjectStatus.active,
    //   days: 5,
    //   budgetUsed: 150,
    //   budgetTotal: 300,
    //   progress: 70,
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   userImage: "https://i.pravatar.cc/150?img=4",
    // ),
    // ProjectModel(
    //   title: "Kids Birthday Party Extravaganza",
    //   status: PlannerProjectStatus.pending,
    //   days: 5,
    //   budgetUsed: 0,
    //   budgetTotal: 0,
    //   progress: 0,
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   userImage: "https://i.pravatar.cc/150?img=5",
    // ),
    // ProjectModel(
    //   title: "Kids Birthday Party Extravaganza",
    //   status: PlannerProjectStatus.cancelled,
    //   days: 5,
    //   budgetUsed: 150,
    //   budgetTotal: 300,
    //   progress: 20,
    //   startDate: "28 Oct 2025",
    //   endDate: "02 Nov 2025",
    //   userImage: "https://i.pravatar.cc/150?img=6",
    // ),
  ].obs;

  List<String> tabs = ["All", "Active", "Completed", "Pending", "Cancelled"];

  Rx<PlannerProjectStatus> selectedTab = PlannerProjectStatus.all.obs;

  RxList<ProjectModel> get filterProjects {
    if (selectedTab.value == PlannerProjectStatus.all) {
      return allProjects;
    }
    return allProjects
        .where((b) => b.status == selectedTab.value)
        .toList().obs;
  }


  void changeTab(PlannerProjectStatus status) {
    selectedTab.value = status;
  }



}

enum PlannerProjectStatus { all, active, complete, pending, cancelled }


class ProjectModel {
  final String sid;
  final String serviceName;
  final String clientName;
  final PlannerProjectStatus status;
  final int days;
  final double budgetUsed;
  final double budgetTotal;
  final String startDate;
  final String endDate;
  final String userImage;


  ProjectModel({
    required this.sid,
    required this.serviceName,
    required this.clientName,
    required this.status,
    required this.days,
    required this.budgetUsed,
    required this.budgetTotal,
    required this.startDate,
    required this.endDate,
    required this.userImage,
  });
}