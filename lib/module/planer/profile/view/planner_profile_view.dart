import 'package:flutter/material.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';


class PlannerProfileView extends StatelessWidget {
  const PlannerProfileView({super.key});

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
          child: CustomScrollView(
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


                            ImageHelperWidget.styledAssetImage(
                              context: context,
                              imageString: ImageUtils.coverImage,
                              height: 250.h(context),
                              width: 428.w(context),
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
                                imageAsset: ImageUtils.noImage,
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
                        onTap: () async {},
                      ),
        
        
                      SpaceHelperWidget.v(16.h(context)),
        
        
                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Change Password",
                        imagePath: ImageUtils.plannerChangePasswordImage,
                        onTap: () async {},
                      ),
        
        
                      SpaceHelperWidget.v(16.h(context)),
        
        
                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Services",
                        imagePath: ImageUtils.plannerServicesImage,
                        onTap: () async {},
                      ),
        
        
                      SpaceHelperWidget.v(16.h(context)),
        
        
                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Portfolio",
                        imagePath: ImageUtils.plannerPortfolioImage,
                        onTap: () async {},
                      ),
        
        
                      SpaceHelperWidget.v(16.h(context)),
        
        
                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Manage Subscription",
                        imagePath: ImageUtils.plannerManageSubscriptionImage,
                        onTap: () async {},
                      ),
        
        
                      SpaceHelperWidget.v(16.h(context)),
        
        
                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "FAQ",
                        imagePath: ImageUtils.plannerFaqImage,
                        onTap: () async {},
                      ),
        
        
                      SpaceHelperWidget.v(16.h(context)),
        
        
                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Notification Manage",
                        imagePath: ImageUtils.plannerNotificationManageImage,
                        onTap: () async {},
                      ),
        
        
                      SpaceHelperWidget.v(16.h(context)),
        
        
                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Terms & Condition",
                        imagePath: ImageUtils.plannerTermsAndConditionImage,
                        onTap: () async {},
                      ),
        
        
                      SpaceHelperWidget.v(16.h(context)),
        
        
                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Privacy & Policy",
                        imagePath: ImageUtils.plannerPrivacyAndPolicyImage,
                        onTap: () async {},
                      ),
        
        
                      SpaceHelperWidget.v(16.h(context)),
        
        
                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Delete Profile",
                        imagePath: ImageUtils.plannerDeleteProfileImage,
                        onTap: () async {},
                      ),
        
        
                      SpaceHelperWidget.v(16.h(context)),
        
        
                      PlannerProfileViewButton().plannerProfileViewButton(
                        context: context,
                        title: "Log Out",
                        imagePath: ImageUtils.plannerLogOutImage,
                        onTap: () async {},
                      ),
        
        
                      SpaceHelperWidget.v(16.h(context)),
        
        
                    ],
                  ),
                ),
              )
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}
