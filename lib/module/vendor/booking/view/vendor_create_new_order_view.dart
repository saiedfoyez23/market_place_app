import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:marketplaceapp/module/vendor/booking/view/vendor_create_order_pick_location_place_view.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class VendorCreateNewOrderView extends StatelessWidget {
  VendorCreateNewOrderView({super.key,required this.long,required this.lat,required this.address});

  final double long;
  final double lat;
  final String address;

  @override
  Widget build(BuildContext context) {
    final VendorCreateNewOrderController vendorCreateNewOrderController = Get.put(
        VendorCreateNewOrderController(context: context, long: long, lat: lat, address: address));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>VendorCreateOrderPickLocationPlaceView(),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: vendorCreateNewOrderController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>VendorCreateOrderPickLocationPlaceView(),preventDuplicates: false);
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
                          controller: vendorCreateNewOrderController.titleController.value,
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
                          value: vendorCreateNewOrderController.selectEventType.value == "" ? null : vendorCreateNewOrderController.selectEventType.value,
                          items: vendorCreateNewOrderController.eventType,
                          onChanged: (value) {
                            vendorCreateNewOrderController.selectEventType.value = value!;
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
                          controller: vendorCreateNewOrderController.eventDetailsController.value,
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
                                controller: vendorCreateNewOrderController.serviceDetailsController.value,
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
                                controller: vendorCreateNewOrderController.deadlineController.value,
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
                                controller: vendorCreateNewOrderController.programStartDateController.value,
                                onTap: () async {
                                  await vendorCreateNewOrderController.pickProgramStartDate(context: context);
                                },
                                keyboardType: TextInputType.emailAddress,
                              ),


                              // SpaceHelperWidget.v(20.h(context)),
                              //
                              //
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
                              //   controller: vendorCreateNewOrderController.programEndDateController.value,
                              //   onTap: () async {
                              //     await vendorCreateNewOrderController.pickProgramEndDate(context: context);
                              //   },
                              //   keyboardType: TextInputType.emailAddress,
                              // ),

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
                                controller: vendorCreateNewOrderController.totalPriceController.value,
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
                                text: "Planer Information",
                              ),


                              SpaceHelperWidget.v(20.h(context)),

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black96,
                                text: "Planer Name",
                              ),

                              SpaceHelperWidget.v(6.h(context)),

                              SearchableDropdownOverlay<GetAllPlannerResponse>(
                                width: MediaQuery.of(context).orientation == Orientation.portrait ?
                                (428 - 68).w(context) : (930 - 68).w(context),
                                value: vendorCreateNewOrderController.selectUser.value,
                                items: vendorCreateNewOrderController.getAllPlannerResponseModel.value.data!,
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
                                controller: vendorCreateNewOrderController.dropdownController,
                                onChanged: (value) {
                                  vendorCreateNewOrderController.selectUser.value = value!;
                                  FocusScope.of(context).unfocus();
                                  vendorCreateNewOrderController.searchController.value.text = vendorCreateNewOrderController.selectUser.value.name ?? "";
                                  vendorCreateNewOrderController.plannerEmailController.value.text = vendorCreateNewOrderController.selectUser.value.email ?? "";
                                  vendorCreateNewOrderController.plannerPhoneController.value.text = vendorCreateNewOrderController.selectUser.value.contractNumber ?? "";
                                },
                                searchController: vendorCreateNewOrderController.searchController.value,
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
                                hintText: "Enter planner email",
                                controller: vendorCreateNewOrderController.plannerEmailController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),


                              SpaceHelperWidget.v(20.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black96,
                                text: "Phone (Optional)",
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              TextFormFieldWidget.build(
                                context: context,
                                readOnly: true,
                                fillColor: ColorUtils.white255,
                                hintText: "Enter planner phone",
                                controller: vendorCreateNewOrderController.plannerPhoneController.value,
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
                                hintText: "Enter order location",
                                controller: vendorCreateNewOrderController.plannerOrderLocationController.value,
                                keyboardType: TextInputType.emailAddress,
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
                                  Get.off(()=>DashboardVendorView(index: 2),preventDuplicates: false);
                                },
                                text: "Cancel",
                                textColor: ColorUtils.red202,
                                backgroundColor: ColorUtils.red9,
                              ),
                            ),

                            SpaceHelperWidget.h(16.w(context)),

                            Expanded(
                              child: vendorCreateNewOrderController.isSubmit.value == true ?
                              LoadingHelperWidget.loadingHelperWidget(
                                context: context,
                              ) :
                              ButtonHelperWidget.customButtonWidgetAdventPro(
                                context: context,
                                onPressed: () async {
                                  if(vendorCreateNewOrderController.titleController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your email");
                                  } else if(vendorCreateNewOrderController.selectEventType.value == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Select Event Type");
                                  } else if(await vendorCreateNewOrderController.serviceDetailsController.value.getText() == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your service details");
                                  } else if(vendorCreateNewOrderController.eventDetailsController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your event details");
                                  } else if(vendorCreateNewOrderController.deadlineController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your deadline");
                                  } else if(vendorCreateNewOrderController.programStartDateController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your program start date");
                                  } else if(vendorCreateNewOrderController.totalPriceController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your total price");
                                  } else if(vendorCreateNewOrderController.searchController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your planer name");
                                  } else if(vendorCreateNewOrderController.plannerEmailController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your planer email");
                                  } else if(vendorCreateNewOrderController.latitude.value == 0.0 || vendorCreateNewOrderController.longitude.value == 0.0) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Address is Not Pick");
                                  } else if(vendorCreateNewOrderController.plannerOrderLocationController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your planer order location");
                                  } else {
                                    //String html = await vendorCreateNewOrderController.serviceDetailsController.value.getText();
                                    Map<String,dynamic> data = {
                                      "receiver": vendorCreateNewOrderController.selectUser.value.sId,
                                      "title": vendorCreateNewOrderController.titleController.value.text,
                                      "type": vendorCreateNewOrderController.selectEventType.value,
                                      "shortDescription": vendorCreateNewOrderController.eventDetailsController.value.text,
                                      "description": await vendorCreateNewOrderController.serviceDetailsController.value.getText(),
                                      "duration": int.parse(vendorCreateNewOrderController.deadlineController.value.text), // in days
                                      "totalAmount": int.parse(vendorCreateNewOrderController.totalPriceController.value.text),
                                      "startDate": vendorCreateNewOrderController.programStartDateController.value.text,
                                      "longitude": vendorCreateNewOrderController.longitude.value,
                                      "latitude": vendorCreateNewOrderController.latitude.value,
                                      "address": vendorCreateNewOrderController.plannerOrderLocationController.value.text,
                                    };
                                    print(data);
                                    await vendorCreateNewOrderController.createNewOrderController(context: context, data: data);
                                  }
                                },
                                text: "Send Offer",
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
        )),
      ),
    );
  }
}
