import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class VendorCreateNewOrderView extends StatelessWidget {
  VendorCreateNewOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorCreateNewOrderController vendorCreateNewOrderController = Get.put(VendorCreateNewOrderController(context: context));
    return Scaffold(
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
                  Get.off(()=>DashboardVendorView(index: 2),preventDuplicates: false);
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
                        text: "Service Details",
                      ),

                      SpaceHelperWidget.v(6.h(context)),


                      Container(
                        width: 428.w(context),
                        decoration: BoxDecoration(
                            color: ColorUtils.white230,
                            borderRadius: BorderRadius.circular(12.r(context))
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
                              text: "Search Name",
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
                              text: "Phone",
                            ),

                            SpaceHelperWidget.v(6.h(context)),


                            TextFormFieldWidget.build(
                              context: context,
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
                                Get.off(()=>DashboardVendorView(index: 2),preventDuplicates: false);
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
                              onPressed: () async {
                                String html = await vendorCreateNewOrderController.serviceDetailsController.value.getText();
                                print(html);
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
    );
  }
}
