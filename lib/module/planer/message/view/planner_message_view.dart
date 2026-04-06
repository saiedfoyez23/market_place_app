import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerMessageView extends StatelessWidget {
  PlannerMessageView({super.key});

  final PlannerSocketServiceController plannerSocketServiceController = Get.put(PlannerSocketServiceController());

  @override
  Widget build(BuildContext context) {
    final PlannerMessageController plannerMessageController = Get.put(PlannerMessageController(context: context));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: plannerMessageController.isLoading.value == true ?
          LoadingHelperWidget.loadingHelperWidget(context: context,height: 930.h(context)) :
          CustomScrollView(
            slivers: [

              MainPageAppBarHelperWidget(
                centerTitle: false,
                title: "Messages",
                actions: [


                  // InkWell(
                  //   onTap: () async {},
                  //   child: ImageHelperWidget.assetImageWidget(
                  //     context: context,
                  //     height: 40.h(context),
                  //     width: 40.w(context),
                  //     imageString: ImageUtils.notificationBellImage,
                  //   ),
                  // ),
                  //
                  // SpaceHelperWidget.h(15.w(context)),


                ],
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperWidget.v(15.h(context)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: ButtonHelperWidget.customButtonWidgetAdventPro(
                              context: context,
                              onPressed: () async {
                                plannerMessageController.isSingleChat.value = true;
                                plannerMessageController.isOrderChat.value = false;
                                plannerMessageController.isGroupChat.value = false;
                                plannerMessageController.selectChatType.value = "User";
                                plannerMessageController.isLoading.value = true;
                                await plannerMessageController.getAllChatMessageController(context: context,modelType: "User");
                              },
                              text: "Single Chat",
                              padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                              alignment: Alignment.center,
                              textColor: plannerMessageController.isSingleChat.value == true ? ColorUtils.blue96 : ColorUtils.black48,
                              fontWeight: FontWeight.w600,
                              backgroundColor: plannerMessageController.isSingleChat.value == true ? ColorUtils.blue173 : Colors.transparent,
                            ),
                          ),

                          SpaceHelperWidget.h(6.w(context)),

                          Expanded(
                            child: ButtonHelperWidget.customButtonWidgetAdventPro(
                              context: context,
                              onPressed: () async {
                                plannerMessageController.isSingleChat.value = false;
                                plannerMessageController.isOrderChat.value = true;
                                plannerMessageController.isGroupChat.value = false;
                                plannerMessageController.selectChatType.value = "Order";
                                plannerMessageController.isLoading.value = true;
                                await plannerMessageController.getAllChatMessageController(context: context,modelType: "Order");
                              },
                              text: "Order Chat",
                              padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                              alignment: Alignment.center,
                              textColor: plannerMessageController.isOrderChat.value == true ? ColorUtils.blue96 : ColorUtils.black48,
                              fontWeight: FontWeight.w600,
                              backgroundColor: plannerMessageController.isOrderChat.value == true ? ColorUtils.blue173 : Colors.transparent,
                            ),
                          ),

                          SpaceHelperWidget.h(6.w(context)),

                          Expanded(
                            child: ButtonHelperWidget.customButtonWidgetAdventPro(
                              context: context,
                              onPressed: () async {
                                plannerMessageController.isSingleChat.value = false;
                                plannerMessageController.isOrderChat.value = false;
                                plannerMessageController.isGroupChat.value = true;
                                plannerMessageController.selectChatType.value = "Project";
                                plannerMessageController.isLoading.value = true;
                                await plannerMessageController.getAllChatMessageController(context: context,modelType: "Project");
                              },
                              text: "Group Chat",
                              padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                              alignment: Alignment.center,
                              textColor:plannerMessageController.isGroupChat.value == true ? ColorUtils.blue96 : ColorUtils.black48,
                              fontWeight: FontWeight.w600,
                              backgroundColor: plannerMessageController.isGroupChat.value == true ? ColorUtils.blue173 : Colors.transparent,
                            ),
                          ),


                        ],
                      ),


                      SpaceHelperWidget.v(10.h(context)),

                      TextFormFieldWidget.build(
                        context: context,
                        hintText: "Search Chat...",
                        controller: plannerMessageController.searchController.value,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) async {
                          await plannerMessageController.getSearchChatMessageController(
                            context: context,
                            modelType: plannerMessageController.selectChatType.value,
                            searchTerm: value.toString(),
                          );
                        },
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



              plannerMessageController.getAllChatResponseModel.value.data?.isNotEmpty == true ?
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context,int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                        child: InkWell(
                          onTap: () async {
                            await plannerMessageController.seenMessageController(context: context, chatId: plannerMessageController.getAllChatResponseModel.value.data?[index].sId);
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

                                if(plannerMessageController.isSingleChat.value == false)...[
                                  ImageHelperWidget.circleImageHelperWidget(
                                    width: 50.w(context),
                                    height: 50.h(context),
                                    verticalPadding: 1.vpm(context),
                                    horizontalPadding: 1.hpm(context),
                                    backgroundColor: ColorUtils.orange213,
                                    radius: 25.r(context),
                                    imageAsset: plannerMessageController.getAllChatResponseModel.value.data?[index].participants?.first.user?.photoUrl == null ? ImageUtils.noImage : null,
                                    imageUrl: plannerMessageController.getAllChatResponseModel.value.data?[index].participants?.first.user?.photoUrl,
                                  ),
                                ] else ...[
                                  ImageHelperWidget.circleImageHelperWidget(
                                    width: 50.w(context),
                                    height: 50.h(context),
                                    verticalPadding: 1.vpm(context),
                                    horizontalPadding: 1.hpm(context),
                                    backgroundColor: ColorUtils.orange213,
                                    radius: 25.r(context),
                                    imageAsset: plannerMessageController.getAllChatResponseModel.value.data?[index].participants?.where((value) => value.user?.sId != plannerMessageController.plannerMyProfileDetailsResponseModel.value.data?.sId).first.user?.photoUrl == null ? ImageUtils.noImage : null,
                                    imageUrl: plannerMessageController.getAllChatResponseModel.value.data?[index].participants?.where((value) => value.user?.sId != plannerMessageController.plannerMyProfileDetailsResponseModel.value.data?.sId).first.user?.photoUrl,
                                  ),
                                ],


                                SpaceHelperWidget.h(16.w(context)),

                                // Name + Message Preview
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if(plannerMessageController.isSingleChat.value == false)...[
                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          textColor: ColorUtils.black64,
                                          text: plannerMessageController.getAllChatResponseModel.value.data?[index].name ?? "",
                                        ),
                                      ] else...[
                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          textColor: ColorUtils.black64,
                                          text: plannerMessageController.getAllChatResponseModel.value.data?[index].participants?.where((value) => value.user?.sId != plannerMessageController.plannerMyProfileDetailsResponseModel.value.data?.sId).first.user?.name ?? "",
                                        ),
                                      ],



                                      SpaceHelperWidget.v(6.h(context)),
                                      
                                      if(plannerMessageController.getAllChatResponseModel.value.data?[index].lastMessage == null) ...[
                                        SizedBox.shrink()
                                      ] else...[
                                        
                                        if(plannerMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.imageUrl?.isEmpty == true)...[
                                          TextHelperClass.headingTextWithoutWidth(
                                            context: context,
                                            alignment: Alignment.centerLeft,
                                            fontSize: 16,
                                            textOverFlow: TextOverflow.ellipsis,
                                            fontWeight: plannerMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.seen == false ? FontWeight.w600 : FontWeight.w400,
                                            textColor: plannerMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.seen == false ? ColorUtils.black21 : ColorUtils.black107,
                                            text: plannerMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.imageUrl?.isEmpty == true ?
                                            plannerMessageController.getAllChatResponseModel.value.data![index].lastMessage!.text :
                                            plannerMessageController.getAllChatResponseModel.value.data![index].lastMessage!.imageUrl!.first.split("/").last,
                                          ),
                                        ] else...[
                                          if(plannerMessageController.isImage(plannerMessageController.getAllChatResponseModel.value.data![index].lastMessage!.imageUrl!.first) == true)...[
                                            TextHelperClass.headingTextWithoutWidth(
                                              context: context,
                                              alignment: Alignment.centerLeft,
                                              fontSize: 16,
                                              textOverFlow: TextOverflow.ellipsis,
                                              fontWeight: plannerMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.seen == false ? FontWeight.w600 : FontWeight.w400,
                                              textColor: plannerMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.seen == false ? ColorUtils.black21 : ColorUtils.black107,
                                              text: plannerMessageController.getAllChatResponseModel.value.data![index].lastMessage!.imageUrl!.length > 1 ?
                                              "${plannerMessageController.getAllChatResponseModel.value.data![index].lastMessage?.imageUrl?.length} Photos" :
                                              "${plannerMessageController.getAllChatResponseModel.value.data![index].lastMessage?.imageUrl?.length} Photo",
                                            ),
                                          ] else...[
                                            TextHelperClass.headingTextWithoutWidth(
                                              context: context,
                                              alignment: Alignment.centerLeft,
                                              fontSize: 16,
                                              textOverFlow: TextOverflow.ellipsis,
                                              fontWeight: plannerMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.seen == false ? FontWeight.w600 : FontWeight.w400,
                                              textColor: plannerMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.seen == false ? ColorUtils.black21 : ColorUtils.black107,
                                              text: plannerMessageController.getAllChatResponseModel.value.data![index].lastMessage!.imageUrl!.length > 1 ?
                                              "${plannerMessageController.getAllChatResponseModel.value.data![index].lastMessage?.imageUrl?.length} Files" :
                                              "${plannerMessageController.getAllChatResponseModel.value.data![index].lastMessage?.imageUrl?.length} File",
                                            ),
                                          ]
                                        ]
                                       
                                      ]
                                      
                                    ],
                                  ),
                                ),


                                SpaceHelperWidget.h(6.w(context)),


                                // Time + Unread Badge
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    plannerMessageController.getAllChatResponseModel.value.data?[index].lastMessage == null ?
                                    SizedBox.shrink() :
                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.centerLeft,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      textColor: ColorUtils.black107,
                                      text: plannerMessageController.getDynamicTime(plannerMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.createdAt, DateTime.now().toString()),
                                    ),


                                    SpaceHelperWidget.v(20.h(context)),


                                    // Unread bubble
                                    plannerMessageController.getAllChatResponseModel.value.data?[index].unreadCount == 0 ?
                                    SizedBox.shrink() :
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
                                        text: plannerMessageController.getAllChatResponseModel.value.data?[index].unreadCount.toString() ?? "0",
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
                    childCount: plannerMessageController.getAllChatResponseModel.value.data?.length,
                  )
              ) :
              SliverFillRemaining(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: SizedBox(
                    height: 630.h(context),
                    width: 428.w(context),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.center,
                        textAlign: TextAlign.start,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        textColor: ColorUtils.black48,
                        text: "No Chat Available",
                      ),
                    ),
                  ),
                ),
              ),




            ],
          ),
        ),
      )),
    );
  }
}
