import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorProfileEditView extends StatelessWidget {
  VendorProfileEditView({super.key});

  final VendorProfileEditController vendorProfileEditController = Get.put(VendorProfileEditController());

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

              AuthAppBarHelperWidget(
                onBackPressed: () async {
                  Get.off(()=>DashboardVendorView(index: 5),preventDuplicates: false);
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
                                    imageAsset: vendorProfileEditController.coverImageFile.value.path != "" ? null : null,
                                    imageFile: vendorProfileEditController.coverImageFile.value.path == "" ? null : vendorProfileEditController.coverImageFile.value.path,
                                  ),

                                  // Edit Icon Button
                                  Positioned(
                                    bottom: 80.h(context),
                                    right: 22.w(context),
                                    child: InkWell(
                                      onTap: () async {
                                        await vendorProfileEditController.pickCoverImage(source: ImageSource.gallery, context: context);
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
                                      imageAsset: vendorProfileEditController.profileImageFile.value.path != "" ? null : ImageUtils.noImage,
                                      imageFile: vendorProfileEditController.profileImageFile.value.path == "" ? null : vendorProfileEditController.profileImageFile.value.path,
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
                                                            await vendorProfileEditController.pickProfileImage(source: ImageSource.gallery, context: context);
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
                                                            await vendorProfileEditController.pickProfileImage(source: ImageSource.camera, context: context);
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
                        controller: vendorProfileEditController.userNameController.value,
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
                        controller: vendorProfileEditController.emailController.value,
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
                        controller: vendorProfileEditController.phoneNumberController.value,
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
                        controller: vendorProfileEditController.locationController.value,
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
                        controller: vendorProfileEditController.bioController.value,
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
      )),
    );
  }
}
