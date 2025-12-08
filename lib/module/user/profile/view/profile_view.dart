import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileDetailsController profileDetailsController = Get.put(ProfileDetailsController(context: context));
    return Scaffold(
      body: Obx(()=>Container(
        height: 930.h(context),
        width: 428.w(context),
        decoration: BoxDecoration(
          color: ColorUtils.white251,
        ),
        child: profileDetailsController.isLoading.value == true ?
        LoadingHelperWidget.loadingHelperWidget(
          context: context,
          height: 930.h(context),
        ) :
        CustomScrollView(
          slivers: [



            MainPageAppBarHelperWidget(
              centerTitle: false,
              title: "Profile",
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                child: Column(
                  children: [

                    SpaceHelperWidget.v(32.h(context)),

                    ImageHelperWidget.circleImageHelperWidget(
                      width: 150.w(context),
                      height: 150.h(context),
                      verticalPadding: 4.5.vpm(context),
                      horizontalPadding: 4.5.vpm(context),
                      backgroundColor: ColorUtils.orange213,
                      radius: 75.r(context),
                      imageAsset: ImageUtils.noImage,
                    ),

                    SpaceHelperWidget.v(32.h(context)),

                    ProfileViewButton().profileViewButton(
                      context: context,
                      title: "Edit Profile",
                      imagePath: ImageUtils.editProfileImage,
                      onTap: () async {
                        Get.off(()=>ProfileEditView(),preventDuplicates: false);
                      },
                    ),


                    SpaceHelperWidget.v(16.h(context)),

                    ProfileViewButton().profileViewButton(
                      context: context,
                      title: "Change Password",
                      imagePath: ImageUtils.changePasswordImage,
                      onTap: () async {
                        Get.off(()=>ProfileChangePasswordView(),preventDuplicates: false);
                      },
                    ),


                    SpaceHelperWidget.v(16.h(context)),

                    ProfileViewButton().profileViewButton(
                      context: context,
                      title: "Notification Manage",
                      imagePath: ImageUtils.notificationManageImage,
                      onTap: () async {
                        Get.off(()=>ProfileNotificationView(),preventDuplicates: false);
                      },
                    ),


                    SpaceHelperWidget.v(16.h(context)),


                    ProfileViewButton().profileViewButton(
                      context: context,
                      title: "FAQ",
                      imagePath: ImageUtils.faqImage,
                      onTap: () async {
                        Get.off(()=>ProfileFaqView(),preventDuplicates: false);
                      },
                    ),


                    SpaceHelperWidget.v(16.h(context)),


                    ProfileViewButton().profileViewButton(
                      context: context,
                      title: "Terms & Condition",
                      imagePath: ImageUtils.termsAndConditionImage,
                      onTap: () async {
                        Get.off(()=>ProfileTermsAndConditionView(),preventDuplicates: false);
                      },
                    ),


                    SpaceHelperWidget.v(16.h(context)),


                    ProfileViewButton().profileViewButton(
                      context: context,
                      title: "Privacy & Policy",
                      imagePath: ImageUtils.privacyAndPolicyImage,
                      onTap: () async {
                        Get.off(()=>ProfilePrivacyAndPolicyView(),preventDuplicates: false);
                      },
                    ),


                    SpaceHelperWidget.v(16.h(context)),


                    ProfileViewButton().profileViewButton(
                      context: context,
                      title: "Delete Profile",
                      imagePath: ImageUtils.deleteProfileImage,
                      onTap: () async {
                        ProfileDialogBoxWidget().deleteProfileDialog(context: context);
                      },
                    ),


                    SpaceHelperWidget.v(16.h(context)),


                    ProfileViewButton().profileViewButton(
                      context: context,
                      title: "Log Out",
                      imagePath: ImageUtils.editProfileImage,
                      onTap: () async {
                        ProfileDialogBoxWidget().logOutDialog(context: context);
                      },
                    ),


                    SpaceHelperWidget.v(56.h(context)),







                  ],
                ),
              ),
            )




          ],
        ),
      )),
    );
  }
}
