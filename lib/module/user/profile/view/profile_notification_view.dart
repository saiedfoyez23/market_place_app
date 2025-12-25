import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class ProfileNotificationView extends StatelessWidget {
  ProfileNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileNotificationController profileNotificationController = Get.put(ProfileNotificationController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardUserView(index: 4,),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: profileNotificationController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
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
                          onChanged: (v) async {
                            profileNotificationController.newBookings.value = v;
                            await profileNotificationController.updateUserChangeNotifyController(context: context);
                          },
                          context: context,
                        ),

                        ProfileNotificationWidget.buildSettingRow(
                          title: "New Service",
                          subtitle: "Notify me when I receive a new service.",
                          value: profileNotificationController.newService.value,
                          onChanged: (v) async {
                            profileNotificationController.newService.value = v;
                            await profileNotificationController.updateUserChangeNotifyController(context: context);
                          },
                          context: context,
                        ),

                        ProfileNotificationWidget.buildSettingRow(
                          title: "Profile",
                          subtitle: "Notify me of any profile related notification.",
                          value: profileNotificationController.newProfile.value,
                          onChanged: (v) async {
                            profileNotificationController.newProfile.value = v;
                            await profileNotificationController.updateUserChangeNotifyController(context: context);
                          },
                          context: context,
                        ),

                        ProfileNotificationWidget.buildSettingRow(
                          title: "New Subscription",
                          subtitle: "Notify me when when I receive a new subscription.",
                          value: profileNotificationController.newSubscription.value,
                          onChanged: (v) async {
                            profileNotificationController.newSubscription.value = v;
                            await profileNotificationController.updateUserChangeNotifyController(context: context);
                          },
                          context: context,
                        ),


                        ProfileNotificationWidget.buildSettingRow(
                          title: "New payment",
                          subtitle: "Notify me when when I receive a new payment.",
                          value: profileNotificationController.newPayment.value,
                          onChanged: (v) async {
                            profileNotificationController.newPayment.value = v;
                            await profileNotificationController.updateUserChangeNotifyController(context: context);
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

