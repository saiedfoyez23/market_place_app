import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class MessageView extends StatelessWidget {
  MessageView({super.key});

  final MessageController messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 930.h(context),
        width: 428.w(context),
        decoration: BoxDecoration(
          color: ColorUtils.white251,
        ),
        child: CustomScrollView(
          slivers: [

            MainPageAppBarHelperWidget(
              centerTitle: false,
              title: "Messages",
              actions: [


                InkWell(
                  onTap: () async {},
                  child: ImageHelperWidget.assetImageWidget(
                    context: context,
                    height: 40.h(context),
                    width: 40.w(context),
                    imageString: ImageUtils.notificationBellImage,
                  ),
                ),

                SpaceHelperWidget.h(15.w(context)),


              ],
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                child: Column(
                  children: [

                    SpaceHelperWidget.v(32.h(context)),


                    TextFormFieldWidget.build(
                      context: context,
                      hintText: "Search Planner...",
                      controller: messageController.searchController.value,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(
                          20.lpm(context),
                          14.5.tpm(context),
                          5.rpm(context),
                          14.5.bpm(context),
                        ),
                        child: ImageHelperWidget.assetImageWidget(
                          context: context,
                          height: 20.h(context),
                          width: 20.w(context),
                          imageString: ImageUtils.searchImage,
                        ),
                      ),
                    ),

                    SpaceHelperWidget.v(32.h(context)),


                  ],
                ),
              ),
            ),


            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context,int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                        child: InkWell(
                          onTap: () async {
                            Get.off(()=>ChatView(),preventDuplicates: false);
                          },
                          child: Container(
                            width: 428.w(context),
                            margin: EdgeInsets.only(bottom: 16.h(context)),
                            padding: EdgeInsets.only(bottom: 16.h(context)),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border(
                                  bottom: BorderSide(
                                    color: ColorUtils.white230,
                                    width: 1.w(context),
                                  ),
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                // Profile Image

                                ImageHelperWidget.circleImageHelperWidget(
                                  width: 50.w(context),
                                  height: 50.h(context),
                                  verticalPadding: 1.vpm(context),
                                  horizontalPadding: 1.hpm(context),
                                  backgroundColor: ColorUtils.orange213,
                                  radius: 25.r(context),
                                  imageAsset: ImageUtils.noImage,
                                ),

                                SpaceHelperWidget.h(16.w(context)),

                                // Name + Message Preview
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        alignment: Alignment.centerLeft,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        textColor: ColorUtils.black64,
                                        text: "Shahid Hasan",
                                      ),

                                      SpaceHelperWidget.v(6.h(context)),


                                      TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        alignment: Alignment.centerLeft,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        textColor: ColorUtils.black107,
                                        text: "There are many variations of passages of Lorem Ipsum available...",
                                      ),

                                    ],
                                  ),
                                ),


                                SpaceHelperWidget.h(6.w(context)),


                                // Time + Unread Badge
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [


                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.centerLeft,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      textColor: ColorUtils.black107,
                                      text: "20 min",
                                    ),


                                    SpaceHelperWidget.v(20.h(context)),


                                    // Unread bubble
                                    Container(
                                      height: 30.h(context),
                                      width: 30.w(context),
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                      child: TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        alignment: Alignment.center,
                                        textAlign: TextAlign.center,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        textColor: ColorUtils.white255,
                                        text: "1",
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  childCount: 12,
                )
            ),




          ],
        ),
      ),
    );
  }
}
