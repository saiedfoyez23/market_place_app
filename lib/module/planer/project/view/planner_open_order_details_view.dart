import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerOpenOrderDetailsView extends StatelessWidget {
  const PlannerOpenOrderDetailsView({super.key,required this.orderID});

  final String orderID;

  @override
  Widget build(BuildContext context) {
    PlannerOpenOrderDetailsController plannerOpenOrderDetailsController = Get.put(PlannerOpenOrderDetailsController(orderID: orderID, context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardPlannerView(index: 1),preventDuplicates: false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(()=>Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: plannerOpenOrderDetailsController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardPlannerView(index: 1),preventDuplicates: false);
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
                            text: plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.title ?? "",
                          ),

                          SpaceHelperWidget.v(12.h(context)),


                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            textColor: ColorUtils.black80,
                            text: plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.shortDescription ?? "",
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

                          HtmlWidget(
                            plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.description ?? "",
                          ),

                          // buildSection(
                          //   context: context,
                          //   imageString: ImageUtils.grayRightSignImage,
                          //   title: "Entrance & Welcome Area",
                          //   items: [
                          //     "Welcome board with birthday name & age",
                          //     "Balloon arch / gate decoration",
                          //     "Flower stand or LED frame at entry",
                          //     "Red carpet or themed walkway",
                          //     "Photo booth backdrop",
                          //   ],
                          // ),
                          //
                          // buildSection(
                          //   context: context,
                          //   imageString: ImageUtils.grayRightSignImage,
                          //   title: "Cake & Dessert Section",
                          //   items: [
                          //     "Cake stand & dessert trays",
                          //     "Cake backdrop or arch",
                          //     "LED candles or spotlight on cake",
                          //     "Customized cake topper",
                          //   ],
                          // ),
                          //
                          // buildSection(
                          //   context: context,
                          //   imageString: ImageUtils.grayRightSignImage,
                          //   title: "Photo Zone",
                          //   items: [
                          //     "Themed photo booth with props",
                          //     "Neon light signs (“Let’s Party”, “Cheers”, “Happy Birthday”)",
                          //     "Instax / Polaroid corner for instant photos",
                          //   ],
                          // ),


                          // buildSection(
                          //   context: context,
                          //   imageString: ImageUtils.grayRightSignImage,
                          //   title: "Entrance & Welcome Area",
                          //   items: [
                          //     "Welcome board with birthday name & age",
                          //     "Balloon arch / gate decoration",
                          //     "Flower stand or LED frame at entry",
                          //     "Red carpet or themed walkway",
                          //     "Photo booth backdrop",
                          //   ],
                          // ),
                          //
                          // buildSection(
                          //   context: context,
                          //   imageString: ImageUtils.grayRightSignImage,
                          //   title: "Cake & Dessert Section",
                          //   items: [
                          //     "Cake stand & dessert trays",
                          //     "Cake backdrop or arch",
                          //     "LED candles or spotlight on cake",
                          //     "Customized cake topper",
                          //   ],
                          // ),
                          //
                          // buildSection(
                          //   context: context,
                          //   imageString: ImageUtils.grayRightSignImage,
                          //   title: "Photo Zone",
                          //   items: [
                          //     "Themed photo booth with props",
                          //     "Neon light signs (“Let’s Party”, “Cheers”, “Happy Birthday”)",
                          //     "Instax / Polaroid corner for instant photos",
                          //   ],
                          // ),

                          SpaceHelperWidget.v(20.h(context)),


                          // ----------------------------------------
                          // Order Information Card
                          // ----------------------------------------



                          buildInfoCard(
                            context: context,
                            plannerOpenOrderDetailsController: plannerOpenOrderDetailsController,
                          ),


                          buildVendorCard(
                            context: context,
                            plannerOpenOrderDetailsController: plannerOpenOrderDetailsController,
                          ),


                          SpaceHelperWidget.v(24.h(context)),

                        ],
                      ),
                    )
                ),
              ],
            ),
          )),
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

  Widget buildInfoCard({
    required BuildContext context,
    required PlannerOpenOrderDetailsController plannerOpenOrderDetailsController,
  }) {
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
          infoRow(title: "Deadline", value: "${plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.duration} days", context: context),
          infoRow(title: "Program Start Date", value: "${DateFormat("dd MMM yyyy").format(DateTime.parse(plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.startDate))}", context: context),
          infoRow(title: "Program End Date", value: "${DateFormat("dd MMM yyyy").format(DateTime.parse(plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.endDate))}", context: context),
          infoRow(title: "Location",value: "${plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.address}", context: context),
          infoRow(title: "Total Price", value: "\$${plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.totalAmount}", context: context),
        ],
      ),
    );
  }


  Widget buildVendorCard({
    required BuildContext context,
    required PlannerOpenOrderDetailsController plannerOpenOrderDetailsController,
  }) {
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
            text: "Client Information",
          ),

          SpaceHelperWidget.v(16.h(context)),

          Row(
            children: [

              ImageHelperWidget.circleImageHelperWidget(
                width: 32.w(context),
                height: 32.h(context),
                verticalPadding: 1.vpm(context),
                horizontalPadding: 1.hpm(context),
                backgroundColor: ColorUtils.orange213,
                radius: 25.r(context),
                imageAsset: plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.receiver?.photoUrl == null ? ImageUtils.noImage : null,
                imageUrl: plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.receiver?.photoUrl,
              ),

              SpaceHelperWidget.h(12.w(context)),

              Expanded(
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  textAlign: TextAlign.start,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black48,
                  text: plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.receiver?.name ?? "",
                ),
              ),
              
            ],
          ),

          SpaceHelperWidget.v(16.h(context)),

          infoRow(title: "Phone", value: "${plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.receiver?.contractNumber ?? ""}", context: context),
          infoRow(title: "Email", value: "${plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.receiver?.email ?? ""}", context: context),
          infoRow(title: "Location", value: "${plannerOpenOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.receiver?.address ?? ""}", context: context),
        ],
      ),
    );
  }

  Widget infoRow({
    required String title,
    required String value,
    required BuildContext context,
  }) {
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
                textAlign: TextAlign.end,
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
