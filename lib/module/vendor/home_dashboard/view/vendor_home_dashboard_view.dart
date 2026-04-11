import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorHomeDashboardView extends StatelessWidget {
  VendorHomeDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorHomeDashboardController vendorHomeDashboardController = Get.put(VendorHomeDashboardController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        ExitFormTheAppDialogBox().exitFormTheAppDialogBox(context: context);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white255,
            ),
            child: vendorHomeDashboardController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(context: context,height: 930.h(context)) :
            CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [


                        SpaceHelperWidget.v(32.h(context)),

                        // app bar
                        Row(
                          children: [

                            ImageHelperWidget.circleImageHelperWidget(
                              width: 50.w(context),
                              height: 50.h(context),
                              verticalPadding: 1.vpm(context),
                              horizontalPadding: 1.hpm(context),
                              backgroundColor: ColorUtils.orange213,
                              radius: 25.r(context),
                              imageAsset: vendorHomeDashboardController.vendorMyProfileDetailsResponseModel.value.data?.photoUrl == null ? ImageUtils.noImage : null,
                              imageUrl: vendorHomeDashboardController.vendorMyProfileDetailsResponseModel.value.data?.photoUrl,
                            ),

                            SpaceHelperWidget.h(12.w(context)),


                            Expanded(
                              child: Column(
                                children: [

                                  RichTextHelperWidget.headingRichText(
                                    context: context,
                                    alignment: Alignment.centerLeft,
                                    textSpans: [
                                      CustomTextSpan(
                                          text: 'Hello!! ',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: ColorUtils.black64
                                      ).toTextSpan(),
                                      CustomTextSpan(
                                        text: vendorHomeDashboardController.vendorMyProfileDetailsResponseModel.value.data?.name.toString().split(" ").first ?? "",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: ColorUtils.orange119,
                                      ).toTextSpan(),
                                    ],
                                  ),


                                  SpaceHelperWidget.v(3.h(context)),

                                  TextHelperClass.headingTextWithoutWidth(
                                    context: context,
                                    alignment: Alignment.centerLeft,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    textColor: ColorUtils.black107,
                                    text: vendorHomeDashboardController.vendorMyProfileDetailsResponseModel.value.data?.address ?? "",
                                  ),



                                ],
                              ),
                            ),



                            SpaceHelperWidget.h(15.w(context)),

                            InkWell(
                              onTap: () async {
                                Get.off(()=>VendorNotificationView(),preventDuplicates: false);
                              },
                              child: ImageHelperWidget.assetImageWidget(
                                context: context,
                                height: 50.h(context),
                                width: 50.w(context),
                                imageString: ImageUtils.notificationBellImage,
                              ),
                            ),

                            SpaceHelperWidget.h(15.w(context)),


                          ],
                        ),


                        SpaceHelperWidget.v(32.h(context)),

                      ],
                    ),
                  ),
                ),

                SliverFillRemaining(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      Get.off(()=>DashboardVendorView(index: 0),preventDuplicates: false);
                    },
                    child: CustomScrollView(
                      slivers: [

                        SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SpaceHelperWidget.v(15.h(context)),


                                  // Stats Row 1: Active Bookings & Monthly Revenue
                                  Row(
                                    children: [
                                      Expanded(
                                        child: buildStatCard(
                                          vendorMyProfileDetailsResponseModel: vendorHomeDashboardController.vendorMyProfileDetailsResponseModel.value,
                                          context: context,
                                          icon: ImageUtils.activeBookingsImage,
                                          title: 'Active Bookings',
                                          value: vendorHomeDashboardController.vendorHomePageResponseModel.value.data?.activeBookingCount.toString() ?? "0",
                                          color: ColorUtils.cyan199,
                                        ),
                                      ),

                                      SpaceHelperWidget.h(16.w(context)),


                                      Expanded(
                                        child: buildStatCard(
                                          vendorMyProfileDetailsResponseModel: vendorHomeDashboardController.vendorMyProfileDetailsResponseModel.value,
                                          context: context,
                                          icon: ImageUtils.monthlyRevenueImage,
                                          title: 'Monthly Revenue',
                                          value: vendorHomeDashboardController.vendorHomePageResponseModel.value.data?.monthlyRevenue.toString() ?? "0",
                                          color: ColorUtils.blue96,
                                        ),
                                      ),
                                    ],
                                  ),


                                  SpaceHelperWidget.v(16.h(context)),

                                  // Stats Row 2: Total Bookings & Total Earnings
                                  Row(
                                    children: [
                                      Expanded(
                                        child: buildStatCard(
                                          vendorMyProfileDetailsResponseModel: vendorHomeDashboardController.vendorMyProfileDetailsResponseModel.value,
                                          context: context,
                                          icon: ImageUtils.plannerNewLeadsImage,
                                          title: 'New Leads',
                                          value: vendorHomeDashboardController.vendorHomePageResponseModel.value.data?.totalBookingCount.toString() ?? "0",
                                          color: ColorUtils.green213,
                                        ),
                                      ),

                                      SpaceHelperWidget.h(16.w(context)),

                                      Expanded(
                                        child: buildStatCard(
                                          vendorMyProfileDetailsResponseModel: vendorHomeDashboardController.vendorMyProfileDetailsResponseModel.value,
                                          context: context,
                                          icon: ImageUtils.totalEarningsImage,
                                          title: 'Total Earnings',
                                          value: vendorHomeDashboardController.vendorHomePageResponseModel.value.data?.totalEarnings.toString() ?? "0",
                                          color: ColorUtils.orange213,
                                        ),
                                      ),
                                    ],
                                  ),


                                  // Upcoming Bookings Section

                                  Container(
                                    margin: EdgeInsets.only(top: 32.tpm(context),bottom: 32.bpm(context)),
                                    padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 14.hpm(context)),
                                    decoration: BoxDecoration(
                                      color: ColorUtils.white247,
                                      borderRadius: BorderRadius.circular(20.r(context)),
                                    ),
                                    child: Column(
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [

                                            Expanded(
                                              child: TextHelperClass.headingTextWithoutWidth(
                                                context: context,
                                                alignment: Alignment.centerLeft,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                textColor: ColorUtils.black48,
                                                text: "Upcoming Booking",
                                              ),
                                            ),

                                            SpaceHelperWidget.h(12.w(context)),

                                            ButtonHelperWidget.customButtonWidget(
                                              context: context,
                                              onPressed: () async {
                                                Get.off(()=>DashboardVendorView(index: 2),preventDuplicates: false);
                                              },
                                              text: "See All",
                                              padding: EdgeInsets.only(left: 14.5.lpm(context)),
                                              alignment: Alignment.center,
                                              textColor: ColorUtils.orange119,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              backgroundColor: Colors.transparent,
                                            ),
                                          ],
                                        ),
                                        SpaceHelperWidget.v(12.h(context)),

                                        if(vendorHomeDashboardController.vendorHomePageResponseModel.value.data?.upcomingBooking?.isNotEmpty == true)...[
                                          ...vendorHomeDashboardController.vendorHomePageResponseModel.value.data!.upcomingBooking!.map((booking) => buildBookingCard(booking: booking,context: context)),
                                        ] else...[
                                          TextHelperClass.headingTextWithoutWidth(
                                            context: context,
                                            alignment: Alignment.center,
                                            textAlign: TextAlign.start,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            textColor: ColorUtils.black48,
                                            text: "No Upcoming Booking Available",
                                          ),
                                        ]

                                      ],
                                    ),
                                  ),


                                  Container(
                                    margin: EdgeInsets.only(bottom: 32.bpm(context)),
                                    padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 14.hpm(context)),
                                    decoration: BoxDecoration(
                                      color: ColorUtils.white247,
                                      borderRadius: BorderRadius.circular(20.r(context)),
                                    ),
                                    child: Column(
                                      children: [


                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          textColor: ColorUtils.black48,
                                          text: "Top Partnerships",
                                        ),

                                        SpaceHelperWidget.v(8.h(context)),

                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          textColor: ColorUtils.black48,
                                          text: "Your most collaborated Planer",
                                        ),

                                        const SizedBox(height: 12),

                                        if(vendorHomeDashboardController.vendorHomePageResponseModel.value.data?.topPartnerships?.isNotEmpty == true)...[
                                          ...vendorHomeDashboardController.vendorHomePageResponseModel.value.data!.topPartnerships!.map((partnership) => buildPartnershipCard(partnership: partnership,context: context)),
                                        ] else...[
                                          TextHelperClass.headingTextWithoutWidth(
                                            context: context,
                                            alignment: Alignment.center,
                                            textAlign: TextAlign.start,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            textColor: ColorUtils.black48,
                                            text: "No Top Partnership Available",
                                          ),
                                        ]



                                      ],
                                    ),
                                  ),

                                  // Top Partnerships Section

                                ],
                              ),
                            )
                        ),
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

  Widget buildStatCard({
    required BuildContext context,
    required String icon,
    required String title,
    required String value,
    required Color color,
    required VendorMyProfileDetailsResponseModel vendorMyProfileDetailsResponseModel,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white255,
        borderRadius: BorderRadius.circular(12.r(context)),
        border: Border.all(color: color,width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [

              Expanded(
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black64,
                  text: title,
                ),
              ),

              SpaceHelperWidget.h(10.w(context)),

              ImageHelperWidget.assetImageWidget(
                context: context,
                height: 24.h(context),
                width: 24.w(context),
                imageString: icon,
              ),

            ],
          ),
          SpaceHelperWidget.v(10.h(context)),

          Row(
            children: [

              Expanded(
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black64,
                  text: value,
                ),
              ),

              title == "New Leads" && vendorMyProfileDetailsResponseModel.data?.type != null ?
              ButtonHelperWidget.customButtonWidget(
                context: context,
                fontSize: 14,
                borderRadius: 100,
                fontWeight: FontWeight.w500,
                padding: EdgeInsets.symmetric(vertical: 5.vpm(context),horizontal: 12.hpm(context)),
                height: 40.h(context),
                onPressed: () async {
                  Get.off(()=>VendorLeadView(),preventDuplicates: false);
                },
                text: "View",
              ) :
              SizedBox.shrink(),

            ],
          ),

        ],
      ),
    );
  }

  Widget buildBookingCard({required VendorHomePageResponseUpcomingBooking booking,required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.bpm(context)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ColorUtils.white204,width: 1)),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(top: 8.tpm(context),bottom: 12.bpm(context)),
          overlayColor: Colors.transparent
        ),
        onPressed: () async {
          Get.off(()=>VendorOrderDetailsView(orderID: booking.sId,isLead: false,),preventDuplicates: false);
        },
        child: Row(
          children: [
            ImageHelperWidget.assetImageWidget(
              context: context,
              height: 40.h(context),
              width: 40.w(context),
              imageString: ImageUtils.upcomingBookingImage,
            ),

            SpaceHelperWidget.h(12.w(context)),

            Expanded(
              child: Column(
                children: [

                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    textColor: ColorUtils.black64,
                    text: "${booking.title} - ${booking.type}",
                  ),

                  SpaceHelperWidget.v(8.h(context)),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(
                        child: TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black74,
                          text: DateFormat("MMM dd,yyyy").format(DateTime.parse(booking.startDate)),
                        ),
                      ),


                      booking.status == "completed" ?
                      Row(
                        children: [

                          ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 20.h(context),
                            width: 20.w(context),
                            imageString: ImageUtils.confirmedImage,
                          ),

                          SpaceHelperWidget.h(8.w(context)),

                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            textColor: ColorUtils.green139,
                            text: booking.status,
                          ),

                        ],
                      ) :
                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: ColorUtils.yellow177,
                        text: booking.status == "running" ? "In Process" : booking.status,
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

  Widget buildPartnershipCard({required VendorHomePageResponseTopPartnerships partnership,required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 8.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white255,
        border: Border.all(color: ColorUtils.white215,width: .75),
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black64,
                  text: partnership.plannerName ?? "",
                ),

                SpaceHelperWidget.v(8.h(context)),


                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: ColorUtils.black96,
                  text: "${partnership.orderCount} projects together",
                ),

              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.star_border_sharp, size: 20.r(context)),

              SpaceHelperWidget.h(5.w(context)),

              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textColor: ColorUtils.black64,
                text: partnership.rating.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
