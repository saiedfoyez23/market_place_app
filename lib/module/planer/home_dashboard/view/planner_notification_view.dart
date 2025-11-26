import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerNotificationView extends StatelessWidget {
  PlannerNotificationView({super.key});

  final PlannerNotificationController plannerNotificationController = Get.put(PlannerNotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white255,
            ),
            child: CustomScrollView(
              slivers: [


                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardPlannerView(index: 0),preventDuplicates: false);
                    Get.delete<PlannerNotificationController>(force: true);
                  },
                  title: "Notifications",
                ),


                SliverToBoxAdapter(
                  child: Column(
                    children: [

                      SpaceHelperWidget.v(16.h(context)),

                    ],
                  ),
                ),


                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context,int index) {
                        return buildDismissibleNotificationCard(item: plannerNotificationController.notifications[index],context: context);
                      },
                      childCount: plannerNotificationController.notifications.length,
                    ),
                  ),
                ),


              ],
            ),
          ),
        );
      }),
    );
  }


  Widget buildDismissibleNotificationCard({required PlannerNotificationItem item,required BuildContext context}) {
    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          color: ColorUtils.red181,
          borderRadius: BorderRadius.circular(8.r(context)),
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
        child: ImageHelperWidget.assetImageWidget(
          context: context,
          height: 30.h(context),
          width: 30.w(context),
          imageString: ImageUtils.whiteNotificationDeleteImage,
        ),
      ),
      onDismissed: (direction) {
        showDialog(
          context: context,
          barrierDismissible: false, // user must tap a button
          builder: (context) {
            return Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r(context)),
              ),
              child: IntrinsicHeight(
                child: Container(
                  width: 428.w(context),
                  decoration: BoxDecoration(
                    color: ColorUtils.white255,
                    borderRadius: BorderRadius.circular(20.r(context)),
                  ),
                  padding: EdgeInsets.fromLTRB(
                    16.lpm(context),
                    20.tpm(context),
                    16.rpm(context),
                    20.bpm(context),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// ===== Title Text =====

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.center,
                        textAlign: TextAlign.center,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        textColor: ColorUtils.black21,
                        text: "Are you sure! ",
                      ),

                      SpaceHelperWidget.v(10.h(context)),

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.center,
                        textAlign: TextAlign.center,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black21,
                        text: "you want to delete Notification?",
                      ),



                      SpaceHelperWidget.v(32.h(context)),


                      /// ===== Buttons Row =====
                      Row(
                        children: [
                          /// No Button

                          Expanded(
                            child: ButtonHelperWidget.customButtonWidget(
                              context: context,
                              onPressed: () async {
                                Get.off(()=>PlannerNotificationView(),preventDuplicates: false);
                              },
                              text: "No",
                              borderRadius: 40,
                              backgroundColor: ColorUtils.white243,
                              fontWeight: FontWeight.w600,
                              textColor: ColorUtils.black89,
                              fontSize: 20,
                            ),
                          ),


                          SpaceHelperWidget.h(10.w(context)),


                          Expanded(
                            child: ButtonHelperWidget.customButtonWidget(
                              context: context,
                              onPressed: () async {
                                plannerNotificationController.removeNotification(item.id);
                                Get.off(()=>PlannerNotificationView(),preventDuplicates: false);
                              },
                              text: "Delete",
                              borderRadius: 40,
                              backgroundColor: ColorUtils.red191,
                              fontWeight: FontWeight.w600,
                              textColor: ColorUtils.white255,
                              fontSize: 20,
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: buildNotificationCard(item: item,context: context),
    );
  }

  Widget buildNotificationCard({required PlannerNotificationItem item, required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      padding: EdgeInsets.symmetric(horizontal: 16.hpm(context),vertical: 10.vpm(context)),
      decoration: BoxDecoration(
        color: item.isRead == false ? ColorUtils.blue231 : Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          item.isRead == false ?
          Padding(
            padding: EdgeInsets.only(top: 10.tpm(context)),
            child: ImageHelperWidget.assetImageWidget(
              context: context,
              height: 50.h(context),
              width: 50.w(context),
              imageString: ImageUtils.readNotificationImage,
            ),
          ) :
          Padding(
            padding: EdgeInsets.only(top: 10.tpm(context)),
            child: ImageHelperWidget.assetImageWidget(
              context: context,
              height: 50.h(context),
              width: 50.w(context),
              imageString: ImageUtils.unreadNotificationImage,
            ),
          ),

          SpaceHelperWidget.h(10.w(context)),


          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        textColor: ColorUtils.black64,
                        text: item.title,
                      ),
                    ),

                    SpaceHelperWidget.h(8.w(context)),

                    SizedBox(width: 8),

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textColor: ColorUtils.blue181,
                      text: item.time,
                    ),

                  ],
                ),

                SpaceHelperWidget.v(6.h(context)),

                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black107,
                  text: item.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
