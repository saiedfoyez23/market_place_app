import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorEditServiceView extends StatelessWidget {
  const VendorEditServiceView({super.key,required this.serviceId});
  final String serviceId;
  @override
  Widget build(BuildContext context) {
    final VendorEditServiceController vendorEditServiceController = Get.put(VendorEditServiceController(context: context, serviceId: serviceId));
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
            child: vendorEditServiceController.isLoading.value == true ?
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
                          controller: vendorEditServiceController.titleController.value,
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
                          controller: vendorEditServiceController.eventDetailsController.value,
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
                          value: vendorEditServiceController.selectServicePaymentModel.value.value == null ? null : vendorEditServiceController.selectServicePaymentModel.value,
                          items: vendorEditServiceController.servicePaymentList,
                          onChanged: (value) {
                            vendorEditServiceController.selectServicePaymentModel.value = value!;
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
                          controller: vendorEditServiceController.priceController.value,
                          keyboardType: TextInputType.number,
                        ),


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
                                  vendorEditServiceController.serviceArea.length, (index) {
                                    return Obx(() {
                                      final area = vendorEditServiceController.serviceArea[index];

                                      /// ✅ CHECK SELECTED (FIXED)
                                      final isSelected = vendorEditServiceController.selectServiceArea
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
                                              vendorEditServiceController.selectServiceArea
                                                  .removeWhere((e) => e['name'] == area);
                                            } else {
                                              /// ADD
                                              vendorEditServiceController.selectServiceArea.add({
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


                        vendorEditServiceController.categoryResponseModel.value.data != null ?
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

                            Wrap(
                              runSpacing: 10.h(context),
                              spacing: 10.w(context),
                              children: List.generate(vendorEditServiceController.categoryResponseModel.value.data!.length, (index) {
                                return Obx(()=>IntrinsicWidth(
                                  child: ButtonHelperWidget.customButtonWidget(
                                    context: context,
                                    height: 56.h(context),
                                    padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                    backgroundColor: vendorEditServiceController.selectCategory.value == vendorEditServiceController.categoryResponseModel.value.data![index] ?
                                    ColorUtils.orange119 :
                                    ColorUtils.white243,
                                    textColor: vendorEditServiceController.selectCategory.value == vendorEditServiceController.categoryResponseModel.value.data![index] ?
                                    ColorUtils.white255 :
                                    ColorUtils.black89,
                                    fontWeight: FontWeight.w500,
                                    onPressed: () async {
                                      vendorEditServiceController.selectCategory.value = vendorEditServiceController.categoryResponseModel.value.data![index];
                                    },
                                    text: vendorEditServiceController.categoryResponseModel.value.data?[index].title ?? "",
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

                        SpaceHelperWidget.v(10.h(context)),

                        if(vendorEditServiceController.selectedFile.isEmpty == true && vendorEditServiceController.vendorGetServiceDetailsResponseModel.value.data?.images?.isNotEmpty == true)...[
                          InkWell(
                            onTap: () async {
                              await vendorEditServiceController.pickUploadFrontSideFile(context: context);
                            },
                            child: Column(
                              children: [

                                vendorEditServiceController.vendorGetServiceDetailsResponseModel.value.data?.images?.isEmpty == true ?
                                SizedBox.shrink() :
                                SizedBox(
                                  height: 200.h(context),
                                  child: PageView(
                                      controller: vendorEditServiceController.pageController.value,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (value) {
                                        vendorEditServiceController.changeIndex(value);
                                      },
                                      children: List.generate(vendorEditServiceController.vendorGetServiceDetailsResponseModel.value.data!.images!.length, (index) {
                                        return ImageHelperWidget.styledImage(
                                          context: context,
                                          borderRadius: 12,
                                          height: 172,
                                          width: 428,
                                          imageUrl: vendorEditServiceController.vendorGetServiceDetailsResponseModel.value.data!.images![index],
                                        );
                                      })
                                  ),
                                ),

                                SpaceHelperWidget.v(20.h(context)),


                                vendorEditServiceController.vendorGetServiceDetailsResponseModel.value.data?.images?.isEmpty == true ?
                                SizedBox.shrink() :
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(vendorEditServiceController.vendorGetServiceDetailsResponseModel.value.data!.images!.length, (index) {
                                    if(vendorEditServiceController.index.value == index) {
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
                        ] else if(vendorEditServiceController.selectedFile.isEmpty == true)...[
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
                                  await vendorEditServiceController.pickUploadFrontSideFile(context: context);
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
                              await vendorEditServiceController.pickUploadFrontSideFile(context: context);
                            },
                            child: Column(
                              children: [

                                vendorEditServiceController.selectedFile.isEmpty == true ?
                                SizedBox.shrink() :
                                SizedBox(
                                  height: 200.h(context),
                                  child: PageView(
                                      controller: vendorEditServiceController.pageController.value,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (value) {
                                        vendorEditServiceController.changeIndex(value);
                                      },
                                      children: List.generate(vendorEditServiceController.selectedFile.length, (index) {
                                        return ImageHelperWidget.styledImage(
                                          context: context,
                                          borderRadius: 12,
                                          height: 172,
                                          width: 428,
                                          imageFile: vendorEditServiceController.selectedFile[index].path,
                                        );
                                      })
                                  ),
                                ),

                                SpaceHelperWidget.v(20.h(context)),


                                vendorEditServiceController.selectedFile.isEmpty == true ?
                                SizedBox.shrink() :
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(vendorEditServiceController.selectedFile.length, (index) {
                                    if(vendorEditServiceController.index.value == index) {
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
                                controller: vendorEditServiceController.serviceQuillController,
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
                                  controller: vendorEditServiceController.serviceQuillController,
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
                              child: vendorEditServiceController.isSubmit.value == true ?
                              LoadingHelperWidget.loadingHelperWidget(
                                context: context,
                              ) :
                              ButtonHelperWidget.customButtonWidgetAdventPro(
                                context: context,
                                onPressed: () async {
                                  vendorEditServiceController.saveServiceContent();
                                  if(vendorEditServiceController.titleController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service title");
                                  } else if(vendorEditServiceController.eventDetailsController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your event details");
                                  } else if(vendorEditServiceController.selectServicePaymentModel.value.key == null) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter select price type");
                                  } else if(vendorEditServiceController.priceController.value.text == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service price");
                                  } else if(vendorEditServiceController.selectCategory.value.title == null) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter select a category");
                                  } else if(vendorEditServiceController.serviceQuillJson.value == "") {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your service details");
                                  } else {
                                    await vendorEditServiceController.editVendorServiceController(
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
