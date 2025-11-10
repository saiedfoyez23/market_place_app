import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlanerOnboardingView extends StatelessWidget {
  PlanerOnboardingView({super.key});

  final PlanerOnboardingController planerOnboardingController = Get.put(PlanerOnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: CustomScrollView(
              slivers: [


                SliverToBoxAdapter(
                  child: Column(
                    children: [

                      SpaceHelperWidget.v(32.h(context)),


                      Align(
                        alignment: Alignment.centerRight,
                        child: IntrinsicWidth(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                            child: ButtonHelperWidget.customButtonWidget(
                              context: context,
                              onPressed: () async {},
                              text: "Skip",
                              padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                              alignment: Alignment.centerRight,
                              textColor: ColorUtils.black64,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),



                      SizedBox(
                        height: 650.h(context),
                        child: PageView(
                          controller: planerOnboardingController.pageController.value,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value) {
                            planerOnboardingController.changeIndex(value);
                          },
                          children: [
                            UserOnboardingWidget.userPageViewWidget(
                              context: context,
                              imagePath: ImageUtils.onbordingScreen1,
                              title: "Discover Products & Services",
                              description: "Browse through thousands of products and services from trusted sellers in your area.",
                            ),
                            UserOnboardingWidget.userPageViewWidget(
                              context: context,
                              imagePath: ImageUtils.onbordingScreen2,
                              title: "Secure Payments",
                              description: "Shop with confidence using our secure payment system that protects your transactions.",
                            ),
                            UserOnboardingWidget.userPageViewWidget(
                              context: context,
                              imagePath: ImageUtils.onbordingScreen3,
                              title: "Easy Communication",
                              description: "Connect directly with sellers and buyers through our built-in messaging system.",
                            ),
                          ],
                        ),
                      ),


                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(3, (index) {
                              if(planerOnboardingController.index.value == index) {
                                return Container(
                                  height: 12.h(context),
                                  width: 30.w(context),
                                  margin: EdgeInsets.only(right: 6.rpm(context)),
                                  decoration: BoxDecoration(
                                    color: ColorUtils.orange119,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(6.r(context)),
                                  ),
                                );
                              } else {
                                return Container(
                                  height: 12.h(context),
                                  width: 12.w(context),
                                  margin: EdgeInsets.only(right: 6.rpm(context)),
                                  decoration: BoxDecoration(
                                    color: ColorUtils.orange213,
                                    shape: BoxShape.circle,
                                  ),
                                );
                              }
                            }),
                          )
                      ),


                      SpaceHelperWidget.v(32.h(context)),




                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                        child: ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            planerOnboardingController.pageController.value.jumpToPage((planerOnboardingController.index.value + 1));
                          },
                          text: "Next",
                        ),
                      ),


                    ],
                  ),
                )



              ],
            ),
          ),
        )),
    );
  }


}
