import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerProfileCreateNewServiceView extends StatelessWidget {
  PlannerProfileCreateNewServiceView({super.key});

  final PlannerProfileCreateNewServiceController plannerProfileCreateNewServiceController = Get.put(PlannerProfileCreateNewServiceController());
  
  @override
  Widget build(BuildContext context) {
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
            child: CustomScrollView(
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

                        Container(
                          height: 750.h(context),
                          width: 428.w(context),
                          decoration: BoxDecoration(
                            color: ColorUtils.white230,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 13.hpm(context)),
                          child: Column(
                            children: [
                              /// Toolbar
                              QuillSimpleToolbar(
                                controller: plannerProfileCreateNewServiceController.eventQuillController,
                                config: const QuillSimpleToolbarConfig(
                                  showBoldButton: true,
                                  showItalicButton: true,
                                  showUnderLineButton: true,
                                  showListBullets: true,
                                  showListNumbers: true,
                                  showStrikeThrough: true,
                                  showInlineCode: false,
                                  showCodeBlock: false,
                                  showQuote: false,
                                  showSubscript: false,
                                  showSuperscript: false,
                                  showClearFormat: false,
                                  showAlignmentButtons: false,
                                  showIndent: false,
                                  showColorButton: false,
                                  showBackgroundColorButton: false,
                                  showLink: false,
                                  showSearchButton: false,
                                  showUndo: false,
                                  showRedo: false,
                                ),
                              ),


                              /// Editor
                              Expanded(
                                child: QuillEditor.basic(
                                  controller: plannerProfileCreateNewServiceController.eventQuillController,
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
                          children: List.generate(plannerProfileCreateNewServiceController.categoryList.length, (index) {
                            return Obx(()=>IntrinsicWidth(
                              child: ButtonHelperWidget.customButtonWidget(
                                context: context,
                                height: 56.h(context),
                                padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                backgroundColor: plannerProfileCreateNewServiceController.selectCategory.value ==  plannerProfileCreateNewServiceController.categoryList[index] ? ColorUtils.orange119 : ColorUtils.white243,
                                textColor:  plannerProfileCreateNewServiceController.selectCategory.value ==  plannerProfileCreateNewServiceController.categoryList[index] ? ColorUtils.white255 : ColorUtils.black89,
                                fontWeight: FontWeight.w500,
                                onPressed: () async {
                                  plannerProfileCreateNewServiceController.selectCategory.value = plannerProfileCreateNewServiceController.categoryList[index];
                                },
                                text: plannerProfileCreateNewServiceController.categoryList[index],
                              ),
                            ));
                          }),
                        ),


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
                          padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 20.hpm(context)),
                          decoration: BoxDecoration(
                            color: ColorUtils.white243,
                            border: Border.all(color: ColorUtils.black128,width: 1),
                            borderRadius: BorderRadius.circular(10.r(context)),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await plannerProfileCreateNewServiceController.pickUploadFrontSideFile();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                plannerProfileCreateNewServiceController.uploadFile.value.path == "" ?
                                ImageHelperWidget.assetImageWidget(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imageString: ImageUtils.pickFileImage,
                                ) : SizedBox.shrink(),

                                SpaceHelperWidget.v(6.w(context)),


                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.center,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  textColor: ColorUtils.black96,
                                  text: plannerProfileCreateNewServiceController.uploadFile.value.path == "" ? "Click to upload image" : plannerProfileCreateNewServiceController.uploadFile.value.path,
                                ),


                                SpaceHelperWidget.v(6.w(context)),

                                plannerProfileCreateNewServiceController.uploadFile.value.path == "" ?
                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.center,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  textColor: ColorUtils.black96,
                                  text: "PNG, JPG up to 10MB",
                                ) : SizedBox.shrink(),

                              ],
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
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 13.hpm(context)),
                          child: Column(
                            children: [
                              /// Toolbar
                              QuillSimpleToolbar(
                                controller: plannerProfileCreateNewServiceController.serviceQuillController,
                                config: const QuillSimpleToolbarConfig(
                                  showBoldButton: true,
                                  showItalicButton: true,
                                  showUnderLineButton: true,
                                  showListBullets: true,
                                  showListNumbers: true,
                                  showStrikeThrough: true,
                                  showInlineCode: false,
                                  showCodeBlock: false,
                                  showQuote: false,
                                  showSubscript: false,
                                  showSuperscript: false,
                                  showClearFormat: false,
                                  showAlignmentButtons: false,
                                  showIndent: false,
                                  showColorButton: false,
                                  showBackgroundColorButton: false,
                                  showLink: false,
                                  showSearchButton: false,
                                  showUndo: false,
                                  showRedo: false,
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
                              child: ButtonHelperWidget.customButtonWidgetAdventPro(
                                context: context,
                                onPressed: () async {
                                  plannerProfileCreateNewServiceController.saveEventContent();
                                  plannerProfileCreateNewServiceController.saveServiceContent();
                                  print(plannerProfileCreateNewServiceController.serviceQuillJson);
                                  print(plannerProfileCreateNewServiceController.eventQuillJson);
                                },
                                text: "Update",
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
