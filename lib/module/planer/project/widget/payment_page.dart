import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class PaymentPage {


  static Widget paymentPage({
    required BuildContext context,
    required PlannerProjectDetailsController plannerProjectDetailsController,
  }) {
    return CustomScrollView(
      slivers: [


        SliverToBoxAdapter(
          child: Column(
            children: [
              // Summary Cards
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      context: context,
                      icon: ImageUtils.totalReceivedImage,
                      title: 'Total Received',
                      value: 'R${plannerProjectDetailsController.getAllProjectPaymentResponseModel.value.data?.totalReceived ?? 0}',
                      color: ColorUtils.cyan199,
                    ),
                  ),

                  SpaceHelperWidget.h(16.w(context)),


                  Expanded(
                    child: _buildStatCard(
                      context: context,
                      icon: ImageUtils.pendingPaymentsImage,
                      title: 'Pending Payments',
                      value: 'R${plannerProjectDetailsController.getAllProjectPaymentResponseModel.value.data?.pendingPayment ?? 0}',
                      color: ColorUtils.blue206,
                    ),
                  ),

                ],
              ),


              SizedBox(height: 16),
              Row(
                children: [


                  Expanded(
                    child: _buildStatCard(
                      context: context,
                      icon: ImageUtils.vendorPaymentsImage,
                      title: 'Vendor Payments',
                      value: 'R${plannerProjectDetailsController.getAllProjectPaymentResponseModel.value.data?.vendorPayment ?? 0}',
                      color: ColorUtils.green213,
                    ),
                  ),

                  SpaceHelperWidget.h(16.w(context)),


                  Expanded(
                    child: _buildStatCard(
                      context: context,
                      icon: ImageUtils.totalSavedImage,
                      title: 'Total Saved',
                      value: 'R${plannerProjectDetailsController.getAllProjectPaymentResponseModel.value.data?.totalSaved ?? 0}',
                      color: ColorUtils.orange213,
                    ),
                  ),
                ],
              ),


              SizedBox(height: 16),
              // Payment List
              ...plannerProjectDetailsController.getAllProjectPaymentResponseModel.value.data!.payments!.map((payment) => Container(
                padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 14.hpm(context)),
                decoration: BoxDecoration(
                  color: ColorUtils.white243,
                  borderRadius: BorderRadius.circular(14.r(context)),
                ),
                margin: EdgeInsets.only(bottom: 20.bpm(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _rowItem(title: "Vendor Name: ", value: payment.vendor?.name ?? "", context: context),
                    _rowItem(title: "Order Title: ", value: payment.vendorOrder?.title ?? "", context: context),
                    _rowItem(title: "Date: ", value: "${DateFormat('dd MMM yyyy').format(DateTime.parse(payment.createdAt))}", context: context),
                    _rowStatusItem(title: "Status: ", value: payment.paymentStatus == "pending"? "Pending" : "Paid", context: context),
                    _rowItem(title: 'Amount: ', value: "R${payment.agreedAmount}", context: context),

                    SpaceHelperWidget.v(10.h(context)),

                    payment.paymentStatus == "pending" ?
                    ButtonHelperWidget.customButtonWidgetAdventPro(
                      context: context,
                      onPressed: () async {
                        PaymentDialogBoxWidget().makePaymentDialog(
                          context: context,
                          paymentId: payment.sId,
                          plannerProjectDetailsController: plannerProjectDetailsController,
                        );
                      },
                      text: "Make Payment",
                      backgroundColor: ColorUtils.white217,
                      textColor: ColorUtils.white255,
                    ) : SizedBox.shrink(),
                  ],
                ),
              )),
            ],
          ),
        )

      ],
    );
  }

  static Widget _rowItem({required String title,required String value,required BuildContext context}) {
    return Column(
      children: [

        Row(
          children: [
            Expanded(
              child: TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                textAlign: TextAlign.start,
                fontSize: 16,
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
                fontSize: 16,
                fontWeight: FontWeight.w600,
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

  static Widget _rowStatusItem({required String title,required String value,required BuildContext context}) {

    Color badgeColor = Colors.grey;
    Color textColor = Colors.white;

    if(value == 'Paid') {
      badgeColor = ColorUtils.green02;
      textColor = ColorUtils.green139;
    } else {
      badgeColor = ColorUtils.yellow249;
      textColor = ColorUtils.yellow95;
    }

    return Column(
      children: [

        Row(
          children: [
            Expanded(
              child: TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                textAlign: TextAlign.start,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                textColor: ColorUtils.black48,
                text: title,
              ),
            ),

            SpaceHelperWidget.h(10.w(context)),

            TextHelperClass.headingTextWithoutWidth(
              context: context,
              alignment: Alignment.center,
              containerColor: badgeColor,
              padding: EdgeInsets.symmetric(vertical: 3.vpm(context),horizontal: 10.h(context)),
              textAlign: TextAlign.center,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              borderRadius: BorderRadius.circular(6.r(context)),
              textColor: textColor,
              text: value,
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


  static Widget _buildStatCard({
    required BuildContext context,
    required String icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white255,
        borderRadius: BorderRadius.circular(12.r(context)),
        border: Border.all(color: color,width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [

              Expanded(
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black64,
                  text: title,
                ),
              ),

              SpaceHelperWidget.h(10.w(context)),

              ImageHelperWidget.assetImageWidget(
                context: context,
                height: 24.h(context),
                width: 24.w(context),
                imageString: icon,
              ),

            ],
          ),
          SpaceHelperWidget.v(10.h(context)),

          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black64,
            text: value,
          ),

        ],
      ),
    );
  }


}