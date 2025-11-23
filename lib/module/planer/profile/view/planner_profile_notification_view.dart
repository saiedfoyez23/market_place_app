import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class PlannerProfileNotificationView extends StatelessWidget {
  PlannerProfileNotificationView({super.key});

  final PlannerProfileNotificationController plannerProfileNotificationController = Get.put(PlannerProfileNotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>SafeArea(
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
                  Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
                },
                title: "Notification",
              ),



              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperWidget.v(32.h(context)),

                      ProfileNotificationWidget.buildSettingRow(
                        title: "New Bookings",
                        subtitle: "Notify me about new booking requests.",
                        value: plannerProfileNotificationController.newBookings.value,
                        onChanged: (v) {
                          plannerProfileNotificationController.newBookings.value = v;
                        },
                        context: context,
                      ),

                      ProfileNotificationWidget.buildSettingRow(
                        title: "New Messages",
                        subtitle: "Notify me when I receive a new message.",
                        value: plannerProfileNotificationController.newMessages.value,
                        onChanged: (v) {
                          plannerProfileNotificationController.newMessages.value = v;
                        },
                        context: context,
                      ),
                      ProfileNotificationWidget.buildSettingRow(
                        title: "Booking Status Changes",
                        subtitle: "Notify me of confirmations or cancellations.",
                        value: plannerProfileNotificationController.bookingStatus.value,
                        onChanged: (v) {
                          plannerProfileNotificationController.bookingStatus.value = v;
                        },
                        context: context,
                      ),
                      ProfileNotificationWidget.buildSettingRow(
                        title: "New Reviews",
                        subtitle: "Notify me when a client leaves a review.",
                        value: plannerProfileNotificationController.newReviews.value,
                        onChanged: (v) {
                          plannerProfileNotificationController.newReviews.value = v;
                        },
                        context: context,
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
}
