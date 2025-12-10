import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class TasksPage {

  static Widget tasksPage({
    required BuildContext context,
    required PlannerProjectDetailsController plannerProjectDetailsController,
  }) {
    return CustomScrollView(
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
                            text: "${plannerProjectDetailsController.tasks.where((t) => t.isCompleted).length} of ${plannerProjectDetailsController.tasks.length} tasks completed",
                          ),
                        ),
                      ],
                    ),

                    SpaceHelperWidget.v(10.h(context)),


                    ClipRRect(
                      borderRadius: BorderRadius.circular(2.r(context)),
                      child: LinearProgressIndicator(
                        value: (plannerProjectDetailsController.tasks.where((t) => t.isCompleted).length / plannerProjectDetailsController.tasks.length),
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
                    textSize: 24,
                    iconSize: 20,
                    height: 40,
                    padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 16.hpm(context)),
                    borderRadius: 8,
                    textColor: ColorUtils.white255,
                    fontWeight: FontWeight.w700,
                    onPressed: () async {
                      await plannerProjectDetailsController.pickFile();
                    },
                    iconPath: ImageUtils.uploadIconImage,
                    text: "Add",
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
                child: Column(
                    children: List.generate(plannerProjectDetailsController.tasks.length, (index) {
                      final task = plannerProjectDetailsController.tasks[index];
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
                              onChanged: (value) {
                                plannerProjectDetailsController.tasks[index] = PlannerTaskModel(
                                  title: task.title,
                                  date: task.date,
                                  isCompleted: value ?? false,
                                );
                                plannerProjectDetailsController.tasks.refresh();
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
                                    text: DateFormat('dd MMM yyyy').format(task.date),
                                  ),
                                ],
                              ),
                            ),

                            ButtonHelperWidget.customButtonWidget(
                              context: context,
                              onPressed: () async {
                                plannerProjectDetailsController.tasks.removeAt(index);
                              },
                              text: "Delete",
                              padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                              alignment: Alignment.centerRight,
                              textColor: ColorUtils.red237,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              backgroundColor: Colors.transparent,
                            ),


                          ],
                        )
                      );
                    })
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }


}