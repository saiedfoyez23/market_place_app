import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class PlannerProfilePortfolioView extends StatelessWidget {
  PlannerProfilePortfolioView({super.key});


  @override
  Widget build(BuildContext context) {
    final PlannerProfilePortfolioController plannerProfilePortfolioController = Get.put(PlannerProfilePortfolioController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(() {
          final bool isLocked = plannerProfilePortfolioController.plannerMyProfileDetailsResponseModel.value.data?.type == null;
          return SafeArea(
            child: Container(
              height: 930.h(context),
              width: 428.w(context),
              decoration: BoxDecoration(
                color: ColorUtils.white251,
              ),
              child: plannerProfilePortfolioController.isLoading.value == true ?
              LoadingHelperWidget.loadingHelperWidget(
                context: context,
                height: 930.h(context),
              ) :
              Stack(
                children: [

                  IgnorePointer(
                    ignoring: isLocked,
                    child: CustomScrollView(
                      physics: isLocked ?
                      const NeverScrollableScrollPhysics() :
                      const BouncingScrollPhysics(),
                      slivers: [


                        AuthAppBarHelperWidget(
                          onBackPressed: () async {
                            Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
                          },
                          title: "Portfolio",
                          actions: [
                            plannerProfilePortfolioController.isSubmit.value == true ?
                            LoadingHelperWidget.loadingHelperWidget(
                              height: 40,
                              width: 50,
                              context: context,
                            ) :
                            ButtonHelperWidget.customIconButtonWidgetAdventPro(
                              context: context,
                              backgroundColor: ColorUtils.orange119,
                              iconSize: 20,
                              height: 40,
                              padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 16.hpm(context)),
                              borderRadius: 8,
                              textColor: ColorUtils.white255,
                              fontWeight: FontWeight.w700,
                              onPressed: () async {
                                await plannerProfilePortfolioController.pickFile(context: context);
                              },
                              iconPath: ImageUtils.uploadIconImage,
                              text: "Upload",
                            ),

                            SpaceHelperWidget.h(15.w(context))

                          ],
                        ),


                        SliverToBoxAdapter(
                          child: SpaceHelperWidget.v(32.h(context)),
                        ),



                        SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                          sliver: plannerProfilePortfolioController.plannerUserWisePortfolioModel.value.data?.isNotEmpty == true ?
                          SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                                    (context,int index) {
                                  return InkWell(
                                    onTap: () async {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: true, // user must tap a button
                                        builder: (context) {
                                          return Dialog(
                                            insetPadding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.r(context)),
                                            ),
                                            child: IntrinsicHeight(
                                              child: Container(
                                                height: 768.h(context),
                                                width: 428.w(context),
                                                decoration: BoxDecoration(
                                                    color: ColorUtils.white255,
                                                    borderRadius: BorderRadius.circular(20.r(context)),
                                                    image: DecorationImage(
                                                      image: NetworkImage(plannerProfilePortfolioController.plannerUserWisePortfolioModel.value.data?[index].url),
                                                      fit: BoxFit.cover,
                                                    )
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        ClipRRect(
                                          clipBehavior: Clip.antiAlias,
                                          borderRadius: BorderRadius.circular(12.r(context)),
                                          child: ImageHelperWidget.styledImage(
                                            context: context,
                                            height: 320.h(context),
                                            width: 220.w(context),
                                            imageUrl: plannerProfilePortfolioController.plannerUserWisePortfolioModel.value.data?[index].url,
                                          ),
                                        ),


                                        Positioned(
                                          top: 12.h(context),
                                          right: 12.w(context),
                                          child: InkWell(
                                            onTap: () async {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false, // user must tap a button
                                                builder: (context) {
                                                  return Obx(()=>Dialog(
                                                    insetPadding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20.r(context)),
                                                    ),
                                                    child: IntrinsicHeight(
                                                      child: Container(
                                                        width: 428.w(context),
                                                        decoration: BoxDecoration(
                                                          color: ColorUtils.white255,
                                                          borderRadius: BorderRadius.circular(20.r(context)),
                                                        ),
                                                        padding: EdgeInsets.fromLTRB(
                                                          16.lpm(context),
                                                          20.tpm(context),
                                                          16.rpm(context),
                                                          20.bpm(context),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            /// ===== Title Text =====

                                                            TextHelperClass.headingTextWithoutWidth(
                                                              context: context,
                                                              alignment: Alignment.center,
                                                              textAlign: TextAlign.center,
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.w600,
                                                              textColor: ColorUtils.black21,
                                                              text: "Are you sure you want to delete the portfolio image? ",
                                                            ),


                                                            SpaceHelperWidget.v(32.h(context)),


                                                            /// ===== Buttons Row =====
                                                            Row(
                                                              children: [
                                                                /// No Button

                                                                Expanded(
                                                                  child: ButtonHelperWidget.customButtonWidget(
                                                                    context: context,
                                                                    onPressed: () async {
                                                                      Navigator.pop(context);
                                                                    },
                                                                    text: "No",
                                                                    borderRadius: 40,
                                                                    backgroundColor: ColorUtils.white243,
                                                                    fontWeight: FontWeight.w600,
                                                                    textColor: ColorUtils.black89,
                                                                  ),
                                                                ),


                                                                SpaceHelperWidget.h(10.w(context)),


                                                                Expanded(
                                                                  child: plannerProfilePortfolioController.isDelete.value == true ?
                                                                  LoadingHelperWidget.loadingHelperWidget(
                                                                    context: context,
                                                                    height: 56.h(context),
                                                                  ) :
                                                                  ButtonHelperWidget.customButtonWidget(
                                                                    context: context,
                                                                    onPressed: () async {
                                                                      await plannerProfilePortfolioController.deletePlannerPortfolioController(context: context, id: plannerProfilePortfolioController.plannerUserWisePortfolioModel.value.data?[index].sId ?? "");
                                                                    },
                                                                    text: "Delete",
                                                                    borderRadius: 40,
                                                                    backgroundColor: ColorUtils.red191,
                                                                    fontWeight: FontWeight.w600,
                                                                    textColor: ColorUtils.white255,
                                                                  ),
                                                                ),

                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ));
                                                },
                                              );
                                            },
                                            child: ImageHelperWidget.assetImageWidget(
                                              context: context,
                                              height: 32.h(context),
                                              width: 32.w(context),
                                              imageString: ImageUtils.fileDeleteImage,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                childCount: plannerProfilePortfolioController.plannerUserWisePortfolioModel.value.data?.length
                            ),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.h(context),
                              crossAxisSpacing: 15.w(context),
                            ),
                          ) :
                          SliverFillRemaining(
                            child: Align(
                              alignment: Alignment.center,
                              child: TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.center,
                                textAlign: TextAlign.start,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                textColor: ColorUtils.black48,
                                text: "No Portfolio Available",
                              ),
                            ),
                          ),
                        ),

                        SliverToBoxAdapter(
                          child: SpaceHelperWidget.v(32.h(context)),
                        ),


                      ],
                    ),
                  ),

                  if (isLocked)...[
                    Positioned.fill(
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Icon(Icons.lock, size: 80.r(context), color: Colors.white),

                                    SpaceHelperWidget.v(20.h(context)),

                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.center,
                                      textAlign: TextAlign.center,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      textColor: ColorUtils.black48,
                                      text: "Access Restricted",
                                    ),

                                    SpaceHelperWidget.v(12.h(context)),

                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.center,
                                      textAlign: TextAlign.center,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      textColor: ColorUtils.black48,
                                      text: "Only subscribed members can see this feature",
                                    ),

                                    SpaceHelperWidget.v(12.h(context)),

                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.center,
                                      textAlign: TextAlign.center,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500,
                                      textColor: ColorUtils.black48,
                                      text: "Subscribe now to unlock this feature.",
                                    ),

                                    SpaceHelperWidget.v(20.h(context)),

                                    ButtonHelperWidget.customButtonWidgetAdventPro(
                                      context: context,
                                      onPressed: () async {
                                        Get.off(()=>PlannerProfileSubscriptionView(),preventDuplicates: false);
                                      },
                                      text: "Subscribe Now",
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]

                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
