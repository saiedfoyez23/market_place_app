import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerWithoutSubscriptionProfileWidget {


  Widget plannerWithoutSubscriptionProfileWidget({
    required BuildContext context,
    required PlannerProfileViewController plannerProfileViewController,
  }) {
    return Obx(()=> plannerProfileViewController.isLoading.value == true ?
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


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      textAlign: TextAlign.start,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black48,
                      text: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.name ?? "",
                    ),

                    SpaceHelperWidget.h(12.w(context)),


                    plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.isKycVerified == true ?
                    ImageHelperWidget.assetImageWidget(
                      context: context,
                      height: 25.h(context),
                      width: 25.w(context),
                      imageString: ImageUtils.verifyImage,
                    ) : plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.isActiveSubscription == true ?
                    ImageHelperWidget.assetImageWidget(
                      context: context,
                      height: 25.h(context),
                      width: 25.w(context),
                      imageString: ImageUtils.verifyPaymentImage,
                    ) : plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.isKycVerified == true &&
                        plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.isActiveSubscription == true ?
                    ImageHelperWidget.assetImageWidget(
                      context: context,
                      height: 25.h(context),
                      width: 25.w(context),
                      imageString: ImageUtils.verifyPaymentImage,
                    ) : SizedBox.shrink(),

                    SpaceHelperWidget.h(6.w(context)),

                  ],
                ),


                SpaceHelperWidget.v(20.h(context)),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Expanded(
                      child: Row(
                        children: [

                          ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 20.h(context),
                            width: 20.w(context),
                            imageString: ImageUtils.vendorLocationImage,
                          ),

                          SpaceHelperWidget.h(12.w(context)),

                          Expanded(
                            child: TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              textAlign: TextAlign.start,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black48,
                              text: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.address ?? "",
                            ),
                          ),


                        ],
                      ),
                    ),


                    SpaceHelperWidget.h(12.w(context)),



                    Row(
                      children: [
                        Icon(Icons.star, color: ColorUtils.yellow199, size: 20.r(context)),

                        SpaceHelperWidget.h(12.w(context)),

                        RichTextHelperWidget.headingWithoutWidthRichText(
                          context: context,
                          alignment: Alignment.centerLeft,
                          textSpans: [
                            CustomTextSpan(
                              text: '${plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.avgRating} ',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black10,
                            ).toTextSpan(),
                            CustomTextSpan(
                              text: '(${plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.ratingCount} reviews)',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ColorUtils.black10,
                            ).toTextSpan(),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),

                SpaceHelperWidget.v(20.h(context)),


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
                  title: "My Wallet",
                  imagePath: ImageUtils.myWalletImage,
                  onTap: () async {
                    Get.off(()=>PlannerWithdrawView(),preventDuplicates: false);
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
                  title: "Support",
                  imagePath: ImageUtils.supportImage,
                  onTap: () async {
                    Get.off(()=>PlannerProfileSupportView(),preventDuplicates: false);
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
    ));
  }





}