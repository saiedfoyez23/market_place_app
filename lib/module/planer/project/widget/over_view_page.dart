import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class OverViewPage {

  static Widget overViewPage({
    required BuildContext context,
    required PlannerProjectDetailsController plannerProjectDetailsController,
  }) {
    return Obx(() {
      return CustomScrollView(
        slivers: [
          
          
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event Information
            
                _eventInformation(context: context, plannerProjectDetailsController: plannerProjectDetailsController),
            
                // Client Information
                _clientInformation(context: context, plannerProjectDetailsController: plannerProjectDetailsController),
            
            
                _eventProgress(context: context, plannerProjectDetailsController: plannerProjectDetailsController),
            
            
                _aboutThisOrder(context: context, plannerProjectDetailsController: plannerProjectDetailsController),
            
                ButtonHelperWidget.customButtonWidgetAdventPro(
                  context: context,
                  onPressed: () async {},
                  text: "Complete Order",
                  backgroundColor: ColorUtils.white217,
                  textColor: ColorUtils.white255,
                ),
            
                SpaceHelperWidget.v(30.h(context)),
            
            
              ],
            ),
          ),
        ],
      );
    });
  }


  static Widget _eventInformation({
    required BuildContext context,
    required PlannerProjectDetailsController plannerProjectDetailsController,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white243,
        borderRadius: BorderRadius.circular(14.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                textAlign: TextAlign.start,
                fontSize: 17,
                fontWeight: FontWeight.w500,
                textColor: ColorUtils.black48,
                text: "Event Information",
              ),

              SpaceHelperWidget.h(10.w(context)),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.hpm(context), vertical: 5.vpm(context)),
                decoration: BoxDecoration(
                  color: ColorUtils.green02,
                  borderRadius: BorderRadius.circular(100.r(context)),
                ),
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.center,
                  textAlign: TextAlign.center,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.green139,
                  text: 'Active',
                ),
              ),

            ],
          ),

          SpaceHelperWidget.v(10.h(context)),

          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: plannerProjectDetailsController.eventInfo.value.name,
          ),

          SpaceHelperWidget.v(20.h(context)),

          _rowItem(title: "5 Days", value: "Form \$300", context: context),
          _rowItem(title: 'Start date:', value: DateFormat('dd MMM yyyy').format(plannerProjectDetailsController.eventInfo.value.startDate), context: context),
          _rowItem(title: "End date:", value: DateFormat('dd MMM yyyy').format(plannerProjectDetailsController.eventInfo.value.endDate), context: context),
          _rowItem(title: "Location", value: plannerProjectDetailsController.eventInfo.value.location, context: context),


        ],
      ),
    );
  }


  static Widget _clientInformation({
    required BuildContext context,
    required PlannerProjectDetailsController plannerProjectDetailsController,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white243,
        borderRadius: BorderRadius.circular(14.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black48,
            text: "Client Information",
          ),

          SpaceHelperWidget.v(20.h(context)),

          _rowItem(title: 'Name:', value: plannerProjectDetailsController.clientInfo.value.name, context: context),
          _rowItem(title: 'Email:', value: plannerProjectDetailsController.clientInfo.value.email, context: context),
          _rowItem(title: 'Phone:', value: plannerProjectDetailsController.clientInfo.value.phone, context: context),
          _rowItem(title: 'Location:', value: plannerProjectDetailsController.clientInfo.value.location, context: context),

        ],
      ),
    );
  }


  static Widget _eventProgress({
    required BuildContext context,
    required PlannerProjectDetailsController plannerProjectDetailsController,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white243,
        borderRadius: BorderRadius.circular(14.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black48,
            text: "Event progress",
          ),

          SpaceHelperWidget.v(20.h(context)),

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
                  text: "Total Vendor: ",
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
                  text: plannerProjectDetailsController.progressInfo.value.totalVendors.toString(),
                ),
              ),
            ],
          ),

          SpaceHelperWidget.v(10.h(context)),

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
                  text: "Budget ",
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
                  text: "\$150 / \$300",
                ),
              ),
            ],
          ),

          SpaceHelperWidget.v(7.h(context)),


          ClipRRect(
            borderRadius: BorderRadius.circular(2.r(context)),
            child: LinearProgressIndicator(
              value: (150 / 300),
              backgroundColor: ColorUtils.white217,
              minHeight: 8.h(context),
              valueColor: const AlwaysStoppedAnimation<Color>(ColorUtils.blue96),
            ),
          ),


          SpaceHelperWidget.v(10.h(context)),

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
                  text: "Progress ",
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
                  text: "70%",
                ),
              ),
            ],
          ),

          SpaceHelperWidget.v(7.h(context)),


          ClipRRect(
            borderRadius: BorderRadius.circular(2.r(context)),
            child: LinearProgressIndicator(
              value: .7,
              backgroundColor: ColorUtils.white217,
              minHeight: 8.h(context),
              valueColor: const AlwaysStoppedAnimation<Color>(ColorUtils.blue96),
            ),
          ),


        ],
      ),
    );
  }


  static Widget _aboutThisOrder({
    required BuildContext context,
    required PlannerProjectDetailsController plannerProjectDetailsController,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white243,
        borderRadius: BorderRadius.circular(14.r(context)),
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
            text: "About this Order",
          ),


          SpaceHelperWidget.v(20.h(context)),

          _buildSection(
            context: context,
            imageString: ImageUtils.grayRightSignImage,
            title: "Entrance & Welcome Area",
            items: [
              "Welcome board with birthday name & age",
              "Balloon arch / gate decoration",
              "Flower stand or LED frame at entry",
              "Red carpet or themed walkway",
              "Photo booth backdrop",
            ],
          ),

          _buildSection(
            context: context,
            imageString: ImageUtils.grayRightSignImage,
            title: "Cake & Dessert Section",
            items: [
              "Cake stand & dessert trays",
              "Cake backdrop or arch",
              "LED candles or spotlight on cake",
              "Customized cake topper",
            ],
          ),

          _buildSection(
            context: context,
            imageString: ImageUtils.grayRightSignImage,
            title: "Photo Zone",
            items: [
              "Themed photo booth with props",
              "Neon light signs (“Let’s Party”, “Cheers”, “Happy Birthday”)",
              "Instax / Polaroid corner for instant photos",
            ],
          ),

        ],
      ),
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

  static Widget _buildSection({
    required BuildContext context,
    required String imageString,
    required String title,
    required List<String> items,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.bpm(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelperWidget.assetImageWidget(
                context: context,
                height: 24.h(context),
                width: 24.w(context),
                imageString: imageString,
              ),

              SpaceHelperWidget.h(10.w(context)),


              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                textAlign: TextAlign.start,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                textColor: ColorUtils.black48,
                text: title,
              ),

            ],
          ),
          SpaceHelperWidget.v(16.h(context)),


          ...items.map((text) => Padding(
            padding: EdgeInsets.only(left: 32.lpm(context), bottom: 8.bpm(context)),
            child: Row(
              children: [
                Icon(Icons.circle, size: 10.r(context), color: ColorUtils.blue96),

                SpaceHelperWidget.h(10.w(context)),

                Expanded(
                  child: TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    textColor: ColorUtils.black80,
                    text: text,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }


}