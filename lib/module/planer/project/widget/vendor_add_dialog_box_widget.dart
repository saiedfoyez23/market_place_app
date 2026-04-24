import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorAddDialogBoxWidget {


  void showAddVendorOrderDialog({
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
          child: SingleChildScrollView(
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
                              text: "Add Vendor",
                            ),
            
                            SpaceHelperWidget.v(10.h(context)),
            
                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              textAlign: TextAlign.start,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black113,
                              text: "Add a new vendor to this project.",
                            ),
            
            
                            SpaceHelperWidget.v(20.h(context)),
            
                          ],
                        ),
                      ),
            
                      SpaceHelperWidget.h(10.w(context)),
            
                      InkWell(
                        onTap: () async {
                          plannerProjectDetailsController.selectCategory.value = <CategoryResponseData>[].obs;
                          plannerProjectDetailsController.selectCategoryString.value = <String>[].obs;
                          plannerProjectDetailsController.plannerGetAllVendorOrderResponse.value = PlannerGetAllVendorOrderResponse();
                          plannerProjectDetailsController.isVendorAdd.value = false;
                          plannerProjectDetailsController.noteController.value.clear();
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
            
            
                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    textColor: ColorUtils.black96,
                    text: "Select Vendor Order",
                  ),
            
                  SpaceHelperWidget.v(10.h(context)),
            
            
                  CustomDropdownHelperClass<PlannerGetAllVendorOrderResponse>(
                    value: plannerProjectDetailsController.plannerGetAllVendorOrderResponse.value.sId == null ? null : plannerProjectDetailsController.plannerGetAllVendorOrderResponse.value,
                    items: plannerProjectDetailsController.plannerGetAllVendorOrderResponseModel.value.data!.where((value)=>value.isAssigned == false && value.status != "denied").toList(),
                    itemBuilder: (value) {
                      return TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black48,
                        text: "${value.title}",
                      );
                    },
                    fillColor: ColorUtils.white243,
                    onChanged: (value) {
                      plannerProjectDetailsController.plannerGetAllVendorOrderResponse.value = value!;
                    },
                  ),
            
                  SpaceHelperWidget.v(20.h(context)),
            
            
                  plannerProjectDetailsController.categoryResponseModel.value.data != null ?
                  Column(
                    children: [
            
            
                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "Category",
                      ),
            
                      SpaceHelperWidget.v(10.h(context)),
            
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          runSpacing: 10.h(context),
                          spacing: 10.w(context),
                          children: List.generate(plannerProjectDetailsController.categoryResponseModel.value.data!.length, (index) {
                            return Obx(()=>IntrinsicWidth(
                              child: ButtonHelperWidget.customButtonWidget(
                                context: context,
                                height: 56.h(context),
                                padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                backgroundColor: plannerProjectDetailsController.selectCategory.where((value)=>value == plannerProjectDetailsController.categoryResponseModel.value.data![index]).isEmpty == true ?
                                ColorUtils.white243 :
                                plannerProjectDetailsController.selectCategory.where((value)=> value == plannerProjectDetailsController.categoryResponseModel.value.data![index]).first == plannerProjectDetailsController.categoryResponseModel.value.data![index] ?
                                ColorUtils.orange119 :
                                ColorUtils.white243,
                                textColor: plannerProjectDetailsController.selectCategory.where((value)=>value == plannerProjectDetailsController.categoryResponseModel.value.data![index]).isEmpty == true ?
                                ColorUtils.black89 :
                                plannerProjectDetailsController.selectCategory.where((value)=>value == plannerProjectDetailsController.categoryResponseModel.value.data![index]).first == plannerProjectDetailsController.categoryResponseModel.value.data![index] ?
                                ColorUtils.white255 :
                                ColorUtils.black89,
                                fontWeight: FontWeight.w500,
                                onPressed: () async {
                                  if(plannerProjectDetailsController.selectCategory.contains(plannerProjectDetailsController.categoryResponseModel.value.data![index]) == true) {
                                    plannerProjectDetailsController.selectCategory.remove(plannerProjectDetailsController.categoryResponseModel.value.data![index]);
                                    plannerProjectDetailsController.selectCategoryString.remove(plannerProjectDetailsController.categoryResponseModel.value.data![index].title);
                                  } else {
                                    plannerProjectDetailsController.selectCategory.add(plannerProjectDetailsController.categoryResponseModel.value.data![index]);
                                    plannerProjectDetailsController.selectCategoryString.add(plannerProjectDetailsController.categoryResponseModel.value.data![index].title);
                                  }
                                },
                                text: plannerProjectDetailsController.categoryResponseModel.value.data?[index].title ?? "",
                              ),
                            ));
                          }),
                        ),
                      ),
            
                    ],
                  ) :
                  SizedBox.shrink(),
            
                  SpaceHelperWidget.v(20.h(context)),
            
            
            
                  /// Date
            
                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    textColor: ColorUtils.black96,
                    text: "Note",
                  ),
            
                  SpaceHelperWidget.v(6.h(context)),
            
            
                  TextFormFieldWidget.textFiledWithMaxLineBuild(
                    context: context,
                    fillColor: ColorUtils.white243,
                    hintText: "Write something ...",
                    maxLines: 5,
                    controller: plannerProjectDetailsController.noteController.value,
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
                            plannerProjectDetailsController.selectCategory.value = <CategoryResponseData>[].obs;
                            plannerProjectDetailsController.selectCategoryString.value = <String>[].obs;
                            plannerProjectDetailsController.plannerGetAllVendorOrderResponse.value = PlannerGetAllVendorOrderResponse();
                            plannerProjectDetailsController.isVendorAdd.value = false;
                            plannerProjectDetailsController.noteController.value.clear();
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
                        child: plannerProjectDetailsController.isVendorAdd.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(context: context) :
                        ButtonHelperWidget.customButtonWidget(
                          context: context,
                          onPressed: () async {
                            if(plannerProjectDetailsController.plannerGetAllVendorOrderResponse.value.sId == null) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please select vendor order");
                            } else if(plannerProjectDetailsController.selectCategoryString.isEmpty == true) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please select category");
                            } else {
                              plannerProjectDetailsController.isVendorAdd.value = true;
                              Map<String,dynamic> data = {
                                "project": plannerProjectDetailsController.plannerGetProjectDetailsResponseModel.value.data?.sId,
                                "vendorOrder": plannerProjectDetailsController.plannerGetAllVendorOrderResponse.value.sId,
                                "serviceType": plannerProjectDetailsController.selectCategoryString,
                                "notes": plannerProjectDetailsController.noteController.value.text,
                              };
                              print(jsonEncode(data));
                              await plannerProjectDetailsController.createAddVendorController(
                                context: context,
                                data: data,
                              );
                            }
                          },
                          text: "Add Vendor",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
            
            
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }



  void showCompareQouotesDialog({
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
          child: SingleChildScrollView(
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
                              text: "Compare Vendor Quotes",
                            ),

                            SpaceHelperWidget.v(10.h(context)),

                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              textAlign: TextAlign.start,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black113,
                              text: "Review and compare quotes from different vendors.",
                            ),


                            SpaceHelperWidget.v(20.h(context)),

                          ],
                        ),
                      ),

                      SpaceHelperWidget.h(10.w(context)),

                      InkWell(
                        onTap: () async {
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

                  if(plannerProjectDetailsController.plannerMyProfileDetailsResponseModel.value.data?.type == "elite")...[
                    Column(
                        children: List.generate(plannerProjectDetailsController.getAllProjectVendorQuotesResponseModel.value.data!.vendorList!.length, (index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 15.bpm(context)),
                            padding: EdgeInsets.symmetric(horizontal: 14.hpm(context),vertical: 12.vpm(context)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r(context)),
                              border: Border.all(width: .75,color: ColorUtils.white215),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                        text: plannerProjectDetailsController.getAllProjectVendorQuotesResponseModel.value.data!.vendorList?[index].vendor?.name ?? "",
                                      ),

                                      SpaceHelperWidget.v(9.h(context)),

                                      TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        alignment: Alignment.centerLeft,
                                        textAlign: TextAlign.start,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        textColor: ColorUtils.black113,
                                        text: plannerProjectDetailsController.getAllProjectVendorQuotesResponseModel.value.data!.vendorList?[index].serviceType?.first ?? "",
                                      ),

                                    ],
                                  ),
                                ),

                                SpaceHelperWidget.h(10.w(context)),

                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.centerLeft,
                                  textAlign: TextAlign.start,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  textColor: ColorUtils.black64,
                                  text: "\$${plannerProjectDetailsController.getAllProjectVendorQuotesResponseModel.value.data!.vendorList?[index].agreedAmount}",
                                ),



                              ],
                            ),
                          );
                        })
                    )
                  ] else...[
                    Column(
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

                        SpaceHelperWidget.v(20.h(context)),

                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            Get.off(()=>PlannerProfileSubscriptionView(),preventDuplicates: false);
                          },
                          text: "Subscribe Now",
                        ),


                      ],
                    )
                  ]

                ],
              ),
            ),
          ),
        ));
      },
    );
  }



}