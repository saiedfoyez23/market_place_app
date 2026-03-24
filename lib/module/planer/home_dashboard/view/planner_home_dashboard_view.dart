import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerHomeDashboardView extends StatelessWidget {
  PlannerHomeDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final PlannerHomeDashboardController plannerHomeDashboardController = Get.put(PlannerHomeDashboardController(context: context));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: plannerHomeDashboardController.isLoading.value == true ?
          LoadingHelperWidget.loadingHelperWidget(context: context,height: 930.h(context)) :
          CustomScrollView(
            physics: NeverScrollableScrollPhysics(),
            slivers: [

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperWidget.v(15.h(context)),
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
                            imageAsset: plannerHomeDashboardController.plannerMyProfileDetailsResponseModel.value.data?.photoUrl == null ? ImageUtils.noImage : null,
                            imageUrl: plannerHomeDashboardController.plannerMyProfileDetailsResponseModel.value.data?.photoUrl,
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
                                      text: 'Good Morning! ',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: ColorUtils.black64,
                                    ).toTextSpan(),
                                    CustomTextSpan(
                                      text: plannerHomeDashboardController.plannerMyProfileDetailsResponseModel.value.data?.name.toString().split(" ").first ?? "",
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
                                  text: "Qualisha Creations",
                                ),



                              ],
                            ),
                          ),


                          SpaceHelperWidget.h(15.w(context)),

                          InkWell(
                            onTap: () async {
                              Get.off(()=>PlannerNotificationView(),preventDuplicates: false);
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

                      SpaceHelperWidget.v(15.h(context)),

                    ],
                  ),
                ),
              ),


              SliverFillRemaining(
                child: RefreshIndicator(
                  onRefresh: () async {
                    Get.off(()=>DashboardPlannerView(index: 0),preventDuplicates: false);
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
                                        plannerMyProfileDetailsResponseModel: plannerHomeDashboardController.plannerMyProfileDetailsResponseModel.value,
                                        context: context,
                                        icon: ImageUtils.plannerActiveProjectImage,
                                        title: 'Active Project',
                                        value: plannerHomeDashboardController.getPlannerMetaResponseModel.value.data!.activeProjectCount.toString(),
                                        color: ColorUtils.cyan199,
                                      ),
                                    ),

                                    SpaceHelperWidget.h(16.w(context)),


                                    Expanded(
                                      child: buildStatCard(
                                        plannerMyProfileDetailsResponseModel: plannerHomeDashboardController.plannerMyProfileDetailsResponseModel.value,
                                        context: context,
                                        icon: ImageUtils.plannerUpcomingEventImage,
                                        title: 'Upcoming Event',
                                        value: plannerHomeDashboardController.getPlannerMetaResponseModel.value.data!.upcomingEventCount.toString(),
                                        color: ColorUtils.blue206,
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
                                        plannerMyProfileDetailsResponseModel: plannerHomeDashboardController.plannerMyProfileDetailsResponseModel.value,
                                        context: context,
                                        icon: ImageUtils.plannerNewLeadsImage,
                                        title: 'New Leads',
                                        value: plannerHomeDashboardController.getPlannerMetaResponseModel.value.data!.newLeadCount.toString(),
                                        color: ColorUtils.green213,
                                      ),
                                    ),

                                    SpaceHelperWidget.h(16.w(context)),

                                    Expanded(
                                      child: buildStatCard(
                                        plannerMyProfileDetailsResponseModel: plannerHomeDashboardController.plannerMyProfileDetailsResponseModel.value,
                                        context: context,
                                        icon: ImageUtils.plannerTotalEarningsImage,
                                        title: 'Total Earnings',
                                        value: plannerHomeDashboardController.getPlannerMetaResponseModel.value.data!.totalEarnings.toString(),
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
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              textColor: ColorUtils.black48,
                                              text: "Upcoming Booking",
                                            ),
                                          ),

                                          SpaceHelperWidget.h(12.w(context)),

                                          ButtonHelperWidget.customButtonWidget(
                                            context: context,
                                            onPressed: () async {
                                              Get.off(()=>DashboardPlannerView(index: 1),preventDuplicates: false);
                                            },
                                            text: "See All",
                                            padding: EdgeInsets.only(left: 14.5.lpm(context)),
                                            alignment: Alignment.center,
                                            textColor: ColorUtils.orange119,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24,
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ],
                                      ),
                                      SpaceHelperWidget.v(12.h(context)),

                                      if(plannerHomeDashboardController.getPlannerMetaResponseModel.value.data?.upcomingEvents?.isNotEmpty == true)...[
                                        ...plannerHomeDashboardController.getPlannerMetaResponseModel.value.data!.upcomingEvents!.map((booking) => buildBookingCard(booking: booking,context: context)).toList(),
                                      ] else...[
                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.center,
                                          textAlign: TextAlign.start,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          textColor: ColorUtils.black48,
                                          text: "No Upcoming Event Available",
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        textColor: ColorUtils.black48,
                                        text: "Recent Activities",
                                      ),


                                      SpaceHelperWidget.v(12.h(context)),

                                      if(plannerHomeDashboardController.getPlannerMetaResponseModel.value.data?.recentNotification?.isNotEmpty == true)...[
                                        ...plannerHomeDashboardController.getPlannerMetaResponseModel.value.data!.recentNotification!.map((partnership) => buildPartnershipCard(partnership: partnership,context: context,plannerHomeDashboardController: plannerHomeDashboardController)),
                                      ] else...[
                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.center,
                                          textAlign: TextAlign.start,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          textColor: ColorUtils.black48,
                                          text: "No Recent Activities Available",
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
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildStatCard({
    required BuildContext context,
    required String icon,
    required String title,
    required String value,
    required Color color,
    required PlannerMyProfileDetailsResponseModel plannerMyProfileDetailsResponseModel,
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
                  fontSize: 18,
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
                  fontWeight: FontWeight.w600,
                  textColor: ColorUtils.black64,
                  text: value,
                ),
              ),

              title == "New Leads" && plannerMyProfileDetailsResponseModel.data?.type != null ?
              ButtonHelperWidget.customButtonWidget(
                context: context,
                borderRadius: 100,
                padding: EdgeInsets.symmetric(vertical: 5.vpm(context),horizontal: 12.hpm(context)),
                height: 40.h(context),
                onPressed: () async {
                  Get.off(()=>PlannerLeadView(),preventDuplicates: false);
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

  Widget buildBookingCard({required GetPlannerMetaResponseUpcomingEvents booking,required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.bpm(context)),
      padding: EdgeInsets.only(top: 8.tpm(context),bottom: 12.bpm(context)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ColorUtils.white204,width: 1)),
      ),
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
    );
  }

  Widget buildPartnershipCard({
    required GetPlannerMetaResponseRecentNotification partnership,
    required BuildContext context,
    required PlannerHomeDashboardController plannerHomeDashboardController
  }) {
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

          Container(
            height: 50.h(context),
            width: 50.w(context),
            decoration: BoxDecoration(
              color: Color.fromRGBO(243, 243, 245, 1),
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    partnership.modelType == "Withdraw" ?
                    ImageUtils.withdrawNotificationImage :
                    partnership.modelType == "Subscription" ?
                    ImageUtils.subcriptionNotificationImage :
                    partnership.modelType == "User" ?
                    ImageUtils.userNotificationImage :
                    partnership.modelType == "KYC" ?
                    ImageUtils.kycNotificationImage :
                    partnership.modelType == "Order" ?
                    ImageUtils.orderNotificationImage :
                    partnership.modelType == "Auth" ?
                    ImageUtils.verifyKycNotificationImage :
                    partnership.modelType == "Service" ?
                    ImageUtils.serviceNotificationImage :
                    partnership.modelType == "AssignProject" ?
                    ImageUtils.projectNotificationImage :
                    partnership.modelType == "Chat" ?
                    ImageUtils.chatNotificationImage :
                    partnership.modelType == "Payment" ?
                    ImageUtils.paymentNotificationImage :
                    ImageUtils.refundNotificationImage,
                    height: 25.h(context),
                    width: 25.w(context),
                    fit: BoxFit.contain,
                    color: Color.fromRGBO(252, 119, 87, 1),
                  )
              ),
            ),
          ),


          SpaceHelperWidget.h(12.w(context)),


          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black64,
                  text: partnership.message,
                ),

                SpaceHelperWidget.v(8.h(context)),


                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textColor: ColorUtils.black96,
                  text: plannerHomeDashboardController.getDynamicTime(partnership.createdAt.toString(), DateTime.now().toString()),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
