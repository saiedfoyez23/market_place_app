import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';


class PlannerProfileView extends StatelessWidget {
  const PlannerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final PlannerProfileViewController plannerProfileViewController = Get.put(PlannerProfileViewController(context: context));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: plannerProfileViewController.isLoading.value == true ?
          LoadingHelperWidget.loadingHelperWidget(
            context: context,
            height: 930.h(context),
          ) :
          CustomScrollView(
            slivers: [


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperWidget.v(35.h(context)),

                      SizedBox(
                        width: 428.w(context),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [

                            ImageHelperWidget.styledImage(
                              context: context,
                              height: 250.h(context),
                              width: 428.w(context),
                              fit: BoxFit.cover,
                              imageUrl: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.coverPhoto,
                            ),


                            // Profile Image
                            Padding(
                              padding: EdgeInsets.only(top: 110.h(context)),
                              child: ImageHelperWidget.circleImageHelperWidget(
                                width: 150.w(context),
                                height: 150.h(context),
                                verticalPadding: 4.5.vpm(context),
                                horizontalPadding: 4.5.vpm(context),
                                backgroundColor: ColorUtils.orange213,
                                radius: 75.r(context),
                                imageUrl: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.photoUrl,
                                imageAsset: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.photoUrl == null ? ImageUtils.noImage : null,
                              ),
                            ),
                          ],
                        ),
                      ),


                      SpaceHelperWidget.v(35.h(context)),


                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Edit Profile",
                        imagePath: ImageUtils.plannerEditProfileImage,
                        onTap: () async {
                          Get.off(()=>PlannerProfileEditView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Change Password",
                        imagePath: ImageUtils.plannerChangePasswordImage,
                        onTap: () async {
                          Get.off(()=>PlannerProfileChangePasswordView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Services",
                        imagePath: ImageUtils.plannerServicesImage,
                        onTap: () async {
                          Get.off(()=>PlannerProfileServiceView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Portfolio",
                        imagePath: ImageUtils.plannerPortfolioImage,
                        onTap: () async {
                          Get.off(()=>PlannerProfilePortfolioView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Manage Subscription",
                        imagePath: ImageUtils.plannerManageSubscriptionImage,
                        onTap: () async {
                          Get.off(()=>PlannerProfileManageSubscriptionView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "FAQ",
                        imagePath: ImageUtils.plannerFaqImage,
                        onTap: () async {
                          Get.off(()=>PlannerProfileFaqView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Notification Manage",
                        imagePath: ImageUtils.plannerNotificationManageImage,
                        onTap: () async {
                          Get.off(()=>PlannerProfileNotificationView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Terms & Condition",
                        imagePath: ImageUtils.plannerTermsAndConditionImage,
                        onTap: () async {
                          Get.off(()=>PlannerProfileTermsAndConditionView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Privacy & Policy",
                        imagePath: ImageUtils.plannerPrivacyAndPolicyImage,
                        onTap: () async {
                          Get.off(()=>PlannerProfilePrivacyAndPolicyView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Delete Profile",
                        imagePath: ImageUtils.plannerDeleteProfileImage,
                        onTap: () async {
                          PlannerProfileDialogBoxWidget().plannerDeleteProfileDialog(
                            context: context,
                            plannerProfileViewController: plannerProfileViewController,
                          );
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Log Out",
                        imagePath: ImageUtils.plannerLogOutImage,
                        onTap: () async {
                          PlannerProfileDialogBoxWidget().plannerLogOutDialog(context: context);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                    ],
                  ),
                ),
              )



            ],
          ),
        ),
      )),
    );
  }
}
