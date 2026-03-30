import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';


class VendorServicesView extends StatelessWidget {
  VendorServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorServiceController vendorServiceController = Get.put(VendorServiceController(context: context));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: vendorServiceController.isLoading.value == true ?
          LoadingHelperWidget.loadingHelperWidget(
            context: context,
            height: 930.h(context),
          ) :
          RefreshIndicator(
            onRefresh: () async {
              Get.off(()=>DashboardVendorView(index: 1),preventDuplicates: false);
            },
            child: CustomScrollView(
              slivers: [

                MainPageAppBarHelperWidget(
                  centerTitle: false,
                  title: "My Services",
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
                        Get.off(()=>VendorPickLocationPlaceView(),preventDuplicates: false);
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

                        buildTabs(context: context,vendorServiceController: vendorServiceController),

                        SpaceHelperWidget.v(26.h(context)),

                        Expanded(
                          child: vendorServiceController.filteredService.isNotEmpty == true ?
                          ListView.builder(
                            itemCount: vendorServiceController.filteredService.length,
                            itemBuilder: (context, index) {
                              return serviceCard(service: vendorServiceController.filteredService[index], context: context,vendorServiceController: vendorServiceController);
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
    );
  }



  /// ------------------------------
  /// TAB BAR
  /// ------------------------------
  Widget buildTabs({
    required BuildContext context,
    required VendorServiceController vendorServiceController,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        tabItem(status: VendorServiceStatus.all, title: "All",context: context, vendorServiceController: vendorServiceController),
        tabItem(status: VendorServiceStatus.active, title: "Active",context: context, vendorServiceController: vendorServiceController),
        tabItem(status: VendorServiceStatus.pending, title: "Pending",context: context, vendorServiceController: vendorServiceController),
        tabItem(status: VendorServiceStatus.denied, title: "Cancelled",context: context, vendorServiceController: vendorServiceController),
      ],
    );
  }

  Widget tabItem({
    required String title,
    required VendorServiceStatus status,
    required BuildContext context,
    required VendorServiceController vendorServiceController,
  }) {
    bool isSelected = vendorServiceController.selectedTab.value == status;
    return InkWell(
      onTap: () {
        vendorServiceController.changeTab(status);
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
    required VendorGetAllServiceModel service,
    required BuildContext context,
    required VendorServiceController vendorServiceController,
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
          Get.off(()=>VendorServiceDetailsView(serviceId: service.sId),preventDuplicates: false);
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
                vendorServiceController.vendorMyProfileDetailsResponseModel.value.data?.type == "pro"  && text == "Active"?
                Positioned(
                  top: 12.h(context),
                  right: 12.w(context),
                  child: InkWell(
                    onTap: () async {
                      await vendorServiceController.addFeaturedController(context: context, serviceId: service.sId);
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
                      fontSize: 18,
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
                  ),


                  SpaceHelperWidget.v(12.h(context)),

                  InkWell(
                    onTap: () async {
                      if (await canLaunchUrl(Uri.parse(service.locationUrl))) {
                        await launchUrl(Uri.parse(service.locationUrl), mode: LaunchMode.externalApplication);
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
                            text: service.address,
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
                                                child: vendorServiceController.isDelete.value == true ?
                                                LoadingHelperWidget.loadingHelperWidget(
                                                  context: context,
                                                ) :
                                                ButtonHelperWidget.customButtonWidget(
                                                  context: context,
                                                  onPressed: () async {
                                                    vendorServiceController.vendorGetAllServiceModelList.clear();
                                                    vendorServiceController.isDelete.value = true;
                                                    await vendorServiceController.deleteVendorServiceController(context: context, serviceId: service.sId);
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
                            Get.off(()=>VendorEditPickLocationPlaceView(serviceId: service.sId),preventDuplicates: false);
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
