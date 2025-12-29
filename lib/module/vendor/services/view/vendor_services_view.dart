import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';


class VendorServicesView extends StatelessWidget {
  VendorServicesView({super.key});

  final VendorServiceController vendorServiceController = Get.put(VendorServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 930.h(context),
        width: 428.w(context),
        decoration: BoxDecoration(
          color: ColorUtils.white251,
        ),
        child: CustomScrollView(
          slivers: [

            MainPageAppBarHelperWidget(
              centerTitle: false,
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
                    Get.off(()=>VendorPickLocationPlaceView(),preventDuplicates: false);
                    //Get.off(()=>VendorCreateNewServiceView(),preventDuplicates: false);
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
                      final item = vendorServiceController.serviceList[index];

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
                                  child: Image.asset(
                                    item["image"],
                                    height: 192.h(context),
                                    width: 428.w(context),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 12.h(context),
                                  right: 12.w(context),
                                  child: ImageHelperWidget.assetImageWidget(
                                    context: context,
                                    height: 26.h(context),
                                    width: 26.w(context),
                                    imageString: ImageUtils.serviceLoveImage,
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
                                    text: item["title"],
                                  ),

                                  SpaceHelperWidget.v(6.h(context)),


                                  TextHelperClass.headingTextWithoutWidth(
                                    context: context,
                                    alignment: Alignment.centerLeft,
                                    textAlign: TextAlign.start,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    textColor: ColorUtils.black80,
                                    text: item["description"],
                                  ),


                                  SpaceHelperWidget.v(12.h(context)),

                                  Row(
                                    children: [
                                      ImageHelperWidget.assetImageWidget(
                                        context: context,
                                        height: 21.h(context),
                                        width: 21.w(context),
                                        imageString: ImageUtils.locationImage,
                                      ),

                                      SpaceHelperWidget.h(8.w(context)),


                                      TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        alignment: Alignment.centerLeft,
                                        textAlign: TextAlign.start,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        textColor: ColorUtils.black94,
                                        text: item["location"],
                                      ),


                                    ],
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
                                                return Dialog(
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
                                                                child: ButtonHelperWidget.customButtonWidget(
                                                                  context: context,
                                                                  onPressed: () async {
                                                                    Navigator.pop(context);
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
                                                );
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
                                            Get.off(()=>DashboardVendorView(index: 1),preventDuplicates: false);
                                          },
                                          text: "Cancel",
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
                      );
                    },
                    childCount: vendorServiceController.serviceList.length,
                  )
              ),
            ),


          ],
        ),
      ),
    );
  }
}
