import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorNotificationView extends StatelessWidget {
  VendorNotificationView({super.key});


  @override
  Widget build(BuildContext context) {
    final VendorNotificationController vendorNotificationController = Get.put(VendorNotificationController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardVendorView(index: 0),preventDuplicates: false);
        Get.delete<VendorNotificationController>(force: true);
      },
      child: Scaffold(
        body: Obx(() {
          return SafeArea(
            child: Container(
              height: 930.h(context),
              width: 428.w(context),
              decoration: BoxDecoration(
                color: ColorUtils.white255,
              ),
              child: vendorNotificationController.isLoading.value == true ?
              LoadingHelperWidget.loadingHelperWidget(context: context,height: 930.h(context)) :
              RefreshIndicator(
                onRefresh: () async {
                  Get.off(()=>VendorNotificationView(),preventDuplicates: false);
                  Get.delete<VendorNotificationController>(force: true);
                },
                child: CustomScrollView(
                  slivers: [


                    AuthAppBarHelperWidget(
                      onBackPressed: () async {
                        Get.off(()=>DashboardVendorView(index: 0),preventDuplicates: false);
                        Get.delete<VendorNotificationController>(force: true);
                      },
                      title: "Notifications",
                    ),


                    SliverToBoxAdapter(
                      child: vendorNotificationController.getAllNotificationResponseModel.value.data?.isNotEmpty == true ?
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                        child: Column(
                          children: [

                            SpaceHelperWidget.v(16.h(context)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                ButtonHelperWidget.customButtonWidget(
                                  context: context,
                                  onPressed: () async {
                                    await vendorNotificationController.markAllAsReadNotificationController(context: context);
                                  },
                                  text: "Mark all as read",
                                  padding: EdgeInsets.only(left: 14.5.lpm(context)),
                                  alignment: Alignment.center,
                                  textColor: ColorUtils.blue96,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  backgroundColor: Colors.transparent,
                                ),


                              ],
                            ),

                            SpaceHelperWidget.v(16.h(context)),

                          ],
                        ),
                      ) :
                      SizedBox.shrink(),
                    ),


                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                      sliver: vendorNotificationController.getAllNotificationResponseModel.value.data?.isNotEmpty == true ?
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context,int index) {
                                return buildDismissibleNotificationCard(
                                  vendorNotificationController: vendorNotificationController,
                                  index: index,
                                  context: context,
                                );
                              },
                            childCount: vendorNotificationController.getAllNotificationResponseModel.value.data?.length,
                          ),
                      ) :
                      SliverFillRemaining(
                        child: Align(
                          alignment: Alignment.center,
                          child: TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.center,
                            textAlign: TextAlign.start,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            textColor: ColorUtils.black48,
                            text: "No Notification Available",
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }


  Widget buildDismissibleNotificationCard({
    required int index,
    required BuildContext context,
    required VendorNotificationController vendorNotificationController,
  }) {

    var notification = vendorNotificationController.getAllNotificationResponseModel.value.data?[index];

    return Dismissible(
      key: Key(notification!.sId!),
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
            return Obx(()=>Dialog(
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
                                Get.back();
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
                            child: vendorNotificationController.isDelete.value == true ?
                            LoadingHelperWidget.loadingHelperWidget(context: context) :
                            ButtonHelperWidget.customButtonWidget(
                              context: context,
                              onPressed: () async {
                                vendorNotificationController.isDelete.value = true;
                                await vendorNotificationController.deleteNotificationController(context: context, notificationId: notification.sId!);
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
            ));
          },
        );
      },
      child: buildNotificationCard(
        index: index,
        context: context,
        vendorNotificationController: vendorNotificationController,
      ),
    );
  }

  Widget buildNotificationCard({
    required int index,
    required BuildContext context,
    required VendorNotificationController vendorNotificationController,
  }) {

    var notification = vendorNotificationController.getAllNotificationResponseModel.value.data?[index];

    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      padding: EdgeInsets.symmetric(horizontal: 16.hpm(context),vertical: 10.vpm(context)),
      decoration: BoxDecoration(
        color: notification?.read == false ? ColorUtils.blue231 : Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    notification?.modelType == "Withdraw" ?
                    ImageUtils.withdrawNotificationImage :
                    notification?.modelType == "Subscription" ?
                    ImageUtils.subcriptionNotificationImage :
                    notification?.modelType == "User" ?
                    ImageUtils.userNotificationImage :
                    notification?.modelType == "KYC" ?
                    ImageUtils.kycNotificationImage :
                    notification?.modelType == "Order" ?
                    ImageUtils.orderNotificationImage :
                    notification?.modelType == "Auth" ?
                    ImageUtils.verifyKycNotificationImage :
                    notification?.modelType == "Service" ?
                    ImageUtils.serviceNotificationImage :
                    notification?.modelType == "AssignProject" ?
                    ImageUtils.projectNotificationImage :
                    notification?.modelType == "Chat" ?
                    ImageUtils.chatNotificationImage :
                    notification?.modelType == "Payment" ?
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
                        text: notification?.message ?? "",
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
                      text: vendorNotificationController.getDynamicTime(notification!.createdAt.toString(), DateTime.now().toString()),
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
                  text: notification.description ?? "",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}