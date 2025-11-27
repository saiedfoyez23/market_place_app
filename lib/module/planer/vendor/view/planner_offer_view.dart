import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerOfferView extends StatelessWidget {
  PlannerOfferView({super.key});

  final PlannerOfferController plannerOfferController = Get.put(PlannerOfferController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: CustomScrollView(
            slivers : [


              AuthAppBarHelperWidget(
                onBackPressed: () async {
                  Get.off(()=>DashboardPlannerView(index: 2),preventDuplicates: false);
                },
                title: "All Offers",
              ),



              SliverFillRemaining(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperWidget.v(16.h(context)),

                      TextFormFieldWidget.build(
                        context: context,
                        hintText: "Search Planner...",
                        controller: plannerOfferController.searchController.value,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(
                            20.lpm(context),
                            14.5.tpm(context),
                            5.rpm(context),
                            14.5.bpm(context),
                          ),
                          child: ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 20.h(context),
                            width: 20.w(context),
                            imageString: ImageUtils.searchImage,
                          ),
                        ),
                      ),

                      SpaceHelperWidget.v(16.h(context)),


                      buildTabs(context: context),

                      SpaceHelperWidget.v(26.h(context)),

                      Expanded(
                          child: ListView.builder(
                            itemCount: plannerOfferController.filteredBookings.length,
                            itemBuilder: (context, index) {
                              return bookingCard(booking: plannerOfferController.filteredBookings[index],context: context);
                            },
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

  /// ------------------------------
  /// TAB BAR
  /// ------------------------------
  Widget buildTabs({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        tabItem(status: PlannerBookingStatus.all,title: "All",context: context),
        tabItem(status: PlannerBookingStatus.complete,title: "Complete",context: context),
        tabItem(status: PlannerBookingStatus.inProcess,title: "In-Process",context: context),
        tabItem(status: PlannerBookingStatus.pending,title: "Pending",context: context),
      ],
    );
  }

  Widget tabItem({required String title,required PlannerBookingStatus status,required BuildContext context}) {
    bool isSelected = plannerOfferController.selectedTab.value == status;
    return InkWell(
      onTap: () {
        plannerOfferController.changeTab(status);
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
  Widget bookingCard({required PlannerBookingModel booking, required BuildContext context}) {
    Color badgeColor = Colors.grey;
    Color textColor = Colors.white;
    String text = "";

    switch (booking.status) {
      case PlannerBookingStatus.complete:
        badgeColor = ColorUtils.green02;
        textColor = ColorUtils.green139;
        text = "Completed";
        break;
      case PlannerBookingStatus.inProcess:
        badgeColor = ColorUtils.yellow249;
        textColor = ColorUtils.yellow95;
        text = "In-Process";
        break;
      case PlannerBookingStatus.pending:
        badgeColor = ColorUtils.red20;
        textColor = ColorUtils.red202;
        text = "Pending";
        break;
      default:
        break;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white243,
        border: Border.all(color: ColorUtils.white215,width: .5),
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    ImageHelperWidget.circleImageHelperWidget(
                      width: 32.w(context),
                      height: 32.h(context),
                      verticalPadding: 1.vpm(context),
                      horizontalPadding: 1.hpm(context),
                      backgroundColor: ColorUtils.orange213,
                      radius: 25.r(context),
                      imageAsset: ImageUtils.noImage,
                    ),
                    SpaceHelperWidget.h(10.w(context)),
                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      textAlign: TextAlign.start,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black48,
                      text: booking.vendorName,
                    ),
                  ],
                ),
              ),

              SpaceHelperWidget.h(10.w(context)),

              Container(
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
            ],
          ),

          SpaceHelperWidget.v(16.h(context)),


          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: booking.serviceName,
          ),


          SpaceHelperWidget.v(24.h(context)),

          rowItem(title: "${booking.days}",value: "From \$${booking.price}",context: context),
          rowItem(title: "Start Date",value: booking.startDate,context: context),
          rowItem(title: "End Date",value: booking.endDate,context: context),

          SpaceHelperWidget.v(16.h(context)),


          text == "Completed" ?
          Row(
            children: [

              Expanded(
                child: ButtonHelperWidget.customButtonWidgetAdventPro(
                  context: context,
                  onPressed: () async {
                    Get.off(()=>PlannerOrderDetailsView(),preventDuplicates: false);
                  },
                  textColor: ColorUtils.white255,
                  backgroundColor: ColorUtils.blue96,
                  text: "View Details",
                ),
              ),

              SpaceHelperWidget.h(10.w(context)),


              Expanded(
                child: ButtonHelperWidget.customButtonWidgetAdventPro(
                  context: context,
                  onPressed: () async {
                    Get.off(()=>PlannerFeedbackView(),preventDuplicates: false);
                  },
                  textColor: ColorUtils.blue96,
                  backgroundColor: ColorUtils.blue231,
                  text: "Leave Feedback",
                ),
              ),


            ],
          ) :
          text == "Pending" ?
          Row(
            children: [

              Expanded(
                child: ButtonHelperWidget.customButtonWidgetAdventPro(
                  context: context,
                  onPressed: () async {
                    Get.off(()=>PlannerOrderDetailsView(),preventDuplicates: false);
                  },
                  textColor: ColorUtils.blue96,
                  backgroundColor: ColorUtils.blue206,
                  text: "View Order",
                ),
              ),


              SpaceHelperWidget.h(10.w(context)),

              Expanded(
                child: ButtonHelperWidget.customButtonWidgetAdventPro(
                  context: context,
                  onPressed: () async {
                    Get.off(()=>OfferPaymentSuccessView(),preventDuplicates: false);
                  },
                  text: "Accept Order",
                ),
              ),



            ],
          ) :
          ButtonHelperWidget.customButtonWidgetAdventPro(
            context: context,
            onPressed: () async {
              Get.off(()=>PlannerOrderDetailsView(),preventDuplicates: false);
            },
            textColor: ColorUtils.blue96,
            backgroundColor: ColorUtils.blue206,
            text: "View Details",
          ),
        ],
      ),
    );
  }

  Widget rowItem({required String title,required String value,required BuildContext context}) {
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
                fontWeight: FontWeight.w400,
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
