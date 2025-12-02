import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';


class PlannerProjectDetailsView extends StatelessWidget {
  PlannerProjectDetailsView({super.key});

  final PlannerProjectDetailsController plannerProjectDetailsController = Get.put(PlannerProjectDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: CustomScrollView(
            physics: NeverScrollableScrollPhysics(),
            slivers: [

              AuthAppBarHelperWidget(
                onBackPressed: () async {
                  Get.off(()=>DashboardPlannerView(index: 1),preventDuplicates: false);
                },
                title: "Order Details",
              ),


              SliverToBoxAdapter(
                child: Column(
                  children: [

                    SpaceHelperWidget.v(16.h(context)),

                    buildTabs(context: context),


                    SpaceHelperWidget.v(16.h(context)),


                  ],
                ),
              ),


              SliverFillRemaining(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      plannerProjectDetailsController.selectedPage.value == PlannerOrderDetailsPage.overview ?
                      Expanded(
                        child: OverViewPage.overViewPage(
                          context: context,
                          plannerProjectDetailsController: plannerProjectDetailsController,
                        ),
                      ) :
                      SizedBox.shrink(),


                      plannerProjectDetailsController.selectedPage.value == PlannerOrderDetailsPage.vendors ?
                      Expanded(
                        child: VendorInformationShowPage.vendorInformationPage(
                          context: context,
                          plannerProjectDetailsController: plannerProjectDetailsController,
                        ),
                      ) :
                      SizedBox.shrink(),

                      plannerProjectDetailsController.selectedPage.value == PlannerOrderDetailsPage.tasks ?
                      Expanded(
                        child: TasksPage.tasksPage(
                          context: context,
                          plannerProjectDetailsController: plannerProjectDetailsController,
                        ),
                      ) :
                      SizedBox.shrink(),



                      plannerProjectDetailsController.selectedPage.value == PlannerOrderDetailsPage.files ?
                      Expanded(
                        child: FilesPage.filesPage(
                          context: context,
                          plannerProjectDetailsController: plannerProjectDetailsController,
                        ),
                      ) :
                      SizedBox.shrink(),


                      plannerProjectDetailsController.selectedPage.value == PlannerOrderDetailsPage.payments ?
                      Expanded(
                        child: PaymentPage.paymentPage(
                          context: context,
                          plannerProjectDetailsController: plannerProjectDetailsController,
                        ),
                      ) :
                      SizedBox.shrink()







                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      )),
    );
  }



  Widget buildTabs({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        tabItem(page: PlannerOrderDetailsPage.overview,title: "Overview",context: context),
        tabItem(page: PlannerOrderDetailsPage.vendors,title: "Vendors",context: context),
        tabItem(page: PlannerOrderDetailsPage.tasks,title: "Tasks",context: context),
        tabItem(page: PlannerOrderDetailsPage.files,title: "Files",context: context),
        tabItem(page: PlannerOrderDetailsPage.payments,title: "Payments",context: context),
      ],
    );
  }

  Widget tabItem({required String title,required PlannerOrderDetailsPage page,required BuildContext context}) {
    bool isSelected = plannerProjectDetailsController.selectedPage.value == page;
    return InkWell(
      onTap: () {
        plannerProjectDetailsController.changeTab(page);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.center,
            textAlign: TextAlign.center,
            fontSize: 17,
            fontWeight: isSelected == true ? FontWeight.w600 : FontWeight.w500,
            textColor: isSelected == true ? ColorUtils.orange119 : ColorUtils.black64,
            text: title,
          ),
          SpaceHelperWidget.v(4.h(context)),
          if (isSelected)
            Container(
              height: 3.h(context),
              width: 20.w(context),
              color: ColorUtils.orange119,
            )
        ],
      ),
    );
  }


}



class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PlannerProjectDetailsController plannerProjectDetailsController = Get.put(PlannerProjectDetailsController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Order Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: 'Overview'),
                Tab(text: 'Vendors'),
                Tab(text: 'Tasks'),
                Tab(text: 'Files'),
                Tab(text: 'Payments'),
              ],
            ),
          ),
          // Tab Bar View
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                TasksTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Tasks Tab
class TasksTab extends StatelessWidget {
  final PlannerProjectDetailsController plannerProjectDetailsController  = Get.put(PlannerProjectDetailsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Overall Progress', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('${plannerProjectDetailsController.tasks.where((t) => t.isCompleted).length} of ${plannerProjectDetailsController.tasks.length} tasks completed'),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: plannerProjectDetailsController.tasks.length,
            itemBuilder: (context, index) {
              final task = plannerProjectDetailsController.tasks[index];
              return Card(
                margin: EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      plannerProjectDetailsController.tasks[index] = PlannerTaskModel(
                        title: task.title,
                        date: task.date,
                        isCompleted: value ?? false,
                      );
                      plannerProjectDetailsController.tasks.refresh();
                    },
                  ),
                  title: Text(task.title),
                  subtitle: Text(DateFormat('dd MMM yyyy').format(task.date)),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      plannerProjectDetailsController.tasks.removeAt(index);
                    },
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('Add Task'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
              Text('Task Checklist', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ],
    ));
  }
}