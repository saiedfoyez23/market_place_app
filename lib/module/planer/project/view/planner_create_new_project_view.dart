import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerCreateNewProjectView extends StatelessWidget {
  PlannerCreateNewProjectView({super.key});

  final PlannerCreateNewProjectController plannerCreateNewProjectController = Get.put(PlannerCreateNewProjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: CustomScrollView(
            slivers: [

              AuthAppBarHelperWidget(
                onBackPressed: () async {
                  Get.off(()=>DashboardPlannerView(index: 1),preventDuplicates: false);
                },
                title: "Create New Project",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [


                      SpaceHelperWidget.v(16.h(context)),

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "Title",
                      ),

                      SpaceHelperWidget.v(6.h(context)),


                      TextFormFieldWidget.build(
                        context: context,
                        hintText: "Enter title",
                        controller: plannerCreateNewProjectController.titleController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),


                      SpaceHelperWidget.v(20.h(context)),


                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "Event Description",
                      ),

                      SpaceHelperWidget.v(6.h(context)),


                      TextFormFieldWidget.textFiledWithMaxLineBuild(
                        context: context,
                        maxLines: 5,
                        hintText: "Write something ...",
                        controller: plannerCreateNewProjectController.eventDetailsController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),


                      SpaceHelperWidget.v(20.h(context)),

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "Event Details",
                      ),

                      SpaceHelperWidget.v(6.h(context)),


                      TextFormFieldWidget.textFiledWithMaxLineBuild(
                        context: context,
                        maxLines: 5,
                        hintText: "Write something ...",
                        controller: plannerCreateNewProjectController.eventDetailsController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      SpaceHelperWidget.v(20.h(context)),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.hpm(context),vertical: 20.vpm(context)),
                        margin: EdgeInsets.only(bottom: 20.bpm(context)),
                        decoration: BoxDecoration(
                          color: ColorUtils.white243,
                          borderRadius: BorderRadius.circular(12.r(context)),
                        ),
                        child: Column(
                          children: [

                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              textColor: ColorUtils.black64,
                              text: "Order Information",
                            ),


                            SpaceHelperWidget.v(20.h(context)),


                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black96,
                              text: "Deadline",
                            ),

                            SpaceHelperWidget.v(6.h(context)),


                            TextFormFieldWidget.build(
                              context: context,
                              fillColor: ColorUtils.white255,
                              hintText: "Enter deadline",
                              controller: plannerCreateNewProjectController.deadlineController.value,
                              keyboardType: TextInputType.emailAddress,
                            ),


                            SpaceHelperWidget.v(20.h(context)),


                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black96,
                              text: "Program Start Date",
                            ),

                            SpaceHelperWidget.v(6.h(context)),


                            TextFormFieldWidget.build(
                              context: context,
                              fillColor: ColorUtils.white255,
                              hintText: "Pick program start date",
                              readOnly: true,
                              controller: plannerCreateNewProjectController.programStartDateController.value,
                              onTap: () async {
                                await plannerCreateNewProjectController.pickProgramStartDate(context: context);
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),


                            SpaceHelperWidget.v(20.h(context)),


                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black96,
                              text: "Program End Date",
                            ),

                            SpaceHelperWidget.v(6.h(context)),


                            TextFormFieldWidget.build(
                              context: context,
                              fillColor: ColorUtils.white255,
                              hintText: "Pick program end date",
                              readOnly: true,
                              controller: plannerCreateNewProjectController.programEndDateController.value,
                              onTap: () async {
                                await plannerCreateNewProjectController.pickProgramEndDate(context: context);
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),

                            SpaceHelperWidget.v(20.h(context)),


                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black96,
                              text: "Total Price",
                            ),

                            SpaceHelperWidget.v(6.h(context)),


                            TextFormFieldWidget.build(
                              context: context,
                              fillColor: ColorUtils.white255,
                              hintText: "Enter total price",
                              controller: plannerCreateNewProjectController.totalPriceController.value,
                              keyboardType: TextInputType.number,
                            ),






                          ],
                        ),
                      ),



                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.hpm(context),vertical: 20.vpm(context)),
                        margin: EdgeInsets.only(bottom: 20.bpm(context)),
                        decoration: BoxDecoration(
                          color: ColorUtils.white243,
                          borderRadius: BorderRadius.circular(12.r(context)),
                        ),
                        child: Column(
                          children: [

                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              textColor: ColorUtils.black64,
                              text: "Client Information",
                            ),


                            SpaceHelperWidget.v(20.h(context)),

                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black96,
                              text: "Name",
                            ),

                            SpaceHelperWidget.v(6.h(context)),


                            TextFormFieldWidget.build(
                              context: context,
                              fillColor: ColorUtils.white255,
                              hintText: "Enter client name",
                              controller: plannerCreateNewProjectController.plannerNameController.value,
                              keyboardType: TextInputType.emailAddress,
                            ),


                            SpaceHelperWidget.v(20.h(context)),


                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black96,
                              text: "Email",
                            ),

                            SpaceHelperWidget.v(6.h(context)),

                            TextFormFieldWidget.build(
                              context: context,
                              fillColor: ColorUtils.white255,
                              hintText: "Enter client email",
                              controller: plannerCreateNewProjectController.plannerEmailController.value,
                              keyboardType: TextInputType.emailAddress,
                            ),


                            SpaceHelperWidget.v(20.h(context)),


                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black96,
                              text: "Phone",
                            ),

                            SpaceHelperWidget.v(6.h(context)),


                            TextFormFieldWidget.build(
                              context: context,
                              fillColor: ColorUtils.white255,
                              hintText: "Enter client phone",
                              controller: plannerCreateNewProjectController.plannerPhoneController.value,
                              keyboardType: TextInputType.emailAddress,
                            ),

                            SpaceHelperWidget.v(20.h(context)),


                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black96,
                              text: "Order Location",
                            ),

                            SpaceHelperWidget.v(6.h(context)),


                            TextFormFieldWidget.build(
                              context: context,
                              fillColor: ColorUtils.white255,
                              hintText: "Enter client location",
                              controller: plannerCreateNewProjectController.plannerOrderLocationController.value,
                              keyboardType: TextInputType.number,
                            ),






                          ],
                        ),
                      ),



                      SpaceHelperWidget.v(24.h(context)),

                      Row(
                        children: [

                          Expanded(
                            child: ButtonHelperWidget.customButtonWidgetAdventPro(
                              context: context,
                              onPressed: () async {
                                Get.off(()=>DashboardPlannerView(index: 1),preventDuplicates: false);
                              },
                              text: "Cancel",
                              textColor: ColorUtils.red202,
                              backgroundColor: ColorUtils.red9,
                            ),
                          ),

                          SpaceHelperWidget.h(16.w(context)),

                          Expanded(
                            child: ButtonHelperWidget.customButtonWidgetAdventPro(
                              context: context,
                              onPressed: () async {},
                              text: "Create Project",
                            ),
                          ),

                        ],
                      ),


                      SpaceHelperWidget.v(20.h(context)),


                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
