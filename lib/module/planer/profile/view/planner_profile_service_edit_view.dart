import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerProfileServiceEditView extends StatelessWidget {
  const PlannerProfileServiceEditView({super.key,required this.serviceId});
  final String serviceId;
  @override
  Widget build(BuildContext context) {
    final PlannerProfileServiceEditController plannerProfileServiceEditController = Get.put(PlannerProfileServiceEditController(context: context, serviceId: serviceId));
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
            child: plannerProfileServiceEditController.isLoading.value == true ?
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
                  title: "Edit Service",
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

                        SpaceHelperWidget.v(10.h(context)),


                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter title",
                          controller: plannerProfileServiceEditController.titleController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Service Description",
                        ),

                        SpaceHelperWidget.v(10.h(context)),


                        TextFormFieldWidget.textFiledWithMaxLineBuild(
                          context: context,
                          maxLines: 5,
                          hintText: "Write something ...",
                          controller: plannerProfileServiceEditController.eventDetailsController.value,
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

                        SpaceHelperWidget.v(10.h(context)),


                        CustomDropdownHelperClass<PlannerServiceDropdownModel>(
                          value: plannerProfileServiceEditController.selectServicePaymentModel.value.value == null ? null : plannerProfileServiceEditController.selectServicePaymentModel.value,
                          items: plannerProfileServiceEditController.servicePaymentList,
                          onChanged: (value) {
                            plannerProfileServiceEditController.selectServicePaymentModel.value = value!;
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

                        SpaceHelperWidget.v(10.h(context)),


                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter Price",
                          controller: plannerProfileServiceEditController.priceController.value,
                          keyboardType: TextInputType.number,
                        ),


                        SpaceHelperWidget.v(20.h(context)),


                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Service Area",
                        ),

                        SpaceHelperWidget.v(10.h(context)),

                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                runAlignment: WrapAlignment.start,
                                runSpacing: 10.h(context),
                                spacing: 10.w(context),
                                children: List.generate(
                                  plannerProfileServiceEditController.serviceArea.length, (index) {
                                  return Obx(() {
                                    final area =  plannerProfileServiceEditController.serviceArea[index];

                                    /// ✅ CHECK SELECTED (FIXED)
                                    final isSelected = plannerProfileServiceEditController.selectServiceArea
                                        .any((e) => e['name'] == area);

                                    return IntrinsicWidth(
                                      child: ButtonHelperWidget.customButtonWidget(
                                        context: context,
                                        height: 56.h(context),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.5.hpm(context),
                                          vertical: 8.5.vpm(context),
                                        ),

                                        /// ✅ BACKGROUND COLOR
                                        backgroundColor:
                                        isSelected ? ColorUtils.orange119 : ColorUtils.white243,

                                        /// ✅ TEXT COLOR
                                        textColor:
                                        isSelected ? ColorUtils.white255 : ColorUtils.black89,

                                        fontWeight: FontWeight.w500,

                                        /// ✅ TOGGLE LOGIC (FIXED)
                                        onPressed: () async {
                                          if (isSelected) {
                                            /// REMOVE
                                            plannerProfileServiceEditController.selectServiceArea
                                                .removeWhere((e) => e['name'] == area);
                                          } else {
                                            /// ADD
                                            plannerProfileServiceEditController.selectServiceArea.add({
                                              "name": area,
                                            });
                                          }
                                        },

                                        text: area,
                                      ),
                                    );
                                  });
                                },
                                ),
                              ),
                            )
                          ],
                        ),


                        plannerProfileServiceEditController.categoryResponseModel.value.data != null ?
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

                            SpaceHelperWidget.v(10.h(context)),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                runAlignment: WrapAlignment.start,
                                runSpacing: 10.h(context),
                                spacing: 10.w(context),
                                children: List.generate(plannerProfileServiceEditController.categoryResponseModel.value.data!.length, (index) {
                                  return Obx(()=>IntrinsicWidth(
                                    child: ButtonHelperWidget.customButtonWidget(
                                      context: context,
                                      height: 56.h(context),
                                      padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                      backgroundColor: plannerProfileServiceEditController.selectCategory.value == plannerProfileServiceEditController.categoryResponseModel.value.data![index] ?
                                      ColorUtils.orange119 :
                                      ColorUtils.white243,
                                      textColor: plannerProfileServiceEditController.selectCategory.value == plannerProfileServiceEditController.categoryResponseModel.value.data![index] ?
                                      ColorUtils.white255 :
                                      ColorUtils.black89,
                                      fontWeight: FontWeight.w500,
                                      onPressed: () async {
                                        plannerProfileServiceEditController.selectCategory.value = plannerProfileServiceEditController.categoryResponseModel.value.data![index];
                                      },
                                      text: plannerProfileServiceEditController.categoryResponseModel.value.data?[index].title ?? "",
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

                        SpaceHelperWidget.v(10.h(context)),

                        if(plannerProfileServiceEditController.selectedFile.isEmpty == true &&  plannerProfileServiceEditController.plannerGetServiceDetailsResponseModel.value.data?.images?.isNotEmpty == true)...[
                          InkWell(
                            onTap: () async {
                              await plannerProfileServiceEditController.pickUploadFrontSideFile(context: context);
                            },
                            child: Column(
                              children: [

                                plannerProfileServiceEditController.plannerGetServiceDetailsResponseModel.value.data?.images?.isEmpty == true ?
                                SizedBox.shrink() :
                                SizedBox(
                                  height: 200.h(context),
                                  child: PageView(
                                      controller:  plannerProfileServiceEditController.pageController.value,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (value) {
                                        plannerProfileServiceEditController.changeIndex(value);
                                      },
                                      children: List.generate(plannerProfileServiceEditController.plannerGetServiceDetailsResponseModel.value.data!.images!.length, (index) {
                                        return ImageHelperWidget.styledImage(
                                          context: context,
                                          borderRadius: 12,
                                          height: 172,
                                          width: 428,
                                          imageUrl: plannerProfileServiceEditController.plannerGetServiceDetailsResponseModel.value.data!.images![index],
                                        );
                                      })
                                  ),
                                ),

                                SpaceHelperWidget.v(20.h(context)),


                                plannerProfileServiceEditController.plannerGetServiceDetailsResponseModel.value.data?.images?.isEmpty == true ?
                                SizedBox.shrink() :
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(plannerProfileServiceEditController.plannerGetServiceDetailsResponseModel.value.data!.images!.length, (index) {
                                    if(plannerProfileServiceEditController.index.value == index) {
                                      return Container(
                                        height: 12.h(context),
                                        width: 30.w(context),
                                        margin: EdgeInsets.only(right: 6.rpm(context)),
                                        decoration: BoxDecoration(
                                          color: ColorUtils.orange119,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(6.r(context)),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        height: 12.h(context),
                                        width: 12.w(context),
                                        margin: EdgeInsets.only(right: 6.rpm(context)),
                                        decoration: BoxDecoration(
                                          color: ColorUtils.orange213,
                                          shape: BoxShape.circle,
                                        ),
                                      );
                                    }
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ] else if(plannerProfileServiceEditController.selectedFile.isEmpty == true)...[
                          Container(
                            width: 428.w(context),
                            padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 20.hpm(context)),
                            decoration: BoxDecoration(
                              color: ColorUtils.white243,
                              border: Border.all(color: ColorUtils.black128,width: 1),
                              borderRadius: BorderRadius.circular(10.r(context)),
                            ),
                            child: InkWell(
                                onTap: () async {
                                  await plannerProfileServiceEditController.pickUploadFrontSideFile(context: context);
                                },
                                child: Column(
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
                                )
                            ),
                          )
                        ] else...[
                          InkWell(
                            onTap: () async {
                              await plannerProfileServiceEditController.pickUploadFrontSideFile(context: context);
                            },
                            child: Column(
                              children: [

                                plannerProfileServiceEditController.selectedFile.isEmpty == true ?
                                SizedBox.shrink() :
                                SizedBox(
                                  height: 200.h(context),
                                  child: PageView(
                                      controller: plannerProfileServiceEditController.pageController.value,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (value) {
                                        plannerProfileServiceEditController.changeIndex(value);
                                      },
                                      children: List.generate(plannerProfileServiceEditController.selectedFile.length, (index) {
                                        return ImageHelperWidget.styledImage(
                                          context: context,
                                          borderRadius: 12,
                                          height: 172,
                                          width: 428,
                                          imageFile: plannerProfileServiceEditController.selectedFile[index].path,
                                        );
                                      })
                                  ),
                                ),

                                SpaceHelperWidget.v(20.h(context)),


                                plannerProfileServiceEditController.selectedFile.isEmpty == true ?
                                SizedBox.shrink() :
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(plannerProfileServiceEditController.selectedFile.length, (index) {
                                    if(plannerProfileServiceEditController.index.value == index) {
                                      return Container(
                                        height: 12.h(context),
                                        width: 30.w(context),
                                        margin: EdgeInsets.only(right: 6.rpm(context)),
                                        decoration: BoxDecoration(
                                          color: ColorUtils.orange119,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(6.r(context)),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        height: 12.h(context),
                                        width: 12.w(context),
                                        margin: EdgeInsets.only(right: 6.rpm(context)),
                                        decoration: BoxDecoration(
                                          color: ColorUtils.orange213,
                                          shape: BoxShape.circle,
                                        ),
                                      );
                                    }
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ],


                        SpaceHelperWidget.v(20.h(context)),

                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "What’s Included",
                        ),

                        SpaceHelperWidget.v(10.h(context)),

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
                                controller: plannerProfileServiceEditController.serviceQuillController,
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
                                  controller: plannerProfileServiceEditController.serviceQuillController,
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
                              child: plannerProfileServiceEditController.isSubmit.value == true ?
                              LoadingHelperWidget.loadingHelperWidget(
                                context: context,
                              ) :
                              ButtonHelperWidget.customButtonWidgetAdventPro(
                                context: context,
                                onPressed: () async {
                                  plannerProfileServiceEditController.saveServiceContent();
                                  if(plannerProfileServiceEditController.titleController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service title");
                                  } else if(plannerProfileServiceEditController.eventDetailsController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service description");
                                  } else if(plannerProfileServiceEditController.eventDetailsController.value.text.length < 40) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Service Description must be above 40 words");
                                  } else if(plannerProfileServiceEditController.selectServicePaymentModel.value.key == null) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter select price type");
                                  } else if(plannerProfileServiceEditController.priceController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service price");
                                  } else if(plannerProfileServiceEditController.selectCategory.value.title == null) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter select a category");
                                  } else if(plannerProfileServiceEditController.selectedFile.isEmpty == true) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please upload service images");
                                  } else if(plannerProfileServiceEditController.serviceQuillJson.value == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service details");
                                  } else if(plannerProfileServiceEditController.serviceQuillJson.value.length < 40) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "What's include must be above 40 words");
                                  } else {
                                    await plannerProfileServiceEditController.editPlannerServiceController(
                                      context: context,
                                      serviceId: serviceId,
                                    );
                                  }
                                },
                                text: "Edit",
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
