import 'package:flutter/material.dart';
import 'package:marketplaceapp/utils/utils.dart';

class SummaryCardWidget extends StatelessWidget {
  const SummaryCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.logo,
    required this.borderColor,
  });

  final String title;
  final String value;
  final String logo;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 14.vpm(context),
        horizontal: 14.hpm(context),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor,width: 1),
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                imageString: logo,
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
