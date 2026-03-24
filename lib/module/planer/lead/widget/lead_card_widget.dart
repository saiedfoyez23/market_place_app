import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class LeadCardWidget extends StatelessWidget {
  const LeadCardWidget({
    super.key,
    required this.selectedTab,
    required this.index,
    required this.plannerLeadsResponseModel,
  });
  final int selectedTab;
  final int index;
  final PlannerLeadsResponseModel plannerLeadsResponseModel;

  @override
  Widget build(BuildContext context) {
    var lead = plannerLeadsResponseModel.data?.leadList?[index];
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: Row(
                  children: [

                    ImageHelperWidget.circleImageHelperWidget(
                      width: 32.w(context),
                      height: 32.h(context),
                      verticalPadding: 1.vpm(context),
                      horizontalPadding: 1.hpm(context),
                      backgroundColor: ColorUtils.orange213,
                      radius: 25.r(context),
                      imageAsset: lead?.receiver?.photoUrl == null ? ImageUtils.noImage : null,
                      imageUrl: lead?.receiver?.photoUrl,
                    ),

                    SpaceHelperWidget.h(12.w(context)),

                    Expanded(
                      child: TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        textAlign: TextAlign.start,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black48,
                        text: lead?.receiver?.name ?? "",
                      ),
                    ),

                  ],
                ),
              ),

              SpaceHelperWidget.h(10.w(context)),


              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.hpm(context), vertical: 4.vpm(context)),
                decoration: BoxDecoration(
                  color: selectedTab == 0 ? ColorUtils.blue173 : selectedTab == 1 ? ColorUtils.green02 : selectedTab == 2 ? ColorUtils.yellow249 : ColorUtils.red20,
                  borderRadius: BorderRadius.circular(24.r(context)),
                ),
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.center,
                  textAlign: TextAlign.center,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  textColor: selectedTab == 0 ? ColorUtils.blue96 : selectedTab == 1 ? ColorUtils.green139 : selectedTab == 2 ? ColorUtils.yellow95 : ColorUtils.red202,
                  text: selectedTab == 0 ? "Corporate" : selectedTab == 1 ? "Contacted" : selectedTab == 2 ? "Qualified" : "Left",
                ),
              ),
            ],
          ),

          SpaceHelperWidget.v(12.h(context)),



          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: lead?.title,
          ),


          SpaceHelperWidget.v(12.h(context)),

          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black80,
            text: lead?.shortDescription,
          ),


          SpaceHelperWidget.v(12.h(context)),

          Row(
            children: [


              Expanded(
                child: Row(
                  children: [
                    ImageHelperWidget.assetImageWidget(
                      context: context,
                      height: 21.h(context),
                      width: 21.w(context),
                      imageString: ImageUtils.leadDetailsCalenderImage,
                    ),

                    SpaceHelperWidget.h(8.w(context)),


                    Expanded(
                      child: TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        textAlign: TextAlign.start,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black94,
                        text: DateFormat("dd MMM yyyy").format(DateTime.parse(lead?.startDate)),
                      ),
                    ),


                  ],
                ),
              ),


              Expanded(
                child: Row(
                  children: [
                    ImageHelperWidget.assetImageWidget(
                      context: context,
                      height: 21.h(context),
                      width: 21.w(context),
                      imageString: ImageUtils.leadDetailsLocationImage,
                    ),

                    SpaceHelperWidget.h(8.w(context)),


                    Expanded(
                      child: TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        textAlign: TextAlign.start,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black94,
                        text: lead?.address ?? "",
                        textOverFlow: TextOverflow.ellipsis
                      ),
                    ),


                  ],
                ),
              ),


            ],
          ),


          SpaceHelperWidget.v(24.h(context)),


          ButtonHelperWidget.customButtonWidgetAdventPro(
            context: context,
            onPressed: () async {
              Get.off(()=>PlannerOpenOrderDetailsView(orderID: lead?.sId,isHome: false,),preventDuplicates: false);
            },
            text: "View Details",
          ),


        ],
      ),
    );
  }
}
