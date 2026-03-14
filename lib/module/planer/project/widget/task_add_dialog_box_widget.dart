import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class TaskAddDialogBoxWidget {

  void showAddTaskDialog({
    required BuildContext context,
    required PlannerProjectDetailsController plannerProjectDetailsController,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true, // important
      builder: (context) {
        return Obx(()=>Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.hpm(context),vertical: 20.vpm(context)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r(context)),
          ),
          backgroundColor: ColorUtils.white255,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.hpm(context),vertical: 15.vpm(context)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                      child: Column(
                        children: [

                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            textAlign: TextAlign.start,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            textColor: ColorUtils.black64,
                            text: "Add Task",
                          ),

                          SpaceHelperWidget.v(10.h(context)),

                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            textAlign: TextAlign.start,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            textColor: ColorUtils.black113,
                            text: "Create a new task for this project.",
                          ),


                          SpaceHelperWidget.v(20.h(context)),

                        ],
                      ),
                    ),

                    SpaceHelperWidget.h(10.w(context)),

                    InkWell(
                      onTap: () async {
                        plannerProjectDetailsController.taskNameController.value.clear();
                        plannerProjectDetailsController.taskDateController.value.clear();
                        Get.back();
                      },
                      child: ImageHelperWidget.assetImageWidget(
                        context: context,
                        height: 40.h(context),
                        width: 40.w(context),
                        imageString: ImageUtils.dialogCloseImage,
                      ),
                    ),


                  ],
                ),

                SpaceHelperWidget.v(10.h(context)),

                /// Task Name
                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black96,
                  text: "Task Name",
                ),

                SpaceHelperWidget.v(6.h(context)),


                TextFormFieldWidget.build(
                  context: context,
                  fillColor: ColorUtils.white243,
                  hintText: "Enter Task Name",
                  controller: plannerProjectDetailsController.taskNameController.value,
                  keyboardType: TextInputType.text,
                ),

                SpaceHelperWidget.v(10.h(context)),


                /// Date

                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black96,
                  text: "Date",
                ),

                SpaceHelperWidget.v(6.h(context)),


                TextFormFieldWidget.build(
                  context: context,
                  fillColor: ColorUtils.white243,
                  hintText: "Enter Date",
                  readOnly: true,
                  onTap: () {
                    plannerProjectDetailsController.taskDatePicker(context: context);
                  },
                  controller: plannerProjectDetailsController.taskDateController.value,
                  keyboardType: TextInputType.text,
                ),

                SpaceHelperWidget.v(20.h(context)),


                /// Buttons
                Row(
                  children: [


                    Expanded(
                      child: ButtonHelperWidget.customButtonWidget(
                        context: context,
                        onPressed: () async {
                          plannerProjectDetailsController.taskNameController.value.clear();
                          plannerProjectDetailsController.taskDateController.value.clear();
                          Get.back();
                        },
                        text: "Cancel",
                        textColor: ColorUtils.blue96,
                        backgroundColor: ColorUtils.blue206,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SpaceHelperWidget.h(16.w(context)),

                    Expanded(
                      child: plannerProjectDetailsController.isTaskCreate.value == true ?
                      LoadingHelperWidget.loadingHelperWidget(context: context) :
                      ButtonHelperWidget.customButtonWidget(
                        context: context,
                        onPressed: () async {
                          if(plannerProjectDetailsController.taskNameController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter task name");
                          } else if(plannerProjectDetailsController.taskDateController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter task date");
                          } else {
                            Map<String,dynamic> data = {
                              "project": plannerProjectDetailsController.plannerGetProjectDetailsResponseModel.value.data?.sId,
                              "title": plannerProjectDetailsController.taskNameController.value.text,
                              "date": plannerProjectDetailsController.taskDateController.value.text
                            };
                            print(jsonEncode(data));
                            plannerProjectDetailsController.isTaskCreate.value = true;
                            await plannerProjectDetailsController.createTaskController(context: context, data: data);
                          }
                        },
                        text: "Add Task",
                        fontWeight: FontWeight.w500,
                      ),
                    ),


                  ],
                ),
              ],
            ),
          ),
        ));
      },
    );
  }


  void taskDeleteDialog({
    required BuildContext context,
    required String taskId,
    required PlannerProjectDetailsController plannerProjectDetailsController,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap a button
      builder: (context) {
        return Obx(()=>Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r(context)),
          ),
          child: IntrinsicHeight(
            child: Container(
              width: 428.w(context),
              decoration: BoxDecoration(
                color: ColorUtils.white255,
                borderRadius: BorderRadius.circular(20.r(context)),
              ),
              padding: EdgeInsets.fromLTRB(
                16.lpm(context),
                20.tpm(context),
                16.rpm(context),
                20.bpm(context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// ===== Title Text =====

                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.center,
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    textColor: ColorUtils.black21,
                    text: "Are you sure you want to delete this task? ",
                  ),


                  SpaceHelperWidget.v(32.h(context)),


                  /// ===== Buttons Row =====
                  Row(
                    children: [
                      /// No Button

                      Expanded(
                        child: ButtonHelperWidget.customButtonWidget(
                          context: context,
                          onPressed: () async {
                            Get.back();
                          },
                          text: "No",
                          borderRadius: 40,
                          backgroundColor: ColorUtils.white243,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.black89,
                          fontSize: 20,
                        ),
                      ),


                      SpaceHelperWidget.h(10.w(context)),


                      Expanded(
                        child: plannerProjectDetailsController.isTaskDelete.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(
                          context: context,
                        ) :
                        ButtonHelperWidget.customButtonWidget(
                          context: context,
                          onPressed: () async {
                            plannerProjectDetailsController.isTaskDelete.value = true;
                            await plannerProjectDetailsController.deleteTaskController(context: context, taskId: taskId);
                          },
                          text: "Delete",
                          borderRadius: 40,
                          backgroundColor: ColorUtils.red191,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.white255,
                          fontSize: 20,
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        ));
      },
    );
  }


}