import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerChatView extends StatelessWidget {
  PlannerChatView({super.key,required this.chatId});
  final String chatId;

  final PlannerSocketServiceController plannerSocketServiceController = Get.put(PlannerSocketServiceController());
  @override
  Widget build(BuildContext context) {
    final PlannerChatController plannerChatController = Get.put(PlannerChatController(context: context,chatId: chatId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardPlannerView(index: 3,),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: Column(
              children: [

                Expanded(
                  child: plannerChatController.isLoading.value == true ?
                  LoadingHelperWidget.loadingHelperWidget(context: context,height: 930.h(context)) :
                  CustomScrollView(
                    slivers: [


                      AuthAppBarHelperWidget(
                        onBackPressed: () async {
                          Get.off(()=>DashboardPlannerView(index: 3,),preventDuplicates: false);
                        },
                        centerTitle: true,
                        customTitle: Column(
                          children: [

                            if(plannerChatController.getChatDetailsResponseModel.value.data?.reference == null)...[
                              Row(
                                children: [

                                  ImageHelperWidget.circleImageHelperWidget(
                                    width: 40.w(context),
                                    height: 40.h(context),
                                    verticalPadding: 1.vpm(context),
                                    horizontalPadding: 1.hpm(context),
                                    backgroundColor: ColorUtils.orange213,
                                    radius: 25.r(context),
                                    imageAsset: plannerChatController.getChatDetailsResponseModel.value.data?.participants?.where((value) => value.user?.sId != plannerChatController.plannerMyProfileDetailsResponseModel.value.data?.sId).first.user?.photoUrl ==  null ? ImageUtils.noImage : null,
                                    imageUrl: plannerChatController.getChatDetailsResponseModel.value.data?.participants?.where((value) => value.user?.sId != plannerChatController.plannerMyProfileDetailsResponseModel.value.data?.sId).first.user?.photoUrl,
                                  ),

                                  SpaceHelperWidget.h(12.w(context)),


                                  Expanded(
                                    child: Column(
                                      children: [


                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          textColor: ColorUtils.black64,
                                          text: plannerChatController.getChatDetailsResponseModel.value.data?.participants?.where((value) => value.user?.sId != plannerChatController.plannerMyProfileDetailsResponseModel.value.data?.sId).first.user?.name ?? "",
                                        ),

                                        // SpaceHelperWidget.v(3.h(context)),
                                        //
                                        // TextHelperClass.headingTextWithoutWidth(
                                        //   context: context,
                                        //   alignment: Alignment.centerLeft,
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w400,
                                        //   textColor: ColorUtils.black107,
                                        //   text: "Shahid is typing...",
                                        // ),



                                      ],
                                    ),
                                  ),


                                ],
                              )
                            ] else...[
                              Row(
                                children: [

                                  ImageHelperWidget.circleImageHelperWidget(
                                    width: 40.w(context),
                                    height: 40.h(context),
                                    verticalPadding: 1.vpm(context),
                                    horizontalPadding: 1.hpm(context),
                                    backgroundColor: ColorUtils.orange213,
                                    radius: 25.r(context),
                                    imageAsset: plannerChatController.getChatDetailsResponseModel.value.data?.participants?.first.user?.photoUrl ==  null ? ImageUtils.noImage : null,
                                    imageUrl: plannerChatController.getChatDetailsResponseModel.value.data?.participants?.first.user?.photoUrl,
                                  ),

                                  SpaceHelperWidget.h(12.w(context)),


                                  Expanded(
                                    child: Column(
                                      children: [


                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          textColor: ColorUtils.black64,
                                          text: plannerChatController.getChatDetailsResponseModel.value.data?.name,
                                          textOverFlow: TextOverflow.ellipsis,
                                        ),

                                        // SpaceHelperWidget.v(3.h(context)),
                                        //
                                        // TextHelperClass.headingTextWithoutWidth(
                                        //   context: context,
                                        //   alignment: Alignment.centerLeft,
                                        //   fontSize: 16,
                                        //   fontWeight: FontWeight.w400,
                                        //   textColor: ColorUtils.black107,
                                        //   text: "Shahid is typing...",
                                        // ),



                                      ],
                                    ),
                                  ),


                                ],
                              )
                            ]




                          ],
                        ),
                        actions: [
                          // InkWell(
                          //   onTap: () async {},
                          //   child: Icon(
                          //     Icons.more_vert_rounded,
                          //     color: ColorUtils.black14,
                          //     size: 30.r(context),
                          //   ),
                          // ),

                          SpaceHelperWidget.h(15.w(context)),
                        ],
                      ),


                      SliverToBoxAdapter(
                        child: Column(
                          children: [

                            Container(
                              height: 2.h(context),
                              width: 428.w(context),
                              decoration: BoxDecoration(
                                  color: ColorUtils.white233
                              ),
                            ),


                            SpaceHelperWidget.v(20.h(context)),


                          ],
                        ),
                      ),


                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                                  (context,int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                                  child: PlannerChatWidget.plannerChatWidget(
                                    index: index,
                                    plannerChatController: plannerChatController,
                                    context: context,
                                  ),
                                );
                              },
                              childCount: plannerChatController.getAllMessageResponseModel.value.data?.length
                          )
                      ),



                    ],
                  ),
                ),


                Container(
                  decoration: BoxDecoration(
                    color: ColorUtils.white241,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [

                        SpaceHelperWidget.v(12.h(context)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            // Row(
                            //   children: [
                            //     InkWell(
                            //       onTap: () async {},
                            //       child: ImageHelperWidget.assetImageWidget(
                            //         context: context,
                            //         height: 30.h(context),
                            //         width: 30.w(context),
                            //         imageString: ImageUtils.chatIconImage,
                            //       ),
                            //     ),
                            //
                            //     SpaceHelperWidget.h(16.h(context)),
                            //
                            //
                            //     InkWell(
                            //       onTap: () async {},
                            //       child: ImageHelperWidget.assetImageWidget(
                            //         context: context,
                            //         height: 30.h(context),
                            //         width: 30.w(context),
                            //         imageString: ImageUtils.chatDocumentImage,
                            //       ),
                            //     ),
                            //
                            //
                            //     SpaceHelperWidget.h(16.h(context)),
                            //
                            //   ],
                            // ),


                            Expanded(
                              child: TextFormFieldWidget.build(
                                context: context,
                                fillColor: ColorUtils.white255,
                                hintText: "Type your message",
                                controller:  plannerChatController.chatController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),

                            Row(
                              children: [

                                SpaceHelperWidget.h(16.h(context)),
                                InkWell(
                                  onTap: () async {
                                    if( plannerChatController.chatController.value.text == "") {
                                      MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter a message");
                                    } else {
                                      Map<String,dynamic> data = {
                                        "chatId": plannerChatController.getChatDetailsResponseModel.value.data?.sId ?? "",
                                        "text": plannerChatController.chatController.value.text,
                                        "imageUrl": []
                                      };
                                      //
                                      print(data);
                                      final ack = await plannerSocketServiceController.emitWithAck('send-message', data);
                                      print('Acknowledgment received: $ack, type: ${ack.runtimeType}');
                                      print("send dddd");
                                      plannerChatController.chatController.value.clear();
                                      plannerChatController.isTyping.value = false;
                                      FocusScope.of(context).unfocus();
                                      await plannerChatController.getAllMessageController(context: context, chatId: chatId);
                                    }
                                  },
                                  child: ImageHelperWidget.assetImageWidget(
                                    context: context,
                                    height: 30.h(context),
                                    width: 30.w(context),
                                    imageString: ImageUtils.sendMessageImage,
                                  ),
                                ),

                              ],
                            ),

                          ],
                        ),


                        SpaceHelperWidget.v(12.h(context)),
                      ],
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),)
      ),
    );
  }
}
