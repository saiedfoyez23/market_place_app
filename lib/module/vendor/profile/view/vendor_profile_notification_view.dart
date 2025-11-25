import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorProfileNotificationView extends StatelessWidget {
  VendorProfileNotificationView({super.key});

  final VendorProfileNotificationController vendorProfileNotificationController = Get.put(VendorProfileNotificationController());

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
                  Get.off(()=>DashboardVendorView(index: 5),preventDuplicates: false);
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
                        value: vendorProfileNotificationController.newBookings.value,
                        onChanged: (v) {
                          vendorProfileNotificationController.newBookings.value = v;
                        },
                        context: context,
                      ),

                      ProfileNotificationWidget.buildSettingRow(
                        title: "New Messages",
                        subtitle: "Notify me when I receive a new message.",
                        value: vendorProfileNotificationController.newMessages.value,
                        onChanged: (v) {
                          vendorProfileNotificationController.newMessages.value = v;
                        },
                        context: context,
                      ),

                      ProfileNotificationWidget.buildSettingRow(
                        title: "Booking Status Changes",
                        subtitle: "Notify me of confirmations or cancellations.",
                        value: vendorProfileNotificationController.bookingStatus.value,
                        onChanged: (v) {
                          vendorProfileNotificationController.bookingStatus.value = v;
                        },
                        context: context,
                      ),

                      ProfileNotificationWidget.buildSettingRow(
                        title: "New Reviews",
                        subtitle: "Notify me when a client leaves a review.",
                        value: vendorProfileNotificationController.newReviews.value,
                        onChanged: (v) {
                          vendorProfileNotificationController.newReviews.value = v;
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
