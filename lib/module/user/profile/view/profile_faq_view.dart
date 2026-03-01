import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class ProfileFaqView extends StatelessWidget {
  ProfileFaqView({super.key});


  @override
  Widget build(BuildContext context) {
    final ProfileFaqController profileFaqController = Get.put(ProfileFaqController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardUserView(index: 4,),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: profileFaqController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardUserView(index: 4,),preventDuplicates: false);
                  },
                  title: "FAQ",
                ),


                SliverToBoxAdapter(
                  child: SpaceHelperWidget.v(32.h(context)),
                ),


                SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (context,int index) {
                            return Obx(()=>Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 32.bpm(context)),
                                padding: EdgeInsets.fromLTRB(
                                  14.lpm(context),
                                  12.tpm(context),
                                  14.lpm(context),
                                  12.tpm(context),
                                ),
                                decoration: BoxDecoration(
                                  color: ColorUtils.white243,
                                  borderRadius: BorderRadius.circular(12.r(context)),
                                ),
                                child: Theme(
                                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                  child: ExpansionTile(
                                    tilePadding: EdgeInsets.zero,
                                    childrenPadding: EdgeInsets.zero,
                                    controller: profileFaqController.tileControllers[index],
                                    onExpansionChanged: (expanded) {
                                      if (expanded) {
                                        profileFaqController.expandOnly(index);
                                      } else {
                                        profileFaqController.collapseCurrent();
                                      }
                                    },
                                    title: TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.centerLeft,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      textColor: ColorUtils.black64,
                                      text: '${index + 1}. ${profileFaqController.userFAQResponseModel.value.data?[index].question}',
                                    ),
                                    trailing: profileFaqController.currentExpanded.value == index ?
                                    ImageHelperWidget.assetImageWidget(
                                      context: context,
                                      height: 34.h(context),
                                      width: 34.w(context),
                                      imageString: ImageUtils.downImage,
                                    ) :
                                    ImageHelperWidget.assetImageWidget(
                                      context: context,
                                      height: 34.h(context),
                                      width: 34.w(context),
                                      imageString: ImageUtils.leftImage,
                                    ),
                                    children: [
                                      TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        alignment: Alignment.centerLeft,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        textColor: ColorUtils.black64,
                                        text: profileFaqController.userFAQResponseModel.value.data?[index].answer ?? "",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                          },
                      childCount: profileFaqController.userFAQResponseModel.value.data?.length
                  ),
                )





              ],
            ),
          ),
        )),
      ),
    );
  }
}