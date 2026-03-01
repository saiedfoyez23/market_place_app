import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:url_launcher/url_launcher.dart';

class PlannerProfileServiceView extends StatelessWidget {
  const PlannerProfileServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    final PlannerProfileServiceController plannerProfileServiceController = Get.put(PlannerProfileServiceController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: plannerProfileServiceController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            RefreshIndicator(
              onRefresh: () async {
                Get.off(()=>PlannerProfileServiceView(),preventDuplicates: false);
              },
              child: CustomScrollView(
                slivers: [


                  AuthAppBarHelperWidget(
                    onBackPressed: () async {
                      Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
                    },
                    title: "My Service",
                    actions: [

                      ButtonHelperWidget.customIconButtonWidgetAdventPro(
                        context: context,
                        backgroundColor: ColorUtils.blue96,
                        textSize: 20,
                        iconSize: 20,
                        height: 40,
                        padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 16.hpm(context)),
                        borderRadius: 8,
                        textColor: ColorUtils.white255,
                        fontWeight: FontWeight.w700,
                        onPressed: () async {
                          Get.off(()=>PlannerPickLocationPlaceView(),preventDuplicates: false);
                        },
                        iconPath: ImageUtils.addImage,
                        text: "Add Service",
                      ),

                      SpaceHelperWidget.h(15.w(context))

                    ],
                  ),


                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context,int index) {
                            final item = plannerProfileServiceController.plannerGetAllServiceModelResponse.value.data?[index];

                            return Container(
                              margin: EdgeInsets.only(bottom: 20.bpm(context)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r(context)),
                                color: ColorUtils.white243,
                                border: Border.all(
                                    color: ColorUtils.white215,
                                    width: 1
                                ),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  overlayColor: Colors.transparent,
                                ),
                                onPressed: () async {
                                  Get.off(()=>PlannerProfileServiceDetailsView(serviceId: item.sId),preventDuplicates: false);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // IMAGE + HEART
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12.r(context)),
                                            topRight: Radius.circular(12.r(context)),
                                          ),
                                          child: item!.images?.isEmpty == true ?
                                          SpaceHelperWidget.sq(192.h(context), 428.w(context)) :
                                          Image.network(
                                            item.images!.first,
                                            height: 192.h(context),
                                            width: 428.w(context),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // Positioned(
                                        //   top: 12.h(context),
                                        //   right: 12.w(context),
                                        //   child: ImageHelperWidget.assetImageWidget(
                                        //     context: context,
                                        //     height: 26.h(context),
                                        //     width: 26.w(context),
                                        //     imageString: ImageUtils.serviceLoveImage,
                                        //   ),
                                        // ),
                                      ],
                                    ),

                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20.hpm(context),vertical: 20.vpm(context)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          TextHelperClass.headingTextWithoutWidth(
                                            context: context,
                                            alignment: Alignment.centerLeft,
                                            textAlign: TextAlign.start,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            textColor: ColorUtils.black48,
                                            text: item.title,
                                          ),

                                          SpaceHelperWidget.v(6.h(context)),


                                          TextHelperClass.headingTextWithoutWidth(
                                            context: context,
                                            alignment: Alignment.centerLeft,
                                            textAlign: TextAlign.start,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            textColor: ColorUtils.black80,
                                            text: item.subtitle,
                                          ),


                                          SpaceHelperWidget.v(12.h(context)),

                                          InkWell(
                                            onTap: () async {
                                              if (await canLaunchUrl(Uri.parse(item.locationUrl))) {
                                                await launchUrl(Uri.parse(item.locationUrl), mode: LaunchMode.externalApplication);
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                ImageHelperWidget.assetImageWidget(
                                                  context: context,
                                                  height: 21.h(context),
                                                  width: 21.w(context),
                                                  imageString: ImageUtils.locationImage,
                                                ),

                                                SpaceHelperWidget.h(8.w(context)),


                                                Expanded(
                                                  child: TextHelperClass.headingTextWithoutWidth(
                                                    context: context,
                                                    alignment: Alignment.centerLeft,
                                                    textAlign: TextAlign.start,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: ColorUtils.black94,
                                                    text: item.address,
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ),


                                          SpaceHelperWidget.v(24.h(context)),

                                          // BUTTON ROW
                                          Row(
                                            children: [


                                              Expanded(
                                                child: ButtonHelperWidget.customButtonWidgetAdventPro(
                                                  context: context,
                                                  onPressed: () async {
                                                    showDialog(
                                                      context: context,
                                                      barrierDismissible: false, // user must tap a button
                                                      builder: (context) {
                                                        return Obx(()=>Dialog(
                                                          insetPadding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(20.r(context)),
                                                          ),
                                                          child: IntrinsicHeight(
                                                            child: Container(
                                                              width: 428.w(context),
                                                              decoration: BoxDecoration(
                                                                color: ColorUtils.white255,
                                                                borderRadius: BorderRadius.circular(20.r(context)),
                                                              ),
                                                              padding: EdgeInsets.fromLTRB(
                                                                16.lpm(context),
                                                                20.tpm(context),
                                                                16.rpm(context),
                                                                20.bpm(context),
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  /// ===== Title Text =====

                                                                  TextHelperClass.headingTextWithoutWidth(
                                                                    context: context,
                                                                    alignment: Alignment.center,
                                                                    textAlign: TextAlign.center,
                                                                    fontSize: 20,
                                                                    fontWeight: FontWeight.w600,
                                                                    textColor: ColorUtils.black21,
                                                                    text: "Are you sure you want to delete this service? ",
                                                                  ),


                                                                  SpaceHelperWidget.v(32.h(context)),


                                                                  /// ===== Buttons Row =====
                                                                  Row(
                                                                    children: [
                                                                      /// No Button

                                                                      Expanded(
                                                                        child: ButtonHelperWidget.customButtonWidget(
                                                                          context: context,
                                                                          onPressed: () async {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          text: "No",
                                                                          borderRadius: 40,
                                                                          backgroundColor: ColorUtils.white243,
                                                                          fontWeight: FontWeight.w600,
                                                                          textColor: ColorUtils.black89,
                                                                          fontSize: 20,
                                                                        ),
                                                                      ),


                                                                      SpaceHelperWidget.h(10.w(context)),


                                                                      Expanded(
                                                                        child: plannerProfileServiceController.isDelete.value == true ?
                                                                        LoadingHelperWidget.loadingHelperWidget(
                                                                          context: context,
                                                                        ) :
                                                                        ButtonHelperWidget.customButtonWidget(
                                                                          context: context,
                                                                          onPressed: () async {
                                                                            plannerProfileServiceController.isDelete.value = true;
                                                                            await plannerProfileServiceController.deletePlannerServiceController(context: context, serviceId: item.sId);
                                                                          },
                                                                          text: "Delete",
                                                                          borderRadius: 40,
                                                                          backgroundColor: ColorUtils.red191,
                                                                          fontWeight: FontWeight.w600,
                                                                          textColor: ColorUtils.white255,
                                                                          fontSize: 20,
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                    );
                                                  },
                                                  text: "Delete",
                                                ),
                                              ),

                                              SpaceHelperWidget.h(16.w(context)),

                                              Expanded(
                                                child: ButtonHelperWidget.customButtonWidgetAdventPro(
                                                  context: context,
                                                  onPressed: () async {
                                                    Get.off(()=>PlannerEditPickLocationPlaceView(serviceId: item.sId),preventDuplicates: false);
                                                  },
                                                  text: "Edit",
                                                  textColor: ColorUtils.blue96,
                                                  backgroundColor: ColorUtils.blue206,
                                                ),
                                              ),


                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: plannerProfileServiceController.plannerGetAllServiceModelResponse.value.data?.length,
                        )
                    ),
                  ),


                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
