import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class ProfileNotificationView extends StatelessWidget {
  ProfileNotificationView({super.key});

  final ProfileNotificationController profileNotificationController = Get.put(ProfileNotificationController());

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
                  Get.off(()=>DashboardUserView(index: 4,),preventDuplicates: false);
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
                        value: profileNotificationController.newBookings.value,
                        onChanged: (v) {
                          profileNotificationController.newBookings.value = v;
                        },
                        context: context,
                      ),

                      ProfileNotificationWidget.buildSettingRow(
                        title: "New Messages",
                        subtitle: "Notify me when I receive a new message.",
                        value: profileNotificationController.newMessages.value,
                        onChanged: (v) {
                          profileNotificationController.newMessages.value = v;
                        },
                        context: context,
                      ),
                      ProfileNotificationWidget.buildSettingRow(
                        title: "Booking Status Changes",
                        subtitle: "Notify me of confirmations or cancellations.",
                        value: profileNotificationController.bookingStatus.value,
                        onChanged: (v) {
                          profileNotificationController.bookingStatus.value = v;
                        },
                        context: context,
                      ),
                      ProfileNotificationWidget.buildSettingRow(
                        title: "New Reviews",
                        subtitle: "Notify me when a client leaves a review.",
                        value: profileNotificationController.newReviews.value,
                        onChanged: (v) {
                          profileNotificationController.newReviews.value = v;
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

