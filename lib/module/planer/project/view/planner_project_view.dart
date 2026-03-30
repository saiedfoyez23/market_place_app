import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerProjectView extends StatelessWidget {
  PlannerProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    final PlannerProjectController plannerProjectController = Get.put(PlannerProjectController(context: context));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: plannerProjectController.isLoading.value == true ?
          LoadingHelperWidget.loadingHelperWidget(
            context: context,
            height: 930.h(context),
          ) :
          RefreshIndicator(
            onRefresh: () async {
              plannerProjectController.allProjects.clear();
              plannerProjectController.isLoading.value = true;
              Future.delayed(Duration(seconds: 1),() async {
                await plannerProjectController.getAllClientOrderController(context: context);
              });
            },
            child: CustomScrollView(
              slivers: [

                MainPageAppBarHelperWidget(
                  centerTitle: false,
                  title: "Projects",
                  actions: [


                    ButtonHelperWidget.customIconButtonWidgetAdventPro(
                      context: context,
                      backgroundColor: ColorUtils.blue96,
                      textSize: 20,
                      iconSize: 20,
                      height: 40,
                      padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 16.hpm(context)),
                      borderRadius: 8,
                      textColor: ColorUtils.white255,
                      fontWeight: FontWeight.w700,
                      onPressed: () async {
                        Get.off(()=>PlannerCreateNewProjectPickLocationPlaceView(),preventDuplicates: false);
                      },
                      iconPath: ImageUtils.addImage,
                      text: "Create Project",
                    ),

                    SpaceHelperWidget.h(15.w(context)),


                  ],
                ),


                SliverFillRemaining(
                  child: Padding(
                    padding: EdgeInsets.all(16.r(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpaceHelperWidget.v(16.h(context)),

                        buildTabs(context: context,plannerProjectController: plannerProjectController),

                        SpaceHelperWidget.v(26.h(context)),

                        /// PROJECT LIST
                        Expanded(
                          child: Obx(() {
                            return plannerProjectController.filterProjects.isNotEmpty == true ?
                            ListView.builder(
                              itemCount: plannerProjectController.filterProjects.length,
                              itemBuilder: (context, i) {
                                return projectCard(context: context,projectModel: plannerProjectController.filterProjects[i]);
                              },
                            ) :
                            Align(
                              alignment: Alignment.center,
                              child: TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.center,
                                textAlign: TextAlign.start,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                textColor: ColorUtils.black48,
                                text: "No Order Available",
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  // ---------------- TABS -------------------

  /// ------------------------------
  /// TAB BAR
  /// ------------------------------
  Widget buildTabs({
    required BuildContext context,
    required PlannerProjectController plannerProjectController,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        tabItem(status: PlannerProjectStatus.all,title: "All",context: context,plannerProjectController: plannerProjectController),
        tabItem(status: PlannerProjectStatus.active,title: "Active",context: context,plannerProjectController: plannerProjectController),
        tabItem(status: PlannerProjectStatus.complete,title: "Complete",context: context,plannerProjectController: plannerProjectController),
        tabItem(status: PlannerProjectStatus.pending,title: "Pending",context: context,plannerProjectController: plannerProjectController),
        tabItem(status: PlannerProjectStatus.cancelled,title: "Cancelled",context: context,plannerProjectController: plannerProjectController),
      ],
    );
  }

  Widget tabItem({
    required String title,
    required PlannerProjectStatus status,
    required BuildContext context,
    required PlannerProjectController plannerProjectController,
  }) {
    bool isSelected = plannerProjectController.selectedTab.value == status;
    return InkWell(
      onTap: () {
        plannerProjectController.changeTab(status);
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

  // ---------------- PROJECT CARD -------------------

  Widget projectCard({required BuildContext context, required ProjectModel projectModel}) {
    Color badgeColor = Colors.grey;
    Color textColor = Colors.white;
    String text = "";

    switch (projectModel.status) {
      case PlannerProjectStatus.complete:
        badgeColor = ColorUtils.blue173;
        textColor = ColorUtils.blue96;
        text = "Completed";
        break;
      case PlannerProjectStatus.active:
        badgeColor = ColorUtils.green02;
        textColor = ColorUtils.green139;
        text = "Active";
        break;
      case PlannerProjectStatus.pending:
        badgeColor = ColorUtils.yellow249;
        textColor = ColorUtils.yellow95;
        text = "Pending";
        break;
      case PlannerProjectStatus.cancelled:
        badgeColor = ColorUtils.red20;
        textColor = ColorUtils.red202;
        text = "Cancelled";
        break;
      default:
        break;
    }


    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white243,
        border: Border.all(color: ColorUtils.white215,width: .5),
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: Row(
                  children: [

                    ImageHelperWidget.circleImageHelperWidget(
                      width: 32.w(context),
                      height: 32.h(context),
                      verticalPadding: 1.vpm(context),
                      horizontalPadding: 1.hpm(context),
                      backgroundColor: ColorUtils.orange213,
                      radius: 25.r(context),
                      imageAsset: projectModel.userImage == "" ? ImageUtils.noImage : null,
                      imageUrl: projectModel.userImage == "" ? null : projectModel.userImage,
                    ),

                    SpaceHelperWidget.h(12.w(context)),

                    Expanded(
                      child: TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        textAlign: TextAlign.start,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black48,
                        text: projectModel.clientName,
                      ),
                    ),

                  ],
                ),
              ),

              SpaceHelperWidget.h(10.w(context)),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.hpm(context), vertical: 5.vpm(context)),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(100.r(context)),
                ),
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.center,
                  textAlign: TextAlign.center,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: textColor,
                  text: text,
                ),
              ),
            ],
          ),

          SpaceHelperWidget.v(12.h(context)),



          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: projectModel.serviceName,
          ),


          SpaceHelperWidget.v(12.h(context)),


          rowItem(title: "${projectModel.days} Days", value: "From \$${projectModel.budgetTotal.toInt()}",context: context),
          rowItem(title: "Start Date:", value: projectModel.startDate,context: context),
          rowItem(title: "End Date:", value: projectModel.endDate, context: context),
          rowItem(title: "Budget", value: "\$${projectModel.budgetUsed.toInt()} / \$${projectModel.budgetTotal.toInt()}",context: context),


          // Row(
          //   children: [
          //     Expanded(
          //       child: TextHelperClass.headingTextWithoutWidth(
          //         context: context,
          //         alignment: Alignment.centerLeft,
          //         textAlign: TextAlign.start,
          //         fontSize: 17,
          //         fontWeight: FontWeight.w400,
          //         textColor: ColorUtils.black48,
          //         text: "Progress",
          //       ),
          //     ),
          //
          //     SpaceHelperWidget.h(10.w(context)),
          //
          //     Expanded(
          //       child: TextHelperClass.headingTextWithoutWidth(
          //         context: context,
          //         alignment: Alignment.centerRight,
          //         textAlign: TextAlign.start,
          //         fontSize: 17,
          //         fontWeight: FontWeight.w400,
          //         textColor: ColorUtils.black48,
          //         text: "${projectModel.progress}%",
          //       ),
          //     ),
          //   ],
          // ),
          //
          //
          //
          // SpaceHelperWidget.v(7.h(context)),
          //
          //
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(2.r(context)),
          //   child: LinearProgressIndicator(
          //     value: projectModel.progress / 100,
          //     backgroundColor: ColorUtils.white217,
          //     minHeight: 8.h(context),
          //     valueColor: const AlwaysStoppedAnimation<Color>(ColorUtils.blue96),
          //   ),
          // ),
          //

          SpaceHelperWidget.v(15.h(context)),


          text == "Pending" ?
          ButtonHelperWidget.customButtonWidgetAdventPro(
            context: context,
            onPressed: () async {
              Get.off(()=>PlannerOpenOrderDetailsView(orderID: projectModel.sid,isHome: true,),preventDuplicates: false);
            },
            backgroundColor: ColorUtils.red20,
            textColor: ColorUtils.red202,
            text: "Order Details",
          ) :
          ButtonHelperWidget.customButtonWidgetAdventPro(
            context: context,
            onPressed: () async {
              Get.off(()=>PlannerProjectDetailsView(projectId: projectModel.sid,),preventDuplicates: false);
            },
            text: "Open Project",
          ),

        ],
      ),
    );
  }


  Widget rowItem({required String title,required String value,required BuildContext context}) {
    return Column(
      children: [

        Row(
          children: [
            Expanded(
              child: TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                textAlign: TextAlign.start,
                fontSize: 17,
                fontWeight: FontWeight.w400,
                textColor: ColorUtils.black48,
                text: title,
              ),
            ),

            SpaceHelperWidget.h(10.w(context)),

            Expanded(
              child: TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerRight,
                textAlign: TextAlign.start,
                fontSize: 17,
                fontWeight: FontWeight.w400,
                textColor: ColorUtils.black48,
                text: value,
              ),
            ),
          ],
        ),



        SpaceHelperWidget.v(3.h(context)),

        Divider(
          thickness: 1,
          color: ColorUtils.gray194,
        ),

        SpaceHelperWidget.v(7.h(context)),




      ],
    );
  }


}
