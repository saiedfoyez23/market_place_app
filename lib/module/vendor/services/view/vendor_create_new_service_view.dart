import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorCreateNewServiceView extends StatelessWidget {
  VendorCreateNewServiceView({super.key,required this.long,required this.lat,required this.address});
  final double long;
  final double lat;
  final String address;

  @override
  Widget build(BuildContext context) {
    final VendorCreateNewServiceController vendorCreateNewServiceController = Get.put(VendorCreateNewServiceController(
        context: context,lat: lat,long: long,address: address));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardVendorView(index: 1),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: vendorCreateNewServiceController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [


                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardVendorView(index: 1),preventDuplicates: false);
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
                          controller: vendorCreateNewServiceController.titleController.value,
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
                          controller: vendorCreateNewServiceController.eventDetailsController.value,
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
                          value: vendorCreateNewServiceController.selectServicePaymentModel.value.value == null ?
                          null : vendorCreateNewServiceController.selectServicePaymentModel.value,
                          items: vendorCreateNewServiceController.servicePaymentList,
                          onChanged: (value) {
                            vendorCreateNewServiceController.selectServicePaymentModel.value = value!;
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
                          controller: vendorCreateNewServiceController.priceController.value,
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
                          controller: vendorCreateNewServiceController.addressController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        vendorCreateNewServiceController.categoryResponseModel.value.data != null ?
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

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                runAlignment: WrapAlignment.start,
                                runSpacing: 10.h(context),
                                spacing: 10.w(context),
                                children: List.generate(vendorCreateNewServiceController.categoryResponseModel.value.data!.length, (index) {
                                  return Obx(()=>IntrinsicWidth(
                                    child: ButtonHelperWidget.customButtonWidget(
                                      context: context,
                                      height: 56.h(context),
                                      padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                      backgroundColor: vendorCreateNewServiceController.selectCategory.value == vendorCreateNewServiceController.categoryResponseModel.value.data![index] ?
                                      ColorUtils.orange119 :
                                      ColorUtils.white243,
                                      textColor: vendorCreateNewServiceController.selectCategory.value == vendorCreateNewServiceController.categoryResponseModel.value.data![index] ?
                                      ColorUtils.white255 :
                                      ColorUtils.black89,
                                      fontWeight: FontWeight.w500,
                                      onPressed: () async {
                                        vendorCreateNewServiceController.selectCategory.value = vendorCreateNewServiceController.categoryResponseModel.value.data![index];
                                      },
                                      text: vendorCreateNewServiceController.categoryResponseModel.value.data?[index].title ?? "",
                                    ),
                                  ));
                                }),
                              ),
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
                          padding: vendorCreateNewServiceController.uploadFile.value.path == "" ?
                          EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 20.hpm(context)) :
                          EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: ColorUtils.white243,
                            border: Border.all(color: ColorUtils.black128,width: 1),
                            borderRadius: BorderRadius.circular(10.r(context)),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await vendorCreateNewServiceController.pickUploadFrontSideFile();
                            },
                            child: vendorCreateNewServiceController.uploadFile.value.path == "" ?
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
                              imageFile: vendorCreateNewServiceController.uploadFile.value.path,
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
                                controller: vendorCreateNewServiceController.serviceQuillController,
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
                                  controller: vendorCreateNewServiceController.serviceQuillController,
                                  config: const QuillEditorConfig(),
                                ),
                              )

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
                                  Get.off(()=>DashboardVendorView(index: 1),preventDuplicates: false);
                                },
                                text: "Cancel",
                                textColor: ColorUtils.red202,
                                backgroundColor: ColorUtils.red9,
                              ),
                            ),

                            SpaceHelperWidget.h(16.w(context)),

                            Expanded(
                              child: vendorCreateNewServiceController.isSubmit.value == true ?
                              LoadingHelperWidget.loadingHelperWidget(
                                context: context,
                              ) :
                              ButtonHelperWidget.customButtonWidgetAdventPro(
                                context: context,
                                onPressed: () async {
                                  vendorCreateNewServiceController.saveServiceContent();
                                  if(vendorCreateNewServiceController.titleController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service title");
                                  } else if(vendorCreateNewServiceController.eventDetailsController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your event details");
                                  } else if(vendorCreateNewServiceController.selectServicePaymentModel.value.key == null) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter select price type");
                                  } else if(vendorCreateNewServiceController.priceController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service price");
                                  } else if(vendorCreateNewServiceController.selectCategory.value.title == null) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter select a category");
                                  } else if(vendorCreateNewServiceController.uploadFile.value.path == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please upload service image");
                                  } else if(vendorCreateNewServiceController.serviceQuillJson.value == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service details");
                                  } else {
                                    await vendorCreateNewServiceController.createVendorServiceController(context: context);
                                    Map<String,dynamic> data = {
                                      "category": vendorCreateNewServiceController.selectCategory.value.sId,
                                      "title": vendorCreateNewServiceController.titleController.value.text,
                                      "subtitle": vendorCreateNewServiceController.eventDetailsController.value.text,
                                      "description": vendorCreateNewServiceController.serviceQuillJson.value,
                                      "longitude": vendorCreateNewServiceController.submitLong.value,
                                      "latitude": vendorCreateNewServiceController.submitLat.value,
                                      "address": vendorCreateNewServiceController.addressController.value.text,
                                      "price": vendorCreateNewServiceController.priceController.value.text,
                                      "priceType": vendorCreateNewServiceController.selectServicePaymentModel.value.value
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
