import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';
class VendorChatView extends StatelessWidget {
  VendorChatView({super.key});

  final VendorChatController vendorChatController = Get.put(VendorChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [


                    AuthAppBarHelperWidget(
                      onBackPressed: () async {
                        Get.off(()=>DashboardVendorView(index: 3,),preventDuplicates: false);
                      },
                      centerTitle: true,
                      customTitle: Row(
                        children: [


                          ImageHelperWidget.circleImageHelperWidget(
                            width: 40.w(context),
                            height: 40.h(context),
                            verticalPadding: 1.vpm(context),
                            horizontalPadding: 1.hpm(context),
                            backgroundColor: ColorUtils.orange213,
                            radius: 25.r(context),
                            imageAsset: ImageUtils.noImage,
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
                                  text: "Shahid Hasan",
                                ),

                                SpaceHelperWidget.v(3.h(context)),

                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.centerLeft,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  textColor: ColorUtils.black107,
                                  text: "Shahid is typing...",
                                ),



                              ],
                            ),
                          ),

                        ],
                      ),
                      actions: [
                        InkWell(
                          onTap: () async {},
                          child: Icon(
                            Icons.more_vert_rounded,
                            color: ColorUtils.black14,
                            size: 30.r(context),
                          ),
                        ),

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
                                  context: context,
                                  messageModel: vendorChatController.messages[index],
                                ),
                              );
                            },
                            childCount: vendorChatController.messages.length
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

                          InkWell(
                            onTap: () async {},
                            child: ImageHelperWidget.assetImageWidget(
                              context: context,
                              height: 30.h(context),
                              width: 30.w(context),
                              imageString: ImageUtils.chatIconImage,
                            ),
                          ),


                          SpaceHelperWidget.h(16.h(context)),

                          InkWell(
                            onTap: () async {},
                            child: ImageHelperWidget.assetImageWidget(
                              context: context,
                              height: 30.h(context),
                              width: 30.w(context),
                              imageString: ImageUtils.chatDocumentImage,
                            ),
                          ),


                          SpaceHelperWidget.h(16.h(context)),

                          Expanded(
                            child: TextFormFieldWidget.build(
                              context: context,
                              fillColor: ColorUtils.white255,
                              hintText: "Type your message",
                              controller: vendorChatController.chatController.value,
                              keyboardType: TextInputType.emailAddress,
                              suffixIcon: Padding(
                                padding: EdgeInsets.fromLTRB(
                                  20.lpm(context),
                                  20.tpm(context),
                                  20.rpm(context),
                                  20.bpm(context),
                                ),
                                child: ImageHelperWidget.assetImageWidget(
                                  context: context,
                                  height: 20.h(context),
                                  width: 20.w(context),
                                  imageString: ImageUtils.chatEmojiImage,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
