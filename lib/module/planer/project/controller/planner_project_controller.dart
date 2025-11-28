import 'package:get/get.dart';

class PlannerProjectController extends GetxController {


  RxList<ProjectModel> allProjects = <ProjectModel>[
    ProjectModel(
      title: "Kids Birthday Party Extravaganza",
      status: PlannerProjectStatus.complete,
      days: 5,
      budgetUsed: 300,
      budgetTotal: 300,
      progress: 100,
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      userImage: "https://i.pravatar.cc/150?img=3",
    ),
    ProjectModel(
      title: "Kids Birthday Party Extravaganza",
      status: PlannerProjectStatus.complete,
      days: 5,
      budgetUsed: 300,
      budgetTotal: 300,
      progress: 100,
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      userImage: "https://i.pravatar.cc/150?img=3",
    ),
    ProjectModel(
      title: "Kids Birthday Party Extravaganza",
      status: PlannerProjectStatus.cancelled,
      days: 5,
      budgetUsed: 300,
      budgetTotal: 300,
      progress: 100,
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      userImage: "https://i.pravatar.cc/150?img=3",
    ),
    ProjectModel(
      title: "Kids Birthday Party Extravaganza",
      status: PlannerProjectStatus.active,
      days: 5,
      budgetUsed: 150,
      budgetTotal: 300,
      progress: 70,
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      userImage: "https://i.pravatar.cc/150?img=4",
    ),
    ProjectModel(
      title: "Kids Birthday Party Extravaganza",
      status: PlannerProjectStatus.pending,
      days: 5,
      budgetUsed: 0,
      budgetTotal: 0,
      progress: 0,
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      userImage: "https://i.pravatar.cc/150?img=5",
    ),
    ProjectModel(
      title: "Kids Birthday Party Extravaganza",
      status: PlannerProjectStatus.cancelled,
      days: 5,
      budgetUsed: 150,
      budgetTotal: 300,
      progress: 20,
      startDate: "28 Oct 2025",
      endDate: "02 Nov 2025",
      userImage: "https://i.pravatar.cc/150?img=6",
    ),
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
  final String title;
  final PlannerProjectStatus status;
  final int days;
  final double budgetUsed;
  final double budgetTotal;
  final int progress;
  final String startDate;
  final String endDate;
  final String userImage;

  ProjectModel({
    required this.title,
    required this.status,
    required this.days,
    required this.budgetUsed,
    required this.budgetTotal,
    required this.progress,
    required this.startDate,
    required this.endDate,
    required this.userImage,
  });
}