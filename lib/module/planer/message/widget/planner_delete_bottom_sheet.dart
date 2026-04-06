import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';
class PlannerDeleteBottomSheet extends StatelessWidget {
  const PlannerDeleteBottomSheet({
    super.key,
    required this.chatId,
    required this.messageId,
    required this.isConversation,
    required this.plannerChatController,
  });

  final String chatId;
  final String messageId;
  final bool isConversation;
  final PlannerChatController plannerChatController;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
      padding: EdgeInsets.symmetric(vertical: 16.r(context),horizontal: 16.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white245, // outer background
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r(context)),
          topRight: Radius.circular(12.r(context)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          if(isConversation == true)...[
            if(plannerChatController.isDeleteChatMessage.value == true)...[
              LoadingHelperWidget.loadingHelperWidget(context: context)
            ] else...[
              ButtonHelperWidget.customIconButtonWidgetAdventPro(
                context: context,
                backgroundColor: ColorUtils.white255,
                iconSize: 20,
                isLeading: false,
                padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 16.hpm(context)),
                borderRadius: 8,
                textColor: ColorUtils.black96,
                fontWeight: FontWeight.w500,
                onPressed: () async {
                  plannerChatController.isDeleteChatMessage.value = true;
                  await plannerChatController.deleteChatWiseMessageController(context: context,chatId: chatId);
                },
                iconPath: ImageUtils.deleteImage,
                text: "Delete Conversation",
              ),
            ]
          ] else...[
            if(plannerChatController.isDeleteMessage.value == true)...[
              LoadingHelperWidget.loadingHelperWidget(context: context)
            ] else...[
              ButtonHelperWidget.customIconButtonWidgetAdventPro(
                context: context,
                backgroundColor: ColorUtils.white255,
                iconSize: 20,
                isLeading: false,
                padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 16.hpm(context)),
                borderRadius: 8,
                textColor: ColorUtils.black96,
                fontWeight: FontWeight.w500,
                onPressed: () async {
                  plannerChatController.isDeleteMessage.value = true;
                  await plannerChatController.deleteMessageController(context: context, messageId: messageId);
                },
                iconPath: ImageUtils.deleteImage,
                text: "Delete this message",
              ),
            ]
          ],


          SpaceHelperWidget.v(12.h(context)),


        ],
      ),
    ));
  }
}