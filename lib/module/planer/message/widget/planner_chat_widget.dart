import 'package:flutter/material.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';


class PlannerChatWidget {

  static Widget plannerChatWidget({
    required int index,
    required BuildContext context,
    required PlannerChatController plannerChatController,
  }) {
    bool isSender = (plannerChatController.plannerMyProfileDetailsResponseModel.value.data?.sId ==
        plannerChatController.getAllMessageResponseModel.value.data?[index].sender?.sId);

    return Container(
      margin: EdgeInsets.only(bottom: 16.bpm(context)),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSender) ...[
            ImageHelperWidget.circleImageHelperWidget(
                width: 32.w(context),
                height: 32.h(context),
                verticalPadding: 1.vpm(context),
                horizontalPadding: 1.hpm(context),
                backgroundColor: ColorUtils.orange213,
                radius: 25.r(context),
                imageAsset: plannerChatController.getAllMessageResponseModel.value.data?[index].sender?.photoUrl == null ? ImageUtils.noImage : null,
                imageUrl: plannerChatController.getAllMessageResponseModel.value.data?[index].sender?.photoUrl
            ),

            SpaceHelperWidget.h(10.w(context)),
          ],

          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 12.hpm(context)),
              decoration: BoxDecoration(
                color: isSender ? ColorUtils.blue181 : ColorUtils.white241,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r(context)),
                  topRight: Radius.circular(16.r(context)),
                  bottomLeft: Radius.circular(isSender ? 16.r(context) : 0),
                  bottomRight: Radius.circular(isSender ? 0 : 16.r(context)),
                ),
              ),
              child: TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                textColor: isSender ? ColorUtils.white255 : ColorUtils.black80,
                text: plannerChatController.getAllMessageResponseModel.value.data?[index].text ?? "",
              ),
            ),
          ),

          if (isSender) ...[

            SpaceHelperWidget.h(10.w(context)),

            ImageHelperWidget.circleImageHelperWidget(
              width: 32.w(context),
              height: 32.h(context),
              verticalPadding: 1.vpm(context),
              horizontalPadding: 1.hpm(context),
              backgroundColor: ColorUtils.orange213,
              radius: 25.r(context),
              imageAsset: plannerChatController.getAllMessageResponseModel.value.data?[index].sender?.photoUrl == null ? ImageUtils.noImage : null,
              imageUrl: plannerChatController.getAllMessageResponseModel.value.data?[index].sender?.photoUrl,
            ),
          ],
        ],
      ),
    );
  }




}