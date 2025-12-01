import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';


class VendorInformationShowPage {


  static Widget vendorInformationPage({
    required BuildContext context,
    required PlannerProjectDetailsController plannerProjectDetailsController,
  }) {
    return Obx(() => CustomScrollView(
      slivers: [

        SliverToBoxAdapter(
          child: Column(
            children: [

              Row(
                children: [


                  Expanded(
                    child: ButtonHelperWidget.customButtonWidgetAdventPro(
                      context: context,
                      onPressed: () async {},
                      text: "Complete Order",
                      backgroundColor: ColorUtils.blue173,
                      textColor: ColorUtils.blue96,
                    ),
                  ),


                  SpaceHelperWidget.h(10.w(context)),


                  Expanded(
                    child: ButtonHelperWidget.customIconButtonWidgetAdventPro(
                      context: context,
                      backgroundColor: ColorUtils.blue96,
                      textSize: 20,
                      iconSize: 20,
                      padding: EdgeInsets.symmetric(vertical: 8.5.vpm(context),horizontal: 16.hpm(context)),
                      borderRadius: 8,
                      textColor: ColorUtils.white255,
                      fontWeight: FontWeight.w700,
                      onPressed: () async {

                      },
                      iconPath: ImageUtils.addImage,
                      text: "Create Project",
                    ),
                  ),




                ],
              ),

              SpaceHelperWidget.v(16.h(context)),


            ],
          ),
        ),


        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context,int index) {
                  return _vendorInformation(
                    context: context,
                    vendor: plannerProjectDetailsController.vendors[index],
                  );
                },
              childCount: plannerProjectDetailsController.vendors.length,
            )
        ),


        SliverToBoxAdapter(
          child: Column(
            children: [

              SpaceHelperWidget.v(30.h(context)),

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
        )

      ],
    ));
  }


  static Widget _vendorInformation({
    required BuildContext context,
    required PlannerProjectVendorModel vendor,
  }) {

    Color badgeColor = Colors.grey;
    Color textColor = Colors.white;

    if(vendor.status == "Confirmed") {
      badgeColor = ColorUtils.green02;
      textColor = ColorUtils.green139;
    } else {
      badgeColor = ColorUtils.yellow249;
      textColor = ColorUtils.yellow95;
    }

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
                fontSize: 18,
                fontWeight: FontWeight.w600,
                textColor: ColorUtils.black48,
                text: vendor.name,
              ),

              SpaceHelperWidget.h(10.w(context)),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.hpm(context), vertical: 5.vpm(context)),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(100.r(context)),
                ),
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.center,
                  textAlign: TextAlign.center,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: textColor,
                  text: vendor.status,
                ),
              ),

            ],
          ),

          SpaceHelperWidget.v(10.h(context)),

          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black48,
            text: vendor.category,
          ),

          SpaceHelperWidget.v(20.h(context)),

          _rowItem(title: "Email", value: vendor.email, context: context),
          _rowItem(title: "Phone", value: vendor.phone, context: context),
          _rowItem(title: "Quote", value: "\$${vendor.quote}", context: context),
          _rowItem(title: "Location", value: vendor.location, context: context),

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


}