import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorProfileNotificationView extends StatelessWidget {
  VendorProfileNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorProfileNotificationController vendorProfileNotificationController = Get.put(VendorProfileNotificationController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardVendorView(index: 5),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: vendorProfileNotificationController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
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
                          onChanged: (v) async {
                            vendorProfileNotificationController.newBookings.value = v;
                            await vendorProfileNotificationController.updateVendorChangeNotifyController(context: context);
                          },
                          context: context,
                        ),

                        ProfileNotificationWidget.buildSettingRow(
                          title: "New Service",
                          subtitle: "Notify me when I receive a new service.",
                          value: vendorProfileNotificationController.newService.value,
                          onChanged: (v) async {
                            vendorProfileNotificationController.newService.value = v;
                            await vendorProfileNotificationController.updateVendorChangeNotifyController(context: context);
                          },
                          context: context,
                        ),

                        ProfileNotificationWidget.buildSettingRow(
                          title: "Profile",
                          subtitle: "Notify me of any profile related notification.",
                          value: vendorProfileNotificationController.newProfile.value,
                          onChanged: (v) async {
                            vendorProfileNotificationController.newProfile.value = v;
                            await vendorProfileNotificationController.updateVendorChangeNotifyController(context: context);
                          },
                          context: context,
                        ),

                        ProfileNotificationWidget.buildSettingRow(
                          title: "New Subscription",
                          subtitle: "Notify me when when I receive a new subscription.",
                          value: vendorProfileNotificationController.newSubscription.value,
                          onChanged: (v) async {
                            vendorProfileNotificationController.newSubscription.value = v;
                            await vendorProfileNotificationController.updateVendorChangeNotifyController(context: context);
                          },
                          context: context,
                        ),


                        ProfileNotificationWidget.buildSettingRow(
                          title: "New payment",
                          subtitle: "Notify me when when I receive a new payment.",
                          value: vendorProfileNotificationController.newPayment.value,
                          onChanged: (v) async {
                            vendorProfileNotificationController.newPayment.value = v;
                            await vendorProfileNotificationController.updateVendorChangeNotifyController(context: context);
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
      ),
    );
  }
}
