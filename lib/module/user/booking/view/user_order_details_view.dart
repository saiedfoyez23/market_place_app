import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class UserOrderDetailsView extends StatelessWidget {
  const UserOrderDetailsView({super.key,required this.orderId});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    final UserBookingDetailsController userBookingDetailsController = Get.put(UserBookingDetailsController(context: context,orderId: orderId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardUserView(index: 1),preventDuplicates: false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(()=>Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: userBookingDetailsController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardUserView(index: 1),preventDuplicates: false);
                  },
                  title: "Order Details",
                ),

                SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                      child: Column(
                        children: [
                          SpaceHelperWidget.v(16.h(context)),
                          // ----------------------------------------
                          // Title
                          // ----------------------------------------

                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            textAlign: TextAlign.start,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            textColor: ColorUtils.black48,
                            text: userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.title ?? "",
                          ),

                          SpaceHelperWidget.v(12.h(context)),


                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            textColor: ColorUtils.black80,
                            text: userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.shortDescription ?? "",
                          ),


                          SpaceHelperWidget.v(24.h(context)),



                          // ----------------------------------------
                          // About This Order Section
                          // ----------------------------------------

                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            textAlign: TextAlign.start,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            textColor: ColorUtils.black48,
                            text: "About this Order",
                          ),


                          SpaceHelperWidget.v(20.h(context)),

                          HtmlWidget("${userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.description ?? ""}"),


                          SpaceHelperWidget.v(20.h(context)),


                          // ----------------------------------------
                          // Order Information Card
                          // ----------------------------------------


                          Container(
                            margin: EdgeInsets.only(bottom: 20.bpm(context)),
                            padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 20.hpm(context)),
                            decoration: BoxDecoration(
                              color: ColorUtils.white243,
                              borderRadius: BorderRadius.circular(12.r(context)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.centerLeft,
                                  textAlign: TextAlign.start,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  textColor: ColorUtils.black48,
                                  text: "Note :",
                                ),

                                SpaceHelperWidget.v(16.h(context)),

                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.centerLeft,
                                  textAlign: TextAlign.start,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  textColor: ColorUtils.black48,
                                  text: "If you want to continue this order, you’ll need to make a 50% payment.",
                                ),
                              ],
                            ),
                          ),


                          buildInfoCard(context: context,userBookingDetailsController: userBookingDetailsController),


                          buildPlannerCard(context: context,userBookingDetailsController: userBookingDetailsController),

                          userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.status == "pending" ?
                          Row(
                            children: [

                              Expanded(
                                child: userBookingDetailsController.isDenied.value == true ?
                                LoadingHelperWidget.loadingHelperWidget(context: context) :
                                ButtonHelperWidget.customButtonWidgetAdventPro(
                                  context: context,
                                  onPressed: () async {
                                    userBookingDetailsController.isDenied.value = true;
                                    Map<String,dynamic> data = {
                                      "status": "denied"
                                    };
                                    await userBookingDetailsController.deniedOfferController(
                                      context: context,
                                      data: data,
                                      orderId: userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.sId ?? "",
                                    );
                                  },
                                  text: "Decline Offer",
                                  textColor: ColorUtils.red202,
                                  backgroundColor: ColorUtils.red9,
                                ),
                              ),

                              SpaceHelperWidget.h(16.w(context)),

                              Expanded(
                                child: userBookingDetailsController.isSubmit.value == true ?
                                LoadingHelperWidget.loadingHelperWidget(context: context) :
                                ButtonHelperWidget.customButtonWidgetAdventPro(
                                  context: context,
                                  onPressed: () async {
                                    userBookingDetailsController.isSubmit.value = true;
                                    Map<String,dynamic> data = {
                                      "modelType": "Order",
                                      "type": "initial",
                                      "user": userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.sender?.sId ?? "",
                                      "reference": userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.sId ?? "",
                                    };
                                    await userBookingDetailsController.createPaymentController(context: context, data: data);
                                  },
                                  text: "Accept Order",
                                ),
                              ),

                            ],
                          ) :
                          userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.status == "running" ?
                          Row(
                            children: [

                              Expanded(
                                child:  userBookingDetailsController.isSubmit.value == true ?
                                LoadingHelperWidget.loadingHelperWidget(context: context) :
                                ButtonHelperWidget.customButtonWidgetAdventPro(
                                  context: context,
                                  onPressed: () async {
                                    userBookingDetailsController.isSubmit.value = true;
                                    Map<String,dynamic> data = {
                                      "modelType": "Order",
                                      "type": "final",
                                      "user": userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.sender?.sId ?? "",
                                      "reference": userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.sId ?? "",
                                    };
                                    await userBookingDetailsController.createPaymentController(context: context, data: data);
                                  },
                                  text: "Complete Order",
                                ),
                              ),

                              SpaceHelperWidget.h(16.w(context)),

                              Expanded(
                                child: ButtonHelperWidget.customButtonWidgetAdventPro(
                                  context: context,
                                  onPressed: () async {
                                    Get.off(()=>UserCancelOfferView(orderID: userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.sId ?? ""),preventDuplicates: false);
                                  },
                                  text: "Cancel Order",
                                  textColor: ColorUtils.red202,
                                  backgroundColor: ColorUtils.red9,
                                ),
                              ),

                            ],
                          ) :
                          userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.status == "completed" ?
                          ButtonHelperWidget.customButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              Get.off(()=>UserFeedbackView(
                                orderId: userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.sId ?? "",
                                senderId: userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.sender?.sId ?? "",) ,preventDuplicates: false
                              );
                            },
                            textColor: ColorUtils.blue96,
                            backgroundColor: ColorUtils.blue231,
                            text: "Leave Feedback",
                          ) : SizedBox.shrink(),


                          SpaceHelperWidget.v(40.h(context)),


                        ],
                      ),
                    )
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }



  Widget buildInfoCard({
    required BuildContext context,
    required UserBookingDetailsController userBookingDetailsController,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 20.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white243,
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: "Order Information",
          ),

          SpaceHelperWidget.v(16.h(context)),
          infoRow(title: "Deadline", value: "${userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.duration ?? ""} days", context: context),
          infoRow(title: "Program Start Date", value: DateFormat("dd MMM yyyy").format(DateTime.parse(userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.startDate)), context: context),
          infoRow(title: "Program End Date", value: DateFormat("dd MMM yyyy").format(DateTime.parse(userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.endDate)), context: context),
          //infoRow(title: "First Payment",value: "\$150", context: context),
          infoRow(title: "Total Price", value: "\$${userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.totalAmount ?? ""}", context: context),
        ],
      ),
    );
  }

  Widget buildPlannerCard({
    required BuildContext context,
    required UserBookingDetailsController userBookingDetailsController,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 20.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white243,
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: "Planner Information",
          ),

          SpaceHelperWidget.v(16.h(context)),

          infoRow(title: "Name", value: "${userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.sender?.name ?? ""}", context: context),
          infoRow(title: "Email", value: "${userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.sender?.email ?? ""}", context: context),
          infoRow(title: "Phone", value: "${userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.sender?.contractNumber ?? ""}", context: context),
          infoRow(title: "Location", value: "${userBookingDetailsController.getClientOrderDetailsResponseModel.value.data?.sender?.address ?? ""}", context: context),
        ],
      ),
    );
  }

  Widget infoRow({required String title,required String value,required BuildContext context}) {
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
                textAlign: TextAlign.end,
                fontSize: 17,
                fontWeight: FontWeight.w500,
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
