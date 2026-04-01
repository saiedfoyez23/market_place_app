import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class TasksPage {

  static Widget tasksPage({
    required BuildContext context,
    required PlannerProjectDetailsController plannerProjectDetailsController,
  }) {
    return Obx(()=> plannerProjectDetailsController.plannerMyProfileDetailsResponseModel.value.data?.type == "elite" ?
    CustomScrollView(
      slivers: [

        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20.bpm(context)),
                padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 16.hpm(context)),
                decoration: BoxDecoration(
                  color: ColorUtils.white243,
                  borderRadius: BorderRadius.circular(14.r(context)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textColor: ColorUtils.black48,
                            text: 'Overall Progress',
                          ),
                        ),

                        SpaceHelperWidget.h(10.w(context)),

                        Expanded(
                          child: TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerRight,
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            textColor: ColorUtils.black48,
                            text: "${plannerProjectDetailsController.getAllProjectTaskResponseModel.value.data!.taskList!.where((t) => t.isCompleted).length} of ${plannerProjectDetailsController.getAllProjectTaskResponseModel.value.data!.taskList!.length} tasks completed",
                          ),
                        ),
                      ],
                    ),

                    SpaceHelperWidget.v(10.h(context)),


                    ClipRRect(
                      borderRadius: BorderRadius.circular(2.r(context)),
                      child: LinearProgressIndicator(
                        value: plannerProjectDetailsController.getAllProjectTaskResponseModel.value.data!.taskList!.isEmpty == true ?
                        0 : (plannerProjectDetailsController.getAllProjectTaskResponseModel.value.data!.taskList!.where((t) => t.isCompleted).length / plannerProjectDetailsController.getAllProjectTaskResponseModel.value.data!.taskList!.length),
                        backgroundColor: ColorUtils.white217,
                        minHeight: 8.h(context),
                        valueColor: const AlwaysStoppedAnimation<Color>(ColorUtils.blue96),
                      ),
                    ),

                  ],
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    textColor: ColorUtils.black48,
                    text: "Task Checklist",
                  ),


                  SpaceHelperWidget.h(16.w(context)),



                  ButtonHelperWidget.customIconButtonWidgetAdventPro(
                    context: context,
                    backgroundColor: ColorUtils.blue96,
                    iconSize: 20,
                    height: 40,
                    padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 16.hpm(context)),
                    borderRadius: 8,
                    textColor: ColorUtils.white255,
                    fontWeight: FontWeight.w700,
                    onPressed: () async {
                      TaskAddDialogBoxWidget().showAddTaskDialog(
                        context: context,
                        plannerProjectDetailsController: plannerProjectDetailsController,
                      );
                    },
                    iconPath: ImageUtils.addImage,
                    text: "Add Task",
                  ),

                ],
              ),

              SpaceHelperWidget.v(16.h(context)),



              Container(
                margin: EdgeInsets.only(bottom: 20.bpm(context)),
                padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 16.hpm(context)),
                decoration: BoxDecoration(
                  color: ColorUtils.white243,
                  borderRadius: BorderRadius.circular(14.r(context)),
                ),
                child: plannerProjectDetailsController.getAllProjectTaskResponseModel.value.data?.taskList?.isEmpty == true ?
                Align(
                  alignment: Alignment.center,
                  child: TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.center,
                    textAlign: TextAlign.start,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    textColor: ColorUtils.black48,
                    text: "No Task Available",
                  ),
                ) :
                Column(
                  children: List.generate(plannerProjectDetailsController.getAllProjectTaskResponseModel.value.data!.taskList!.length, (index) {
                    final task = plannerProjectDetailsController.getAllProjectTaskResponseModel.value.data!.taskList![index];
                    return Container(
                          margin: EdgeInsets.only(bottom: 20.bpm(context)),
                          padding: EdgeInsets.symmetric(vertical: 8.vpm(context),horizontal: 12.hpm(context)),
                          decoration: BoxDecoration(
                            color: ColorUtils.white255,
                            borderRadius: BorderRadius.circular(10.r(context)),
                          ),
                          child: Row(
                            children: [

                              Checkbox(
                                value: task.isCompleted,
                                activeColor: Color.fromRGBO(0, 0, 0, 1),
                                onChanged: (value) async {
                                  await plannerProjectDetailsController.isCompleteTaskController(
                                    context: context,
                                    taskId: task.sId,
                                  );
                                },
                              ),

                              Expanded(
                                child: Column(
                                  children: [
                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.centerLeft,
                                      textAlign: TextAlign.start,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      textColor: ColorUtils.black48,
                                      textDecoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                                      text: task.title,
                                    ),
                                    SpaceHelperWidget.v(8.h(context)),
                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.centerLeft,
                                      textAlign: TextAlign.start,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      textColor: ColorUtils.black48,
                                      text: DateFormat('dd MMM yyyy').format(DateTime.parse(task.date)),
                                    ),
                                  ],
                                ),
                              ),

                              ButtonHelperWidget.customButtonWidget(
                                context: context,
                                onPressed: () async {
                                  TaskAddDialogBoxWidget().taskDeleteDialog(
                                    context: context,
                                    taskId: task.sId,
                                    plannerProjectDetailsController: plannerProjectDetailsController,
                                  );
                                },
                                text: "Delete",
                                padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                                alignment: Alignment.centerRight,
                                textColor: ColorUtils.red237,
                                fontWeight: FontWeight.w600,
                                backgroundColor: Colors.transparent,
                              ),


                            ],
                          )
                      );
                  }),
                ),
              ),
            ],
          ),
        ),

      ],
    ) :
    CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [

        SliverFillRemaining(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.center,
                textAlign: TextAlign.center,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                textColor: ColorUtils.black48,
                text: "Access Restricted",
              ),


              SpaceHelperWidget.v(20.h(context)),

              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.center,
                textAlign: TextAlign.center,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textColor: ColorUtils.black48,
                text: "Only subscribed members can see this feature",
              ),

              SpaceHelperWidget.v(20.h(context)),

              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.center,
                textAlign: TextAlign.center,
                fontSize: 21,
                fontWeight: FontWeight.w500,
                textColor: ColorUtils.black48,
                text: "Subscribe now to unlock this feature.",
              ),


            ],
          ),
        )

      ],
    ));
  }


}