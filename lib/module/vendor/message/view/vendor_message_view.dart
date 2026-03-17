import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorMessageView extends StatelessWidget {
  VendorMessageView({super.key});

  final VendorSocketServiceController vendorSocketServiceController = Get.put(VendorSocketServiceController());
  @override
  Widget build(BuildContext context) {
    final VendorMessageController vendorMessageController = Get.put(VendorMessageController(context: context));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: vendorMessageController.isLoading.value == true ?
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
                                vendorMessageController.isSingleChat.value = true;
                                vendorMessageController.isGroupChat.value = false;
                                vendorMessageController.selectChatType.value = "User";
                                vendorMessageController.isLoading.value = true;
                                await vendorMessageController.getAllChatMessageController(context: context,modelType: "User");
                              },
                              text: "Single Chat",
                              padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                              alignment: Alignment.center,
                              textColor: vendorMessageController.isSingleChat.value == true ? ColorUtils.blue96 : ColorUtils.black48,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              backgroundColor: vendorMessageController.isSingleChat.value == true ? ColorUtils.blue173 : Colors.transparent,
                            ),
                          ),


                          SpaceHelperWidget.h(6.w(context)),

                          Expanded(
                            child: ButtonHelperWidget.customButtonWidgetAdventPro(
                              context: context,
                              onPressed: () async {
                                vendorMessageController.isSingleChat.value = false;
                                vendorMessageController.isGroupChat.value = true;
                                vendorMessageController.selectChatType.value = "Project";
                                vendorMessageController.isLoading.value = true;
                                await vendorMessageController.getAllChatMessageController(context: context,modelType: "Project");
                              },
                              text: "Group Chat",
                              padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                              alignment: Alignment.center,
                              textColor: vendorMessageController.isGroupChat.value == true ? ColorUtils.blue96 : ColorUtils.black48,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              backgroundColor: vendorMessageController.isGroupChat.value == true ? ColorUtils.blue173 : Colors.transparent,
                            ),
                          ),


                        ],
                      ),


                      SpaceHelperWidget.v(10.h(context)),

                      TextFormFieldWidget.build(
                        context: context,
                        hintText: "Search Chat...",
                        controller: vendorMessageController.searchController.value,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) async {
                          await vendorMessageController.getSearchChatMessageController(
                            context: context,
                            modelType: vendorMessageController.selectChatType.value,
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



              vendorMessageController.getAllChatResponseModel.value.data?.isNotEmpty == true ?
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context,int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                        child: InkWell(
                          onTap: () async {
                            await vendorMessageController.seenMessageController(context: context, chatId: vendorMessageController.getAllChatResponseModel.value.data?[index].sId);
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

                                if(vendorMessageController.isSingleChat.value == false)...[
                                  ImageHelperWidget.circleImageHelperWidget(
                                    width: 50.w(context),
                                    height: 50.h(context),
                                    verticalPadding: 1.vpm(context),
                                    horizontalPadding: 1.hpm(context),
                                    backgroundColor: ColorUtils.orange213,
                                    radius: 25.r(context),
                                    imageAsset: vendorMessageController.getAllChatResponseModel.value.data?[index].participants?.first.user?.photoUrl == null ? ImageUtils.noImage : null,
                                    imageUrl: vendorMessageController.getAllChatResponseModel.value.data?[index].participants?.first.user?.photoUrl,
                                  ),
                                ] else ...[
                                  ImageHelperWidget.circleImageHelperWidget(
                                    width: 50.w(context),
                                    height: 50.h(context),
                                    verticalPadding: 1.vpm(context),
                                    horizontalPadding: 1.hpm(context),
                                    backgroundColor: ColorUtils.orange213,
                                    radius: 25.r(context),
                                    imageAsset: vendorMessageController.getAllChatResponseModel.value.data?[index].participants?.last.user?.photoUrl == null ? ImageUtils.noImage : null,
                                    imageUrl: vendorMessageController.getAllChatResponseModel.value.data?[index].participants?.last.user?.photoUrl,
                                  ),
                                ],


                                SpaceHelperWidget.h(16.w(context)),

                                // Name + Message Preview
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if(vendorMessageController.isSingleChat.value == false)...[
                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          textColor: ColorUtils.black64,
                                          text: vendorMessageController.getAllChatResponseModel.value.data?[index].name ?? "",
                                        ),
                                      ] else...[
                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          textColor: ColorUtils.black64,
                                          text: vendorMessageController.getAllChatResponseModel.value.data?[index].participants?.last.user?.name ?? "",
                                        ),
                                      ],



                                      SpaceHelperWidget.v(6.h(context)),

                                      vendorMessageController.getAllChatResponseModel.value.data?[index].lastMessage == null ?
                                      SizedBox.shrink() :
                                      TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        alignment: Alignment.centerLeft,
                                        fontSize: 16,
                                        fontWeight: vendorMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.seen == false ? FontWeight.w600 : FontWeight.w400,
                                        textColor: vendorMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.seen == false ? ColorUtils.black21 : ColorUtils.black107,
                                        text: vendorMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.imageUrl?.isEmpty == true ?
                                        vendorMessageController.getAllChatResponseModel.value.data![index].lastMessage!.text :
                                        vendorMessageController.getAllChatResponseModel.value.data![index].lastMessage!.imageUrl!.first.split("/").last,
                                      ),

                                    ],
                                  ),
                                ),


                                SpaceHelperWidget.h(6.w(context)),


                                // Time + Unread Badge
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    vendorMessageController.getAllChatResponseModel.value.data?[index].lastMessage == null ?
                                    SizedBox.shrink() :
                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.centerLeft,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      textColor: ColorUtils.black107,
                                      text: vendorMessageController.getDynamicTime(vendorMessageController.getAllChatResponseModel.value.data?[index].lastMessage?.createdAt, DateTime.now().toString()),
                                    ),


                                    SpaceHelperWidget.v(20.h(context)),


                                    // Unread bubble
                                    vendorMessageController.getAllChatResponseModel.value.data?[index].unreadCount == 0 ?
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
                                        text: vendorMessageController.getAllChatResponseModel.value.data?[index].unreadCount.toString() ?? "0",
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
                    childCount: vendorMessageController.getAllChatResponseModel.value.data?.length,
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
