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
                        iconSize: 20,
                        height: 40,
                        padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 16.hpm(context)),
                        borderRadius: 8,
                        textColor: ColorUtils.white255,
                        fontWeight: FontWeight.w700,
                        onPressed: () async {
                          Get.off(()=> PlannerProfileCreateNewServiceView(),preventDuplicates: false,);
                        },
                        iconPath: ImageUtils.addImage,
                        text: "Add Service",
                      ),

                      SpaceHelperWidget.h(15.w(context))

                    ],
                  ),

                  SliverFillRemaining(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                      child: Column(
                        children: [

                          SpaceHelperWidget.v(16.h(context)),

                          buildTabs(context: context,plannerProfileServiceController: plannerProfileServiceController),

                          SpaceHelperWidget.v(26.h(context)),

                          Expanded(
                            child: plannerProfileServiceController.filteredService.isNotEmpty == true ?
                            ListView.builder(
                              itemCount: plannerProfileServiceController.filteredService.length,
                              itemBuilder: (context, index) {
                                return serviceCard(service: plannerProfileServiceController.filteredService[index], context: context,plannerProfileServiceController: plannerProfileServiceController);
                              },
                            ) :
                            Align(
                              alignment: Alignment.center,
                              child: TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.center,
                                textAlign: TextAlign.start,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                textColor: ColorUtils.black48,
                                text: "No Service Available",
                              ),
                            ),
                          ),
                        ],
                      ),
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


  /// ------------------------------
  /// TAB BAR
  /// ------------------------------
  Widget buildTabs({
    required BuildContext context,
    required PlannerProfileServiceController plannerProfileServiceController,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        tabItem(status: PlannerProfileServiceStatus.all, title: "All",context: context, plannerProfileServiceController: plannerProfileServiceController),
        tabItem(status: PlannerProfileServiceStatus.active, title: "Active",context: context, plannerProfileServiceController: plannerProfileServiceController),
        tabItem(status: PlannerProfileServiceStatus.pending, title: "Pending",context: context, plannerProfileServiceController: plannerProfileServiceController),
        tabItem(status: PlannerProfileServiceStatus.denied, title: "Cancelled",context: context, plannerProfileServiceController: plannerProfileServiceController),
      ],
    );
  }

  Widget tabItem({
    required String title,
    required PlannerProfileServiceStatus status,
    required BuildContext context,
    required PlannerProfileServiceController plannerProfileServiceController,
  }) {
    bool isSelected = plannerProfileServiceController.selectedTab.value == status;
    return InkWell(
      onTap: () {
        plannerProfileServiceController.changeTab(status);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.center,
            textAlign: TextAlign.center,
            fontSize: 17,
            fontWeight: isSelected == true ? FontWeight.w600 : FontWeight.w500,
            textColor: isSelected == true ? ColorUtils.orange119 : ColorUtils.black64,
            text: title,
          ),
          SpaceHelperWidget.v(4.h(context)),
          if (isSelected)
            Container(
              height: 3.h(context),
              width: 20.w(context),
              color: ColorUtils.orange119,
            )
        ],
      ),
    );
  }

  /// ------------------------------
  /// BOOKING CARD
  /// ------------------------------
  Widget serviceCard({
    required PlannerGetAllServiceModel service,
    required BuildContext context,
    required PlannerProfileServiceController plannerProfileServiceController,
  }) {
    Color badgeColor = Colors.grey;
    Color textColor = Colors.white;
    String text = "";

    switch (service.status) {
      case "active":
        badgeColor = ColorUtils.green02;
        textColor = ColorUtils.green139;
        text = "Active";
        break;
      case "pending":
        badgeColor = ColorUtils.yellow249;
        textColor = ColorUtils.yellow95;
        text = "Pending";
        break;
      case "denied":
        badgeColor = ColorUtils.red20;
        textColor = ColorUtils.red202;
        text = "Cancelled";
        break;
      default:
        text = "Unknown";
    }

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
      child: InkWell(
        onTap: () async {
          Get.off(()=>PlannerProfileServiceDetailsView(serviceId: service.sId, isProfile: false,),preventDuplicates: false);
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
                  child: service.images?.isEmpty == true ?
                  SpaceHelperWidget.sq(192.h(context), 428.w(context)) :
                  Image.network(
                    service.images!.first,
                    height: 192.h(context),
                    width: 428.w(context),
                    fit: BoxFit.cover,
                  ),
                ),
                plannerProfileServiceController.plannerMyProfileDetailsResponseModel.value.data?.type != null  && text == "Active"?
                Positioned(
                  top: 12.h(context),
                  right: 12.w(context),
                  child: InkWell(
                    onTap: () async {
                      plannerProfileServiceController.isLoading.value = true;
                      await plannerProfileServiceController.addFeaturedController(context: context, serviceId: service.sId);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w(context),
                        vertical: 7.5.h(context),
                      ),
                      decoration: BoxDecoration(
                        color: ColorUtils.white255,
                        borderRadius: BorderRadius.circular(6.r(context)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [


                          ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 16.h(context),
                            width: 16.w(context),
                            imageString: service.isFeatured == true ? ImageUtils.isFevorateImage : ImageUtils.isUnfevorateImage,
                          ),

                          SpaceHelperWidget.h(4.w(context)),


                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            textAlign: TextAlign.start,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            textColor: ColorUtils.black96,
                            text: service.isFeatured == true ? "Remove Featured" : "Add Featured",
                          ),
                        ],
                      ),
                    ),
                  ),
                ) :
                Positioned(
                  top: 12.h(context),
                  right: 12.w(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.hpm(context), vertical: 5.vpm(context)),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(100.r(context)),
                    ),
                    child: TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.center,
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textColor: textColor,
                      text: text,
                    ),
                  ),
                ),
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
                    text: service.title,
                  ),

                  SpaceHelperWidget.v(6.h(context)),


                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    textColor: ColorUtils.black80,
                    text: service.subtitle ?? "",
                    textOverFlow: TextOverflow.ellipsis,
                  ),

                  SpaceHelperWidget.v(12.h(context)),

                  if(service.serviceAreas == null || service.serviceAreas?.isEmpty == true)...[
                    SizedBox.shrink()
                  ] else...[
                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      textAlign: TextAlign.start,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black48,
                      text: "Service Area",
                    ),

                    SpaceHelperWidget.v(10.h(context)),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        runSpacing: 10.h(context),
                        spacing: 10.w(context),
                        children: List.generate(service.serviceAreas!.length, (index) {
                          return IntrinsicWidth(
                            child: TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              containerColor: ColorUtils.blue219,
                              padding: EdgeInsets.symmetric(vertical: 2.vpm(context),horizontal: 8.h(context)),
                              textAlign: TextAlign.start,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              borderRadius: BorderRadius.circular(6.r(context)),
                              textColor: ColorUtils.blue71,
                              text: service.serviceAreas?[index].name ?? '',
                            ),
                          );
                        }),
                      ),
                    ),
                  ],



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
                                                    plannerProfileServiceController.plannerGetAllServiceModelList.clear();
                                                    plannerProfileServiceController.isDelete.value = true;
                                                    await plannerProfileServiceController.deletePlannerServiceController(context: context, serviceId: service.sId);
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
                            Get.off(()=> PlannerProfileServiceEditView(serviceId: service.sId,), preventDuplicates: false,);
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

  }

}
