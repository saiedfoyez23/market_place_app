import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class UserOrderDetailsView extends StatelessWidget {
  const UserOrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  Get.off(()=>DashboardUserView(index: 1),preventDuplicates: false);
                },
                title: "Order Details",
              ),

              SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [
                        SpaceHelperWidget.v(16.h(context)),
                        // ----------------------------------------
                        // Title
                        // ----------------------------------------

                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          textAlign: TextAlign.start,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.black48,
                          text: "Kids Birthday Party Extravaganza",
                        ),

                        SpaceHelperWidget.v(12.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          textAlign: TextAlign.start,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black80,
                          text: "Colorful themed decorations with games, entertainment, and birthday cake arrangement. "
                              "Using a mass messaging platform allows event planners to reach their entire audience in just a few clicks.",
                        ),


                        SpaceHelperWidget.v(24.h(context)),



                        // ----------------------------------------
                        // About This Order Section
                        // ----------------------------------------

                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          textAlign: TextAlign.start,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.black48,
                          text: "About this Order",
                        ),


                        SpaceHelperWidget.v(20.h(context)),

                        buildSection(
                          context: context,
                          imageString: ImageUtils.grayRightSignImage,
                          title: "Entrance & Welcome Area",
                          items: [
                            "Welcome board with birthday name & age",
                            "Balloon arch / gate decoration",
                            "Flower stand or LED frame at entry",
                            "Red carpet or themed walkway",
                            "Photo booth backdrop",
                          ],
                        ),

                        buildSection(
                          context: context,
                          imageString: ImageUtils.grayRightSignImage,
                          title: "Cake & Dessert Section",
                          items: [
                            "Cake stand & dessert trays",
                            "Cake backdrop or arch",
                            "LED candles or spotlight on cake",
                            "Customized cake topper",
                          ],
                        ),

                        buildSection(
                          context: context,
                          imageString: ImageUtils.grayRightSignImage,
                          title: "Photo Zone",
                          items: [
                            "Themed photo booth with props",
                            "Neon light signs (“Let’s Party”, “Cheers”, “Happy Birthday”)",
                            "Instax / Polaroid corner for instant photos",
                          ],
                        ),

                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          textAlign: TextAlign.start,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.black48,
                          text: "About this Service",
                        ),


                        SpaceHelperWidget.v(20.h(context)),

                        buildSection(
                          context: context,
                          imageString: ImageUtils.grayRightSignImage,
                          title: "Entrance & Welcome Area",
                          items: [
                            "Welcome board with birthday name & age",
                            "Balloon arch / gate decoration",
                            "Flower stand or LED frame at entry",
                            "Red carpet or themed walkway",
                            "Photo booth backdrop",
                          ],
                        ),

                        buildSection(
                          context: context,
                          imageString: ImageUtils.grayRightSignImage,
                          title: "Cake & Dessert Section",
                          items: [
                            "Cake stand & dessert trays",
                            "Cake backdrop or arch",
                            "LED candles or spotlight on cake",
                            "Customized cake topper",
                          ],
                        ),

                        buildSection(
                          context: context,
                          imageString: ImageUtils.grayRightSignImage,
                          title: "Photo Zone",
                          items: [
                            "Themed photo booth with props",
                            "Neon light signs (“Let’s Party”, “Cheers”, “Happy Birthday”)",
                            "Instax / Polaroid corner for instant photos",
                          ],
                        ),

                        // ----------------------------------------
                        // Order Information Card
                        // ----------------------------------------


                        Container(
                          margin: EdgeInsets.only(bottom: 20.bpm(context)),
                          padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 20.hpm(context)),
                          decoration: BoxDecoration(
                            color: ColorUtils.white243,
                            borderRadius: BorderRadius.circular(12.r(context)),
                          ),
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
                                text: "Note :",
                              ),

                              SpaceHelperWidget.v(16.h(context)),

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                textAlign: TextAlign.start,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black48,
                                text: "If you want to continue this order, you’ll need to make a 50% payment.",
                              ),
                            ],
                          ),
                        ),


                        buildInfoCard(context: context),


                        SpaceHelperWidget.v(24.h(context)),

                        Row(
                          children: [

                            Expanded(
                              child: ButtonHelperWidget.customButtonWidgetAdventPro(
                                context: context,
                                onPressed: () async {
                                  Get.off(()=>DashboardUserView(index: 1),preventDuplicates: false);
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
                                  Get.off(()=>BookingPaymentSuccessView(),preventDuplicates: false);
                                },
                                text: "Accept Oder",
                              ),
                            ),

                          ],
                        ),


                        SpaceHelperWidget.v(40.h(context)),


                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildSection({
    required BuildContext context,
    required String imageString,
    required String title,
    required List<String> items,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.bpm(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelperWidget.assetImageWidget(
                context: context,
                height: 24.h(context),
                width: 24.w(context),
                imageString: imageString,
              ),

              SpaceHelperWidget.h(10.w(context)),


              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                textAlign: TextAlign.start,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textColor: ColorUtils.black48,
                text: title,
              ),

            ],
          ),
          SpaceHelperWidget.v(16.h(context)),


          ...items.map((text) => Padding(
            padding: EdgeInsets.only(left: 32.lpm(context), bottom: 8.bpm(context)),
            child: Row(
              children: [
                Icon(Icons.circle, size: 10.r(context), color: ColorUtils.blue96),

                SpaceHelperWidget.h(10.w(context)),

                Expanded(
                  child: TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    textColor: ColorUtils.black80,
                    text: text,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget buildInfoCard({required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 20.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white243,
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
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
            text: "Order Information",
          ),

          SpaceHelperWidget.v(16.h(context)),
          infoRow(title: "Deadline", value: "5 days", context: context),
          infoRow(title: "Program Start Date", value: "28 Oct 2025", context: context),
          infoRow(title: "Program End Date", value: "02 Nov 2025", context: context),
          infoRow(title: "First Payment",value: "\$150", context: context),
          infoRow(title: "Total Price", value: "\$300", context: context),
        ],
      ),
    );
  }

  Widget buildPlannerCard({required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 20.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white243,
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
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
            text: "Planner Information",
          ),

          SpaceHelperWidget.v(16.h(context)),

          infoRow(title: "Name", value: "Shahid Hasan Shimul", context: context),
          infoRow(title: "Email", value: "shahidhasn@gmail.com", context: context),
          infoRow(title: "Phone", value: "+880 1235 6459", context: context),
          infoRow(title: "Location", value: "Malibu Beach Resort, CA", context: context),
        ],
      ),
    );
  }

  Widget infoRow({required String title,required String value,required BuildContext context}) {
    return Column(
      children: [

        Row(
          children: [
            Expanded(
              child: TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                textAlign: TextAlign.start,
                fontSize: 17,
                fontWeight: FontWeight.w400,
                textColor: ColorUtils.black48,
                text: title,
              ),
            ),

            SpaceHelperWidget.h(10.w(context)),

            Expanded(
              child: TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerRight,
                textAlign: TextAlign.start,
                fontSize: 17,
                fontWeight: FontWeight.w500,
                textColor: ColorUtils.black48,
                text: value,
              ),
            ),
          ],
        ),



        SpaceHelperWidget.v(3.h(context)),

        Divider(
          thickness: 1,
          color: ColorUtils.gray194,
        ),

        SpaceHelperWidget.v(7.h(context)),




      ],
    );
  }

}
