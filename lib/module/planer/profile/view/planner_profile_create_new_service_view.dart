import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerProfileCreateNewServiceView extends StatelessWidget {
  const PlannerProfileCreateNewServiceView({super.key,required this.long,required this.lat,required this.address});
  final double long;
  final double lat;
  final String address;
  
  @override
  Widget build(BuildContext context) {
    final PlannerProfileCreateNewServiceController plannerProfileCreateNewServiceController = Get.put(
        PlannerProfileCreateNewServiceController(context: context,long: long,lat: lat,address: address));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>PlannerProfileServiceView(),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: plannerProfileCreateNewServiceController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [


                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>PlannerProfileServiceView(),preventDuplicates: false);
                  },
                  title: "Create New Service",
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
                          controller: plannerProfileCreateNewServiceController.titleController.value,
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
                          controller: plannerProfileCreateNewServiceController.eventDetailsController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Price Type",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        CustomDropdownHelperClass<PlannerServiceDropdownModel>(
                          value: plannerProfileCreateNewServiceController.selectServicePaymentModel.value.value == null ? null : plannerProfileCreateNewServiceController.selectServicePaymentModel.value,
                          items: plannerProfileCreateNewServiceController.servicePaymentList,
                          onChanged: (value) {
                            plannerProfileCreateNewServiceController.selectServicePaymentModel.value = value!;
                          },
                          fillColor: ColorUtils.white243,
                          itemBuilder: (PlannerServiceDropdownModel value) {
                            return TextHelperClass.headingText(
                              context: context,
                              text: value.key.toString(),
                              fontSize: 18,
                              textColor: ColorUtils.black48,
                              fontWeight: FontWeight.w700,
                            );
                          },
                        ),


                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Price",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter Price",
                          controller: plannerProfileCreateNewServiceController.priceController.value,
                          keyboardType: TextInputType.number,
                        ),


                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Address",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter Address",
                          controller: plannerProfileCreateNewServiceController.addressController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        plannerProfileCreateNewServiceController.categoryResponseModel.value.data != null ?
                        Column(
                          children: [

                            SpaceHelperWidget.v(20.h(context)),


                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black96,
                              text: "Category",
                            ),

                            SpaceHelperWidget.v(6.h(context)),

                            Wrap(
                              runSpacing: 10.h(context),
                              spacing: 10.w(context),
                              children: List.generate(plannerProfileCreateNewServiceController.categoryResponseModel.value.data!.length, (index) {
                                return Obx(()=>IntrinsicWidth(
                                  child: ButtonHelperWidget.customButtonWidget(
                                    context: context,
                                    height: 56.h(context),
                                    padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                    backgroundColor: plannerProfileCreateNewServiceController.selectCategory.value == plannerProfileCreateNewServiceController.categoryResponseModel.value.data![index] ?
                                    ColorUtils.orange119 :
                                    ColorUtils.white243,
                                    textColor: plannerProfileCreateNewServiceController.selectCategory.value == plannerProfileCreateNewServiceController.categoryResponseModel.value.data![index] ?
                                    ColorUtils.white255 :
                                    ColorUtils.black89,
                                    fontWeight: FontWeight.w500,
                                    onPressed: () async {
                                      plannerProfileCreateNewServiceController.selectCategory.value = plannerProfileCreateNewServiceController.categoryResponseModel.value.data![index];
                                    },
                                    text: plannerProfileCreateNewServiceController.categoryResponseModel.value.data?[index].title ?? "",
                                  ),
                                ));
                              }),
                            ),

                          ],
                        ) :
                        SizedBox.shrink(),


                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: " Upload Image",
                        ),

                        SpaceHelperWidget.v(6.h(context)),

                        Container(
                          width: 428.w(context),
                          padding: plannerProfileCreateNewServiceController.uploadFile.value.path == "" ?
                          EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 20.hpm(context)) :
                          EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: ColorUtils.white243,
                            border: Border.all(color: ColorUtils.black128,width: 1),
                            borderRadius: BorderRadius.circular(10.r(context)),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await plannerProfileCreateNewServiceController.pickUploadFrontSideFile();
                            },
                            child: plannerProfileCreateNewServiceController.uploadFile.value.path == "" ?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                ImageHelperWidget.assetImageWidget(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imageString: ImageUtils.pickFileImage,
                                ),

                                SpaceHelperWidget.v(6.w(context)),


                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.center,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  textColor: ColorUtils.black96,
                                  text: "Click to upload image",
                                ),


                                SpaceHelperWidget.v(6.w(context)),


                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.center,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  textColor: ColorUtils.black96,
                                  text: "PNG, JPG up to 10MB",
                                ),

                              ],
                            ) :
                            ImageHelperWidget.styledImage(
                              context: context,
                              height: 200,
                              width: 428,
                              borderRadius: 10,
                              fit: BoxFit.fill,
                              imageFile: plannerProfileCreateNewServiceController.uploadFile.value.path,
                            ),
                          ),
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
                          height: 750.h(context),
                          width: 428.w(context),
                          decoration: BoxDecoration(
                            color: ColorUtils.white230,
                            borderRadius: BorderRadius.circular(12.r(context))
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 13.hpm(context)),
                          child: Column(
                            children: [

                              /// Toolbar
                              QuillSimpleToolbar(
                                controller: plannerProfileCreateNewServiceController.serviceQuillController,
                                config: QuillSimpleToolbarConfig(
                                  showAlignmentButtons: false,
                                  showBackgroundColorButton: false,
                                  showCenterAlignment: false,
                                  showCodeBlock: false,
                                  showColorButton: false,
                                  showDirection: false,
                                  showDividers: false,
                                  showFontFamily: false,
                                  showHeaderStyle: false,
                                  showIndent: false,
                                  showInlineCode: false,
                                  showJustifyAlignment: false,
                                  showLeftAlignment: false,
                                  showLink: false,
                                  showListCheck: true,        // ✅ checklist
                                  showListBullets: true,      // ✅ bullet
                                  showListNumbers: false,
                                  showQuote: false,
                                  showRedo: false,
                                  showRightAlignment: false,
                                  showSearchButton: false,
                                  showStrikeThrough: false,
                                  showSubscript: false,
                                  showSuperscript: false,
                                  showUndo: false,
                                  showUnderLineButton: true,  // ✅ underline
                                  showBoldButton: true,       // ✅ bold
                                  showItalicButton: true,     // ✅ italic
                                  showFontSize: true,
                                ),
                              ),


                              /// Editor
                              Expanded(
                                child: QuillEditor.basic(
                                  controller: plannerProfileCreateNewServiceController.serviceQuillController,
                                  config: const QuillEditorConfig(),
                                ),
                              )

                            ],
                          ),
                        ),


                        // TextFormFieldWidget.textFiledWithMaxLineBuild(
                        //   context: context,
                        //   maxLines: 5,
                        //   hintText: "Write something ...",
                        //   controller: plannerProfileCreateNewServiceController.eventDetailsController.value,
                        //   keyboardType: TextInputType.emailAddress,
                        // ),


                        SpaceHelperWidget.v(24.h(context)),

                        Row(
                          children: [

                            Expanded(
                              child: ButtonHelperWidget.customButtonWidgetAdventPro(
                                context: context,
                                onPressed: () async {
                                  Get.off(()=>PlannerProfileServiceView(),preventDuplicates: false);
                                },
                                text: "Cancel",
                                textColor: ColorUtils.red202,
                                backgroundColor: ColorUtils.red9,
                              ),
                            ),

                            SpaceHelperWidget.h(16.w(context)),

                            Expanded(
                              child: plannerProfileCreateNewServiceController.isSubmit.value == true ?
                              LoadingHelperWidget.loadingHelperWidget(
                                context: context,
                              ) :
                              ButtonHelperWidget.customButtonWidgetAdventPro(
                                context: context,
                                onPressed: () async {
                                  if(plannerProfileCreateNewServiceController.titleController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service title");
                                  } else if(plannerProfileCreateNewServiceController.eventDetailsController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your event details");
                                  } else if(plannerProfileCreateNewServiceController.selectServicePaymentModel.value.key == null) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter select price type");
                                  } else if(plannerProfileCreateNewServiceController.priceController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service price");
                                  } else if(plannerProfileCreateNewServiceController.selectCategory.value.title == null) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter select a category");
                                  } else if(plannerProfileCreateNewServiceController.uploadFile.value.path == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please upload service image");
                                  } else if(plannerProfileCreateNewServiceController.serviceQuillJson.value == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service details");
                                  } else {
                                    await plannerProfileCreateNewServiceController.createPlannerServiceController(context: context);
                                    Map<String,dynamic> data = {
                                      "category": plannerProfileCreateNewServiceController.selectCategory.value.sId,
                                      "title": plannerProfileCreateNewServiceController.titleController.value.text,
                                      "subtitle": plannerProfileCreateNewServiceController.eventDetailsController.value.text,
                                      "description": plannerProfileCreateNewServiceController.serviceQuillJson.value,
                                      "longitude": plannerProfileCreateNewServiceController.submitLong.value,
                                      "latitude": plannerProfileCreateNewServiceController.submitLat.value,
                                      "address": plannerProfileCreateNewServiceController.addressController.value.text,
                                      "price": plannerProfileCreateNewServiceController.priceController.value.text,
                                      "priceType": plannerProfileCreateNewServiceController.selectServicePaymentModel.value.value
                                    };
                                    print(data);
                                  }
                                },
                                text: "Upload",
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
