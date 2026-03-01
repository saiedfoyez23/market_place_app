import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class PlannerProfileNotificationView extends StatelessWidget {
  PlannerProfileNotificationView({super.key});


  @override
  Widget build(BuildContext context) {
    final PlannerProfileNotificationController plannerProfileNotificationController = Get.put(PlannerProfileNotificationController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: plannerProfileNotificationController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
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
                          onChanged: (v) async {
                            plannerProfileNotificationController.newBookings.value = v;
                            await plannerProfileNotificationController.updatePlannerChangeNotifyController(context: context);
                          },
                          context: context,
                        ),

                        ProfileNotificationWidget.buildSettingRow(
                          title: "New Service",
                          subtitle: "Notify me when I receive a new service.",
                          value: plannerProfileNotificationController.newService.value,
                          onChanged: (v) async {
                            plannerProfileNotificationController.newService.value = v;
                            await plannerProfileNotificationController.updatePlannerChangeNotifyController(context: context);
                          },
                          context: context,
                        ),

                        ProfileNotificationWidget.buildSettingRow(
                          title: "Profile",
                          subtitle: "Notify me of any profile related notification.",
                          value: plannerProfileNotificationController.newProfile.value,
                          onChanged: (v) async {
                            plannerProfileNotificationController.newProfile.value = v;
                            await plannerProfileNotificationController.updatePlannerChangeNotifyController(context: context);
                          },
                          context: context,
                        ),

                        ProfileNotificationWidget.buildSettingRow(
                          title: "New Subscription",
                          subtitle: "Notify me when when I receive a new subscription.",
                          value: plannerProfileNotificationController.newSubscription.value,
                          onChanged: (v) async {
                            plannerProfileNotificationController.newSubscription.value = v;
                            await plannerProfileNotificationController.updatePlannerChangeNotifyController(context: context);
                          },
                          context: context,
                        ),


                        ProfileNotificationWidget.buildSettingRow(
                          title: "New payment",
                          subtitle: "Notify me when when I receive a new payment.",
                          value: plannerProfileNotificationController.newPayment.value,
                          onChanged: (v) async {
                            plannerProfileNotificationController.newPayment.value = v;
                            await plannerProfileNotificationController.updatePlannerChangeNotifyController(context: context);
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
