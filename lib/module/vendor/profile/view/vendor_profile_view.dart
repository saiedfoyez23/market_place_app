import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class VendorProfileView extends StatelessWidget {
  const VendorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorProfileViewController vendorProfileViewController = Get.put(VendorProfileViewController(context: context));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: vendorProfileViewController.isLoading.value == true ?
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
                              imageUrl: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.coverPhoto,
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
                                imageUrl: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.photoUrl,
                                imageAsset: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.photoUrl == null ? ImageUtils.noImage : null,
                              ),
                            ),

                          ],
                        ),
                      ),


                      SpaceHelperWidget.v(35.h(context)),


                      VendorProfileViewButton().vendorProfileViewButton(
                        context: context,
                        title: "Edit Profile",
                        imagePath: ImageUtils.plannerEditProfileImage,
                        onTap: () async {
                          Get.off(()=>VendorProfileEditView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      VendorProfileViewButton().vendorProfileViewButton(
                        context: context,
                        title: "Change Password",
                        imagePath: ImageUtils.plannerChangePasswordImage,
                        onTap: () async {
                          Get.off(()=>VendorProfileChangePasswordView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      VendorProfileViewButton().vendorProfileViewButton(
                        context: context,
                        title: "Portfolio",
                        imagePath: ImageUtils.plannerPortfolioImage,
                        onTap: () async {
                          Get.off(()=>VendorProfilePortfolioView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      VendorProfileViewButton().vendorProfileViewButton(
                        context: context,
                        title: "Manage Subscription",
                        imagePath: ImageUtils.plannerManageSubscriptionImage,
                        onTap: () async {
                          Get.off(()=>VendorProfileManageSubscriptionView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      VendorProfileViewButton().vendorProfileViewButton(
                        context: context,
                        title: "FAQ",
                        imagePath: ImageUtils.plannerFaqImage,
                        onTap: () async {
                          Get.off(()=>VendorProfileFaqView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      VendorProfileViewButton().vendorProfileViewButton(
                        context: context,
                        title: "Notification Manage",
                        imagePath: ImageUtils.plannerNotificationManageImage,
                        onTap: () async {
                          Get.off(()=>VendorProfileNotificationView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      VendorProfileViewButton().vendorProfileViewButton(
                        context: context,
                        title: "Terms & Condition",
                        imagePath: ImageUtils.plannerTermsAndConditionImage,
                        onTap: () async {
                          Get.off(()=>VendorProfileTermsAndConditionView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      VendorProfileViewButton().vendorProfileViewButton(
                        context: context,
                        title: "Privacy & Policy",
                        imagePath: ImageUtils.plannerPrivacyAndPolicyImage,
                        onTap: () async {
                          Get.off(()=>VendorProfilePrivacyAndPolicyView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      VendorProfileViewButton().vendorProfileViewButton(
                        context: context,
                        title: "Delete Profile",
                        imagePath: ImageUtils.plannerDeleteProfileImage,
                        onTap: () async {
                          VendorProfileDialogBoxWidget().vendorDeleteProfileDialog(context: context);
                        },
                      ),


                      SpaceHelperWidget.v(16.h(context)),


                      VendorProfileViewButton().vendorProfileViewButton(
                        context: context,
                        title: "Log Out",
                        imagePath: ImageUtils.plannerLogOutImage,
                        onTap: () async {
                          VendorProfileDialogBoxWidget().vendorLogOutDialog(context: context);
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
