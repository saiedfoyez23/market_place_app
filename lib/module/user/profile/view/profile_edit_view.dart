import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';
class ProfileEditView extends StatelessWidget {
  ProfileEditView({super.key});

  final ProfileEditController profileEditController = Get.put(ProfileEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 930.h(context),
        width: 428.w(context),
        decoration: BoxDecoration(
          color: ColorUtils.white251,
        ),
        child: CustomScrollView(
          slivers: [


            AuthAppBarHelperWidget(
              onBackPressed: () async {
                Get.off(()=>DashboardUserView(index: 4,),preventDuplicates: false);
              },
              title: "Edit Profile",
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                child: Column(
                  children: [

                    SpaceHelperWidget.v(32.h(context)),

                    SizedBox(
                      width: 150.w(context),
                      height: 150.h(context),
                      child: Stack(
                        children: [

                          // Profile Picture
                          ImageHelperWidget.circleImageHelperWidget(
                            width: 150.w(context),
                            height: 150.h(context),
                            verticalPadding: 2.vpm(context),
                            horizontalPadding: 2.vpm(context),
                            backgroundColor: ColorUtils.orange213,
                            radius: 75.r(context),
                            imageAsset: ImageUtils.noImage,
                          ),



                          // Edit Icon Button
                          Positioned(
                            bottom: 12.h(context),
                            right: 12.w(context),
                            child: InkWell(
                              onTap: () async {

                              },
                              child: ImageHelperWidget.assetImageWidget(
                                context: context,
                                height: 32.h(context),
                                width: 32.w(context),
                                imageString: ImageUtils.editImage,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                    SpaceHelperWidget.v(32.h(context)),

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textColor: ColorUtils.black96,
                      text: "User Name",
                    ),

                    SpaceHelperWidget.v(6.h(context)),


                    TextFormFieldWidget.build(
                      context: context,
                      hintText: "Enter your username",
                      controller: profileEditController.userNameController.value,
                      keyboardType: TextInputType.emailAddress,
                    ),


                    SpaceHelperWidget.v(20.h(context)),

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textColor: ColorUtils.black96,
                      text: "Email",
                    ),

                    SpaceHelperWidget.v(6.h(context)),


                    TextFormFieldWidget.build(
                      context: context,
                      hintText: "Enter your email",
                      controller: profileEditController.emailController.value,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    SpaceHelperWidget.v(20.h(context)),

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textColor: ColorUtils.black96,
                      text: "Phone Number",
                    ),

                    SpaceHelperWidget.v(6.h(context)),


                    TextFormFieldWidget.build(
                      context: context,
                      hintText: "Enter your email",
                      controller: profileEditController.phoneNumberController.value,
                      keyboardType: TextInputType.emailAddress,
                    ),


                    SpaceHelperWidget.v(20.h(context)),

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textColor: ColorUtils.black96,
                      text: "Bio",
                    ),

                    SpaceHelperWidget.v(6.h(context)),


                    TextFormFieldWidget.textFiledWithMaxLineBuild(
                      context: context,
                      maxLines: 5,
                      hintText: "Write something ...",
                      controller: profileEditController.bioController.value,
                      keyboardType: TextInputType.emailAddress,
                    ),


                    SpaceHelperWidget.v(24.h(context)),


                    ButtonHelperWidget.customButtonWidgetAdventPro(
                      context: context,
                      onPressed: () async {},
                      text: "Update",
                    ),


                    SpaceHelperWidget.v(40.h(context)),



                  ],
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}
