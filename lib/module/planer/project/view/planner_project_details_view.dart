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
                FilesTab(),
                PaymentsTab(),
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

// Files Tab
class FilesTab extends StatelessWidget {
  final PlannerProjectDetailsController plannerProjectDetailsController = Get.put(PlannerProjectDetailsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Project Files', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.upload_file),
                    onPressed: () {},
                  ),
                  SizedBox(width: 8),
                  Text('Upload File'),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: plannerProjectDetailsController.files.length,
            itemBuilder: (context, index) {
              final file = plannerProjectDetailsController.files[index];
              return ListTile(
                leading: Icon(Icons.insert_drive_file, color: Colors.blue),
                title: Text(file.name),
                subtitle: Text('${DateFormat('dd MMM yyyy').format(file.uploadDate)} • ${file.size}'),
                trailing: IconButton(
                  icon: Icon(Icons.download),
                  onPressed: () {},
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}

// Payments Tab
class PaymentsTab extends StatelessWidget {
  final PlannerProjectDetailsController plannerProjectDetailsController = Get.put(PlannerProjectDetailsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Summary Cards
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text('Total Received', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('\$${plannerProjectDetailsController.totalReceived.toStringAsFixed(0)}', style: TextStyle(fontSize: 24, color: Colors.green)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text('Pending Payments', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('\$${plannerProjectDetailsController.totalPending.toStringAsFixed(0)}', style: TextStyle(fontSize: 24, color: Colors.orange)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text('Vendor Payments', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('\$${plannerProjectDetailsController.totalPending.toStringAsFixed(0)}', style: TextStyle(fontSize: 24, color: Colors.green)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text('Total Saved', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('\$${plannerProjectDetailsController.totalPending.toStringAsFixed(0)}', style: TextStyle(fontSize: 24, color: Colors.green)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Payment List
          ...plannerProjectDetailsController.payments.map((payment) => Card(
            margin: EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(payment.source, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: payment.status == 'Paid' ? Colors.green.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(payment.status, style: TextStyle(color: payment.status == 'Paid' ? Colors.green : Colors.orange)),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('Description:', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Text(payment.description),
                  Text('Date:', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Text(DateFormat('dd MMM yyyy').format(payment.date)),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Amount:', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text('\$${payment.amount.toStringAsFixed(2)}'),
                    ],
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[50]),
                      child: Text('Make Payment', style: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    ));
  }
}