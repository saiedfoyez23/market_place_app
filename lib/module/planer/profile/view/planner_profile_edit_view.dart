import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class PlannerProfileEditView extends StatelessWidget {
  PlannerProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    final PlannerProfileEditController plannerProfileEditController = Get.put(PlannerProfileEditController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: plannerProfileEditController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
                  },
                  title: "Edit Profile",
                ),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [

                        SpaceHelperWidget.v(16.h(context)),


                        SizedBox(
                          width: 428.w(context),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [


                              SizedBox(
                                height: 250.h(context),
                                width: 428.w(context),
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [

                                    ImageHelperWidget.styledImage(
                                      context: context,
                                      height: 250.h(context),
                                      width: 428.w(context),
                                      fit: BoxFit.cover,
                                      imageFile: plannerProfileEditController.coverImageFile.value.path == "" ?
                                      null : plannerProfileEditController.coverImageFile.value.path,
                                      imageUrl: plannerProfileEditController.plannerMyProfileDetailsResponseModel.value.data?.coverPhoto != null && plannerProfileEditController.coverImageFile.value.path == "" ?
                                      plannerProfileEditController.plannerMyProfileDetailsResponseModel.value.data?.coverPhoto :
                                      null,
                                    ),

                                    // Edit Icon Button
                                    Positioned(
                                      bottom: 80.h(context),
                                      right: 22.w(context),
                                      child: InkWell(
                                        onTap: () async {
                                          await plannerProfileEditController.pickCoverImage(source: ImageSource.gallery, context: context);
                                        },
                                        child: ImageHelperWidget.assetImageWidget(
                                          context: context,
                                          height: 32.h(context),
                                          width: 32.w(context),
                                          imageString: ImageUtils.editProfileWhiteImage,
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                              ),



                              // Profile Image
                              Padding(
                                padding: EdgeInsets.only(top: 110.h(context)),
                                child: SizedBox(
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
                                        imageFile: plannerProfileEditController.profileImageFile.value.path != "" ?
                                        plannerProfileEditController.profileImageFile.value.path :  null,
                                        imageUrl: plannerProfileEditController.plannerMyProfileDetailsResponseModel.value.data?.photoUrl != null && plannerProfileEditController.profileImageFile.value.path == "" ?
                                        plannerProfileEditController.plannerMyProfileDetailsResponseModel.value.data?.photoUrl :
                                        null,
                                        imageAsset: plannerProfileEditController.profileImageFile.value.path == "" && plannerProfileEditController.plannerMyProfileDetailsResponseModel.value.data?.photoUrl == null ?
                                        ImageUtils.noImage : null,
                                      ),


                                      // Edit Icon Button
                                      Positioned(
                                        bottom: 12.h(context),
                                        right: 12.w(context),
                                        child: InkWell(
                                          onTap: () async {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false, // user must tap a button
                                              builder: (context) {
                                                return Dialog(
                                                  insetPadding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20.r(context)),
                                                  ),
                                                  child: IntrinsicHeight(
                                                    child: Container(
                                                      width: 428.w(context),
                                                      decoration: BoxDecoration(
                                                        color: ColorUtils.white238,
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
                                                            fontSize: 30,
                                                            fontWeight: FontWeight.w600,
                                                            textColor: ColorUtils.black64,
                                                            text: "Add Picture",
                                                          ),


                                                          SpaceHelperWidget.v(32.h(context)),


                                                          ButtonHelperWidget.customButtonWidget(
                                                            context: context,
                                                            onPressed: () async {
                                                              await plannerProfileEditController.pickProfileImage(source: ImageSource.gallery, context: context);
                                                            },
                                                            text: "Choose Gallery",
                                                            borderRadius: 16,
                                                            backgroundColor: ColorUtils.white255,
                                                            fontWeight: FontWeight.w600,
                                                            textColor: ColorUtils.black48,
                                                            fontSize: 20,
                                                          ),


                                                          SpaceHelperWidget.v(10.h(context)),


                                                          ButtonHelperWidget.customButtonWidget(
                                                            context: context,
                                                            onPressed: () async {
                                                              await plannerProfileEditController.pickProfileImage(source: ImageSource.camera, context: context);
                                                            },
                                                            text: "Choose Camera",
                                                            borderRadius: 16,
                                                            backgroundColor: ColorUtils.white255,
                                                            fontWeight: FontWeight.w600,
                                                            textColor: ColorUtils.black48,
                                                            fontSize: 20,
                                                          ),


                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: ImageHelperWidget.assetImageWidget(
                                            context: context,
                                            height: 32.h(context),
                                            width: 32.w(context),
                                            imageString: ImageUtils.editProfileWhiteImage,
                                          ),
                                        ),
                                      ),
                                    ],
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
                          controller: plannerProfileEditController.userNameController.value,
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
                          readOnly: true,
                          hintText: "Enter your email",
                          controller: plannerProfileEditController.emailController.value,
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
                          hintText: "Enter your phone number",
                          controller: plannerProfileEditController.phoneNumberController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        SpaceHelperWidget.v(20.h(context)),

                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Location",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter your location",
                          controller: plannerProfileEditController.locationController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        SpaceHelperWidget.v(20.h(context)),


                        plannerProfileEditController.categoryResponseModel.value.data != null ?
                        Column(
                          children: [

                            SpaceHelperWidget.v(20.h(context)),


                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black96,
                              text: "Category",
                            ),

                            SpaceHelperWidget.v(6.h(context)),

                            Wrap(
                              runSpacing: 10.h(context),
                              spacing: 10.w(context),
                              children: List.generate(plannerProfileEditController.categoryResponseModel.value.data!.length, (index) {
                                return Obx(()=>IntrinsicWidth(
                                  child: ButtonHelperWidget.customButtonWidget(
                                    context: context,
                                    height: 56.h(context),
                                    padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                    backgroundColor: plannerProfileEditController.selectCategoryString.contains(plannerProfileEditController.categoryResponseModel.value.data![index].title) == false ?
                                    ColorUtils.white243 :
                                    plannerProfileEditController.selectCategoryString.contains(plannerProfileEditController.categoryResponseModel.value.data![index].title) == true ?
                                    ColorUtils.orange119 :
                                    ColorUtils.white243,
                                    textColor: plannerProfileEditController.selectCategoryString.contains(plannerProfileEditController.categoryResponseModel.value.data![index].title) == false ?
                                    ColorUtils.black89 :
                                    plannerProfileEditController.selectCategoryString.contains(plannerProfileEditController.categoryResponseModel.value.data![index].title) == true ?
                                    ColorUtils.white255 :
                                    ColorUtils.black89,
                                    fontWeight: FontWeight.w500,
                                    onPressed: () async {
                                      if(plannerProfileEditController.selectCategoryString.contains(plannerProfileEditController.categoryResponseModel.value.data![index].title) == true) {
                                        plannerProfileEditController.selectCategoryString.remove(plannerProfileEditController.categoryResponseModel.value.data![index].title);
                                      } else {
                                        plannerProfileEditController.selectCategoryString.add(plannerProfileEditController.categoryResponseModel.value.data![index].title);
                                      }
                                    },
                                    text: plannerProfileEditController.categoryResponseModel.value.data?[index].title ?? "",
                                  ),
                                ));
                              }),
                            ),

                          ],
                        ) :
                        SizedBox.shrink(),

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
                          controller: plannerProfileEditController.bioController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Add Instagram",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter your instagram link",
                          controller: plannerProfileEditController.addInstagramController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Add Linkedin",
                        ),

                        SpaceHelperWidget.v(6.h(context)),

                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter your linkedin link",
                          controller: plannerProfileEditController.addLinkedInController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Add Website",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter your website link",
                          controller: plannerProfileEditController.addWebsiteController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        SpaceHelperWidget.v(24.h(context)),

                        plannerProfileEditController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(
                          context: context,
                        ) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(plannerProfileEditController.userNameController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your user name");
                            } else if(plannerProfileEditController.phoneNumberController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your phone number");
                            } else if(plannerProfileEditController.selectCategoryString.isEmpty == true) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Please select minimum one category");
                            } else if(plannerProfileEditController.latitude.value == 0.0 && plannerProfileEditController.latitude.value == 0.0) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Your location is not able pick. Please able the location permission");
                            } else if(plannerProfileEditController.locationController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Your location is not able pick. Please able the location permission");
                            } else {
                              await plannerProfileEditController.plannerUpdateUserAccountController(context: context);
                            }
                          },
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
        )),
      ),
    );
  }
}
