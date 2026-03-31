import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';
class VendorChatView extends StatelessWidget {
  VendorChatView({super.key,required this.chatId});
  final String chatId;
  final VendorSocketServiceController vendorSocketServiceController = Get.put(VendorSocketServiceController());

  @override
  Widget build(BuildContext context) {
    final VendorChatController vendorChatController = Get.put(VendorChatController(context: context,chatId: chatId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardVendorView(index: 3,),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=> SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: Column(
              children: [

                Expanded(
                  child: vendorChatController.isLoading.value == true ?
                  LoadingHelperWidget.loadingHelperWidget(context: context,height: 930.h(context)) :
                  CustomScrollView(
                    slivers: [


                      AuthAppBarHelperWidget(
                        onBackPressed: () async {
                          Get.off(()=>DashboardVendorView(index: 3,),preventDuplicates: false);
                        },
                        centerTitle: true,
                        customTitle: Column(
                          children: [

                            if(vendorChatController.getChatDetailsResponseModel.value.data?.reference == null)...[
                              Row(
                                children: [

                                  ImageHelperWidget.circleImageHelperWidget(
                                    width: 40.w(context),
                                    height: 40.h(context),
                                    verticalPadding: 1.vpm(context),
                                    horizontalPadding: 1.hpm(context),
                                    backgroundColor: ColorUtils.orange213,
                                    radius: 25.r(context),
                                    imageAsset: vendorChatController.getChatDetailsResponseModel.value.data?.participants?.last.user?.photoUrl ==  null ? ImageUtils.noImage : null,
                                    imageUrl: vendorChatController.getChatDetailsResponseModel.value.data?.participants?.last.user?.photoUrl,
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
                                          text: vendorChatController.getChatDetailsResponseModel.value.data?.participants?.last.user?.name,
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
                                    imageAsset: vendorChatController.getChatDetailsResponseModel.value.data?.participants?.first.user?.photoUrl ==  null ? ImageUtils.noImage : null,
                                    imageUrl: vendorChatController.getChatDetailsResponseModel.value.data?.participants?.first.user?.photoUrl,
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
                                          text: vendorChatController.getChatDetailsResponseModel.value.data?.name,
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
                                  child: VendorChatWidget.vendorChatWidget(
                                    index: index,
                                    vendorChatController: vendorChatController,
                                    context: context,
                                  ),
                                );
                              },
                              childCount: vendorChatController.getAllMessageResponseModel.value.data?.length
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
                                controller: vendorChatController.chatController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),

                            Row(
                              children: [

                                SpaceHelperWidget.h(16.h(context)),
                                InkWell(
                                  onTap: () async {
                                    if(vendorChatController.chatController.value.text == "") {
                                      MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter a message");
                                    } else {
                                      Map<String,dynamic> data = {
                                        "chatId": vendorChatController.getChatDetailsResponseModel.value.data?.sId ?? "",
                                        "text": vendorChatController.chatController.value.text,
                                        "imageUrl": []
                                      };
                                      //
                                      print(data);
                                      final ack = await vendorSocketServiceController.emitWithAck('send-message', data);
                                      print('Acknowledgment received: $ack, type: ${ack.runtimeType}');
                                      print("send dddd");
                                      vendorChatController.chatController.value.clear();
                                      FocusScope.of(context).unfocus();
                                      await vendorChatController.getAllMessageController(context: context, chatId: chatId);
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
        )),
      ),
    );
  }
}
