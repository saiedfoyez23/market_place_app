import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class PlannerOrderDetailsView extends StatelessWidget {
  const PlannerOrderDetailsView({super.key,required this.orderID});

  final String orderID;

  @override
  Widget build(BuildContext context) {
    PlannerAllVendorOrderDetailsController plannerAllVendorOrderDetailsController = Get.put(PlannerAllVendorOrderDetailsController(orderID: orderID, context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>PlannerOfferView(),preventDuplicates: false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(()=>Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: plannerAllVendorOrderDetailsController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>PlannerOfferView(),preventDuplicates: false);
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
                            text: plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.title ?? "",
                          ),

                          SpaceHelperWidget.v(12.h(context)),


                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            textColor: ColorUtils.black80,
                            text: plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.shortDescription ?? "",
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
                            plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.description ?? "",
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
                            plannerAllVendorOrderDetailsController: plannerAllVendorOrderDetailsController,
                          ),


                          buildVendorCard(
                            context: context,
                            plannerAllVendorOrderDetailsController: plannerAllVendorOrderDetailsController,
                          ),


                          SpaceHelperWidget.v(24.h(context)),


                          plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.status == "pending" ?
                          Row(
                            children: [

                              Expanded(
                                child: plannerAllVendorOrderDetailsController.isDenied.value == true ?
                                LoadingHelperWidget.loadingHelperWidget(
                                  context: context,
                                ) :
                                ButtonHelperWidget.customButtonWidgetAdventPro(
                                  context: context,
                                  onPressed: () async {
                                    plannerAllVendorOrderDetailsController.isDenied.value = true;
                                    plannerAllVendorOrderDetailsController.deniedOrderStatusController(
                                      context: context,
                                      orderId: orderID,
                                      orderStatus: "denied",
                                    );
                                  },
                                  text: "Denied Offer",
                                  textColor: ColorUtils.red202,
                                  backgroundColor: ColorUtils.red9,
                                ),
                              ),

                              SpaceHelperWidget.h(16.w(context)),

                              Expanded(
                                child: plannerAllVendorOrderDetailsController.isUpdate.value == true ?
                                LoadingHelperWidget.loadingHelperWidget(
                                  context: context,
                                ) :
                                ButtonHelperWidget.customButtonWidgetAdventPro(
                                  context: context,
                                  onPressed: () async {
                                    plannerAllVendorOrderDetailsController.isUpdate.value = true;
                                    plannerAllVendorOrderDetailsController.updateOrderStatusController(
                                      context: context,
                                      orderId: orderID,
                                      orderStatus: "running",
                                    );
                                    //Get.off(()=>OfferPaymentSuccessView(),preventDuplicates: false);
                                  },
                                  text: "Accept Order",
                                ),
                              ),

                            ],
                          ) :
                          plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.status == "running" ?
                          ButtonHelperWidget.customButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              Get.off(()=>PlannerCancelOfferView(orderID: orderID),preventDuplicates: false);
                            },
                            text: "Cancel Offer",
                          ) :
                          plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.status == "completed" ?
                          ButtonHelperWidget.customButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              Get.off(()=>PlannerFeedbackView(
                                orderId: orderID,
                                senderId: plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.sender?.sId ?? "",
                              ),preventDuplicates: false);
                            },
                            textColor: ColorUtils.blue96,
                            backgroundColor: ColorUtils.blue231,
                            text: "Leave Feedback",
                          ) :
                          SizedBox.shrink(),



                          SpaceHelperWidget.v(40.h(context)),


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
    required PlannerAllVendorOrderDetailsController plannerAllVendorOrderDetailsController,
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
          infoRow(title: "Deadline", value: "${plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.duration} days", context: context),
          infoRow(title: "Program Start Date", value: "${DateFormat("dd MMM yyyy").format(DateTime.parse(plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.startDate))}", context: context),
          infoRow(title: "Program End Date", value: "${DateFormat("dd MMM yyyy").format(DateTime.parse(plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.endDate))}", context: context),
          infoRow(title: "Location",value: "${plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.address}", context: context),
          infoRow(title: "Total Price", value: "R${plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.totalAmount}", context: context),
        ],
      ),
    );
  }

  Widget buildVendorCard({required BuildContext context,required PlannerAllVendorOrderDetailsController plannerAllVendorOrderDetailsController}) {
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
            text: "Vendor Information",
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
                imageAsset: plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.sender?.photoUrl == null ? ImageUtils.noImage : null,
                imageUrl: plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.sender?.photoUrl,
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
                  text: plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.sender?.name ?? "",
                ),
              ),

              SpaceHelperWidget.h(6.w(context)),

              plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.sender?.isKycVerified == true ?
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.hpm(context),vertical: 2.vpm(context)),
                decoration: BoxDecoration(
                  color: ColorUtils.blue219,
                  borderRadius: BorderRadius.circular(6.r(context)),
                ),
                child: Row(
                  children: [

                    ImageHelperWidget.assetImageWidget(
                      context: context,
                      height: 17.h(context),
                      width: 17.w(context),
                      imageString: ImageUtils.verifyImage,
                    ),

                    SpaceHelperWidget.h(6.w(context)),

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      textAlign: TextAlign.start,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: ColorUtils.black48,
                      text: "Verified",
                    ),


                  ],
                ),
              ) :
              SizedBox.shrink(),


            ],
          ),

          SpaceHelperWidget.v(14.h(context)),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                containerColor: ColorUtils.blue219,
                padding: EdgeInsets.symmetric(vertical: 2.vpm(context),horizontal: 8.h(context)),
                textAlign: TextAlign.start,
                fontSize: 17,
                fontWeight: FontWeight.w400,
                borderRadius: BorderRadius.circular(6.r(context)),
                textColor: ColorUtils.blue71,
                text: plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.sender?.categories?.first ?? "",
              ),



              SpaceHelperWidget.h(6.w(context)),

              Row(
                children: [
                  Icon(Icons.star, color: ColorUtils.yellow199, size: 20.r(context)),
                  SpaceHelperWidget.h(6.w(context)),
                  RichTextHelperWidget.headingWithoutWidthRichText(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textSpans: [
                      CustomTextSpan(
                        text: '${plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.sender?.avgRating} ',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black10,
                      ).toTextSpan(),
                      CustomTextSpan(
                        text: '(${plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.sender?.ratingCount} reviews)',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorUtils.black10,
                      ).toTextSpan(),
                    ],
                  ),
                ],
              ),


            ],
          ),


          SpaceHelperWidget.v(16.h(context)),

          infoRow(title: "Phone", value: "${plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.sender?.contractNumber}", context: context),
          infoRow(title: "Email", value: "${plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.sender?.email}", context: context),
          infoRow(title: "Location", value: "${plannerAllVendorOrderDetailsController.plannerAllVendorOrderDetailsResponseModel.value.data?.sender?.address}", context: context),
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
