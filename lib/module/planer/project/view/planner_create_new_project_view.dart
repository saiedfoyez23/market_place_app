import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerCreateNewProjectView extends StatelessWidget {
  const PlannerCreateNewProjectView({super.key,required this.address,required this.lat,required this.long});

  final double long;
  final double lat;
  final String address;

  @override
  Widget build(BuildContext context) {
    final PlannerCreateNewProjectController plannerCreateNewProjectController = Get.put(
        PlannerCreateNewProjectController(context: context,address: address,long: long,lat: lat));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>PlannerCreateNewProjectPickLocationPlaceView(),preventDuplicates: false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(()=>Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: plannerCreateNewProjectController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>PlannerCreateNewProjectPickLocationPlaceView(),preventDuplicates: false);
                  },
                  title: "Create New Order",
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
                          text: "Event Type",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        CustomDropdownHelperClass(
                          fillColor: ColorUtils.white243,
                          value: plannerCreateNewProjectController.selectEventType.value == "" ? null : plannerCreateNewProjectController.selectEventType.value,
                          items: plannerCreateNewProjectController.eventType,
                          onChanged: (value) {
                            plannerCreateNewProjectController.selectEventType.value = value!;
                          },
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


                        Container(
                          width: 428.w(context),
                          decoration: BoxDecoration(
                            color: ColorUtils.white230,
                            borderRadius: BorderRadius.circular(12.r(context)),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 13.hpm(context)),
                          child: Column(
                            children: [

                              HtmlEditor(
                                controller: plannerCreateNewProjectController.serviceDetailsController.value,
                                htmlEditorOptions: const HtmlEditorOptions(
                                  hint: "Write something...",
                                  autoAdjustHeight: true,
                                ),
                                callbacks: Callbacks(
                                    onFocus: () {
                                      FocusScope.of(context).unfocus();
                                    }
                                ),
                                htmlToolbarOptions: const HtmlToolbarOptions(
                                  toolbarPosition: ToolbarPosition.aboveEditor,
                                  defaultToolbarButtons: [
                                    FontButtons(),
                                    ColorButtons(),
                                    ListButtons(),
                                    ParagraphButtons(),
                                    InsertButtons(),
                                  ],
                                ),
                              ),

                            ],
                          ),
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
                                keyboardType: TextInputType.number,
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


                              // TextHelperClass.headingTextWithoutWidth(
                              //   context: context,
                              //   alignment: Alignment.centerLeft,
                              //   fontSize: 18,
                              //   fontWeight: FontWeight.w500,
                              //   textColor: ColorUtils.black96,
                              //   text: "Program End Date",
                              // ),
                              //
                              // SpaceHelperWidget.v(6.h(context)),
                              //
                              //
                              // TextFormFieldWidget.build(
                              //   context: context,
                              //   fillColor: ColorUtils.white255,
                              //   hintText: "Pick program end date",
                              //   readOnly: true,
                              //   controller: plannerCreateNewProjectController.programEndDateController.value,
                              //   onTap: () async {
                              //     await plannerCreateNewProjectController.pickProgramEndDate(context: context);
                              //   },
                              //   keyboardType: TextInputType.emailAddress,
                              // ),
                              //
                              // SpaceHelperWidget.v(20.h(context)),


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


                              SearchableDropdownOverlay<GetAllUserResponse>(
                                width: MediaQuery.of(context).orientation == Orientation.portrait ?
                                (428 - 68).w(context) : (930 - 68).w(context),
                                value: plannerCreateNewProjectController.selectUser.value,
                                items: plannerCreateNewProjectController.getAllUserResponseModel.value.data!,
                                hintText: "Select planner",
                                itemToString: (v) {
                                  return v.name ?? "Select Planner" ;
                                },
                                itemBuilder: (v) {
                                  return TextHelperClass.headingTextWithoutWidth(
                                    context: context,
                                    alignment: Alignment.centerLeft,
                                    fontSize: 18.sp(context),
                                    textColor: ColorUtils.black48,
                                    fontWeight: FontWeight.w700,
                                    text: v.name,
                                  );
                                },
                                controller: plannerCreateNewProjectController.dropdownController,
                                onChanged: (value) {
                                  plannerCreateNewProjectController.selectUser.value = value!;
                                  FocusScope.of(context).unfocus();
                                  plannerCreateNewProjectController.searchController.value.text = plannerCreateNewProjectController.selectUser.value.name ?? "";
                                  plannerCreateNewProjectController.plannerEmailController.value.text = plannerCreateNewProjectController.selectUser.value.email ?? "";
                                  plannerCreateNewProjectController.plannerPhoneController.value.text = plannerCreateNewProjectController.selectUser.value.contractNumber ?? "";
                                },
                                searchController: plannerCreateNewProjectController.searchController.value,
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
                                readOnly: true,
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
                                readOnly: true,
                                fillColor: ColorUtils.white255,
                                hintText: "Enter client phone",
                                controller: plannerCreateNewProjectController.plannerPhoneController.value,
                                keyboardType: TextInputType.number,
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
                              child: plannerCreateNewProjectController.isSubmit.value == true ?
                              LoadingHelperWidget.loadingHelperWidget(
                                context: context,
                              ) :
                              ButtonHelperWidget.customButtonWidgetAdventPro(
                                context: context,
                                onPressed: () async {
                                  if(plannerCreateNewProjectController.titleController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your email");
                                  } else if(plannerCreateNewProjectController.selectEventType.value == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Select Event Type");
                                  } else if(await plannerCreateNewProjectController.serviceDetailsController.value.getText() == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your service details");
                                  } else if(plannerCreateNewProjectController.eventDetailsController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your event details");
                                  } else if(plannerCreateNewProjectController.deadlineController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your deadline");
                                  } else if(plannerCreateNewProjectController.programStartDateController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your program start date");
                                  } else if(plannerCreateNewProjectController.totalPriceController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your total price");
                                  } else if(plannerCreateNewProjectController.searchController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your planer name");
                                  } else if(plannerCreateNewProjectController.plannerEmailController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your planer email");
                                  } else if(plannerCreateNewProjectController.latitude.value == 0.0 || plannerCreateNewProjectController.longitude.value == 0.0) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Address is Not Pick");
                                  } else if(plannerCreateNewProjectController.plannerOrderLocationController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your planer order location");
                                  } else {
                                    plannerCreateNewProjectController.isSubmit.value = true;
                                    //String html = await vendorCreateNewOrderController.serviceDetailsController.value.getText();
                                    Map<String,dynamic> data = {
                                      "receiver": plannerCreateNewProjectController.selectUser.value.sId,
                                      "title": plannerCreateNewProjectController.titleController.value.text,
                                      "type": plannerCreateNewProjectController.selectEventType.value,
                                      "shortDescription": plannerCreateNewProjectController.eventDetailsController.value.text,
                                      "description": await plannerCreateNewProjectController.serviceDetailsController.value.getText(),
                                      "duration": int.parse(plannerCreateNewProjectController.deadlineController.value.text), // in days
                                      "totalAmount": int.parse(plannerCreateNewProjectController.totalPriceController.value.text),
                                      "startDate": plannerCreateNewProjectController.programStartDateController.value.text,
                                      "longitude": plannerCreateNewProjectController.longitude.value,
                                      "latitude": plannerCreateNewProjectController.latitude.value,
                                      "address": plannerCreateNewProjectController.plannerOrderLocationController.value.text,
                                    };
                                    await plannerCreateNewProjectController.plannerCreateNewOrderController(context: context, data: data);
                                  }
                                },
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
          )),
        ),
      ),
    );
  }
}
