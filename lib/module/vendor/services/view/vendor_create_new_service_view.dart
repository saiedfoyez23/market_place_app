import 'package:flutter/material.dart';
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
        Get.off(()=>VendorPickLocationPlaceView(),preventDuplicates: false);
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
                    Get.off(()=>VendorPickLocationPlaceView(),preventDuplicates: false);
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

                            Wrap(
                              runSpacing: 10.h(context),
                              spacing: 10.w(context),
                              children: List.generate(vendorCreateNewServiceController.categoryResponseModel.value.data!.length, (index) {
                                return Obx(()=>IntrinsicWidth(
                                  child: ButtonHelperWidget.customButtonWidget(
                                    context: context,
                                    height: 56.h(context),
                                    padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                    backgroundColor: vendorCreateNewServiceController.selectCategoryString.contains(vendorCreateNewServiceController.categoryResponseModel.value.data![index].title) == false ?
                                    ColorUtils.white243 :
                                    vendorCreateNewServiceController.selectCategoryString.contains(vendorCreateNewServiceController.categoryResponseModel.value.data![index].title) == true ?
                                    ColorUtils.orange119 :
                                    ColorUtils.white243,
                                    textColor: vendorCreateNewServiceController.selectCategoryString.contains(vendorCreateNewServiceController.categoryResponseModel.value.data![index].title) == false ?
                                    ColorUtils.black89 :
                                    vendorCreateNewServiceController.selectCategoryString.contains(vendorCreateNewServiceController.categoryResponseModel.value.data![index].title) == true ?
                                    ColorUtils.white255 :
                                    ColorUtils.black89,
                                    fontWeight: FontWeight.w500,
                                    onPressed: () async {
                                      if(vendorCreateNewServiceController.selectCategoryString.contains(vendorCreateNewServiceController.categoryResponseModel.value.data![index].title) == true) {
                                        vendorCreateNewServiceController.selectCategoryString.remove(vendorCreateNewServiceController.categoryResponseModel.value.data![index].title);
                                      } else {
                                        vendorCreateNewServiceController.selectCategoryString.add(vendorCreateNewServiceController.categoryResponseModel.value.data![index].title);
                                      }
                                    },
                                    text: vendorCreateNewServiceController.categoryResponseModel.value.data?[index].title ?? "",
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
                          padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 20.hpm(context)),
                          decoration: BoxDecoration(
                            color: ColorUtils.white243,
                            border: Border.all(color: ColorUtils.black128,width: 1),
                            borderRadius: BorderRadius.circular(10.r(context)),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await vendorCreateNewServiceController.pickUploadFrontSideFile();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                vendorCreateNewServiceController.uploadFile.value.path == "" ?
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
                                  text: vendorCreateNewServiceController.uploadFile.value.path == "" ? "Click to upload image" : vendorCreateNewServiceController.uploadFile.value.path,
                                ),


                                SpaceHelperWidget.v(6.w(context)),

                                vendorCreateNewServiceController.uploadFile.value.path == "" ?
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


                        TextFormFieldWidget.textFiledWithMaxLineBuild(
                          context: context,
                          maxLines: 5,
                          hintText: "Write something ...",
                          controller: vendorCreateNewServiceController.eventDetailsController.value,
                          keyboardType: TextInputType.emailAddress,
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
                              child: ButtonHelperWidget.customButtonWidgetAdventPro(
                                context: context,
                                onPressed: () async {},
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
