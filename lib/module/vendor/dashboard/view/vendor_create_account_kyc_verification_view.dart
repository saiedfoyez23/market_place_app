import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorCreateAccountKycVerificationView extends StatelessWidget {
  VendorCreateAccountKycVerificationView({super.key});

  final VendorCreateAccountKycVerificationController vendorCreateAccountKycVerificationController = Get.put(VendorCreateAccountKycVerificationController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>VendorCreateAccountSetUpProfileView(),preventDuplicates: false);
      },
      child: Scaffold(
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
                    Get.off(()=>VendorCreateAccountSetUpProfileView(),preventDuplicates: false);
                  },
                  title: "KYC Verification",
                ),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [


                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.hpm(context),vertical: 16.vpm(context)),
                          margin: EdgeInsets.only(bottom: 20.bpm(context)),
                          decoration: BoxDecoration(
                            color: ColorUtils.white243,
                            borderRadius: BorderRadius.circular(20.r(context)),
                          ),
                          child: Column(
                            children: [

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                textColor: ColorUtils.black64,
                                text: "Personal Information",
                              ),


                              SpaceHelperWidget.v(20.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black96,
                                text: "Full Name",
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              TextFormFieldWidget.build(
                                context: context,
                                fillColor: ColorUtils.white255,
                                hintText: "Enter your full name",
                                controller: vendorCreateAccountKycVerificationController.fullNameController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),

                              SpaceHelperWidget.v(20.h(context)),


                              Row(
                                children: [

                                  Expanded(
                                    child: Column(
                                      children: [

                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          textColor: ColorUtils.black96,
                                          text: "Date of Birth",
                                        ),

                                        SpaceHelperWidget.v(6.h(context)),


                                        TextFormFieldWidget.build(
                                            context: context,
                                            fillColor: ColorUtils.white255,
                                            hintText: "DD/MM/YY",
                                            readOnly: true,
                                            controller: vendorCreateAccountKycVerificationController.dateController.value,
                                            keyboardType: TextInputType.emailAddress,
                                            onTap: () async {
                                              await vendorCreateAccountKycVerificationController.dateTimeController(context: context);
                                            }
                                        ),

                                      ],
                                    ),
                                  ),


                                  SpaceHelperWidget.h(16.w(context)),


                                  Expanded(
                                    child: Column(
                                      children: [

                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          textColor: ColorUtils.black96,
                                          text: "Gender",
                                        ),

                                        SpaceHelperWidget.v(6.h(context)),


                                        CustomDropdownHelperClass(
                                          value: vendorCreateAccountKycVerificationController.selectGender.value == "" ? null : vendorCreateAccountKycVerificationController.selectGender.value,
                                          items: ["Male","Female","Other"],
                                          onChanged: (value) {
                                            vendorCreateAccountKycVerificationController.selectGender.value = value!;
                                          },
                                        ),

                                      ],
                                    ),
                                  ),



                                ],
                              )







                            ],
                          ),
                        ),


                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.hpm(context),vertical: 16.vpm(context)),
                          margin: EdgeInsets.only(bottom: 20.bpm(context)),
                          decoration: BoxDecoration(
                            color: ColorUtils.white243,
                            borderRadius: BorderRadius.circular(20.r(context)),
                          ),
                          child: Column(
                            children: [

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                textColor: ColorUtils.black64,
                                text: "Address Information",
                              ),


                              SpaceHelperWidget.v(20.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black96,
                                text: "Permanent Address",
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              TextFormFieldWidget.build(
                                context: context,
                                fillColor: ColorUtils.white255,
                                hintText: "Enter your permanent address",
                                controller: vendorCreateAccountKycVerificationController.permanentAddressController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),


                              SpaceHelperWidget.v(20.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black96,
                                text: "Current Address",
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              TextFormFieldWidget.build(
                                context: context,
                                fillColor: ColorUtils.white255,
                                hintText: "Enter your current address",
                                controller: vendorCreateAccountKycVerificationController.currentAddressController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),


                              SpaceHelperWidget.v(20.h(context)),


                              Row(
                                children: [

                                  Expanded(
                                    child: Column(
                                      children: [

                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          textColor: ColorUtils.black96,
                                          text: "City",
                                        ),

                                        SpaceHelperWidget.v(6.h(context)),


                                        TextFormFieldWidget.build(
                                          context: context,
                                          fillColor: ColorUtils.white255,
                                          hintText: "City",
                                          controller: vendorCreateAccountKycVerificationController.cityController.value,
                                          keyboardType: TextInputType.emailAddress,
                                        ),

                                      ],
                                    ),
                                  ),


                                  SpaceHelperWidget.h(16.w(context)),


                                  Expanded(
                                    child: Column(
                                      children: [

                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          textColor: ColorUtils.black96,
                                          text: "Postal Code",
                                        ),

                                        SpaceHelperWidget.v(6.h(context)),


                                        TextFormFieldWidget.build(
                                          context: context,
                                          fillColor: ColorUtils.white255,
                                          hintText: "Postal Code",
                                          controller: vendorCreateAccountKycVerificationController.postalCodeController.value,
                                          keyboardType: TextInputType.emailAddress,
                                        ),

                                      ],
                                    ),
                                  ),



                                ],
                              )







                            ],
                          ),
                        ),


                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.hpm(context),vertical: 16.vpm(context)),
                          margin: EdgeInsets.only(bottom: 20.bpm(context)),
                          decoration: BoxDecoration(
                            color: ColorUtils.white243,
                            borderRadius: BorderRadius.circular(20.r(context)),
                          ),
                          child: Column(
                            children: [

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                textColor: ColorUtils.black64,
                                text: "Identity Verification",
                              ),


                              SpaceHelperWidget.v(20.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black96,
                                text: "ID Type",
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              CustomDropdownHelperClass(
                                value: vendorCreateAccountKycVerificationController.selectIdType.value == "" ? null : vendorCreateAccountKycVerificationController.selectIdType.value,
                                items: ["NID","Driving License","Working Permit","TIN Certificate"],
                                onChanged: (value) {
                                  vendorCreateAccountKycVerificationController.selectIdType.value = value!;
                                },
                                hintText: "Select ID Type",
                              ),




                              SpaceHelperWidget.v(20.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black96,
                                text: "ID Number",
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              TextFormFieldWidget.build(
                                context: context,
                                fillColor: ColorUtils.white255,
                                hintText: "Enter your nid number",
                                controller: vendorCreateAccountKycVerificationController.nidNumberController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),


                              SpaceHelperWidget.v(20.h(context)),


                              Row(
                                children: [

                                  Expanded(
                                    child: Column(
                                      children: [

                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          textColor: ColorUtils.black96,
                                          text: "Upload Front Side",
                                        ),

                                        SpaceHelperWidget.v(6.h(context)),


                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 20.hpm(context)),
                                          decoration: BoxDecoration(
                                            color: ColorUtils.white255,
                                            borderRadius: BorderRadius.circular(10.r(context)),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              await vendorCreateAccountKycVerificationController.pickUploadFrontSideFile();
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Expanded(
                                                  child: TextHelperClass.headingTextWithoutWidth(
                                                    context: context,
                                                    alignment: Alignment.centerLeft,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: ColorUtils.black96,
                                                    text: vendorCreateAccountKycVerificationController.selectedUploadFrontSideFile.value.path == "" ? "JPG/PNG" : vendorCreateAccountKycVerificationController.selectedUploadFrontSideFile.value.path,
                                                  ),
                                                ),

                                                SpaceHelperWidget.h(6.w(context)),


                                                ImageHelperWidget.assetImageWidget(
                                                  context: context,
                                                  height: 20,
                                                  width: 20,
                                                  imageString: ImageUtils.imageUploadIconImage,
                                                ),

                                              ],
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),


                                  SpaceHelperWidget.h(16.w(context)),


                                  Expanded(
                                    child: Column(
                                      children: [

                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          textColor: ColorUtils.black96,
                                          text: "Upload Back Side",
                                        ),

                                        SpaceHelperWidget.v(6.h(context)),


                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 20.hpm(context)),
                                          decoration: BoxDecoration(
                                            color: ColorUtils.white255,
                                            borderRadius: BorderRadius.circular(10.r(context)),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              await vendorCreateAccountKycVerificationController.pickUploadBackSideFile();
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Expanded(
                                                  child: TextHelperClass.headingTextWithoutWidth(
                                                    context: context,
                                                    alignment: Alignment.centerLeft,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: ColorUtils.black96,
                                                    text: vendorCreateAccountKycVerificationController.selectedUploadBackSideFile.value.path == "" ? "JPG/PNG" : vendorCreateAccountKycVerificationController.selectedUploadBackSideFile.value.path,
                                                  ),
                                                ),

                                                SpaceHelperWidget.h(6.w(context)),


                                                ImageHelperWidget.assetImageWidget(
                                                  context: context,
                                                  height: 20,
                                                  width: 20,
                                                  imageString: ImageUtils.imageUploadIconImage,
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),



                                ],
                              )







                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.hpm(context),vertical: 16.vpm(context)),
                          margin: EdgeInsets.only(bottom: 20.bpm(context)),
                          decoration: BoxDecoration(
                            color: ColorUtils.white243,
                            borderRadius: BorderRadius.circular(20.r(context)),
                          ),
                          child: Column(
                            children: [

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                textColor: ColorUtils.black64,
                                text: "Bank Information",
                              ),


                              SpaceHelperWidget.v(20.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black96,
                                text: "Bank Name",
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              TextFormFieldWidget.build(
                                context: context,
                                fillColor: ColorUtils.white255,
                                hintText: "Enter your bank name",
                                controller: vendorCreateAccountKycVerificationController.bankNameController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),


                              SpaceHelperWidget.v(20.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black96,
                                text: "Account Number",
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              TextFormFieldWidget.build(
                                context: context,
                                fillColor: ColorUtils.white255,
                                hintText: "Enter your account number",
                                controller: vendorCreateAccountKycVerificationController.accountNumberController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),


                              SpaceHelperWidget.v(20.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black96,
                                text: "TIN/NID Number",
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              TextFormFieldWidget.build(
                                context: context,
                                fillColor: ColorUtils.white255,
                                hintText: "Enter your TIN/NID number",
                                controller: vendorCreateAccountKycVerificationController.tinNidNumberController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),





                            ],
                          ),
                        ),


                        SpaceHelperWidget.v(32.h(context)),


                        vendorCreateAccountKycVerificationController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(
                          context: context,
                        ) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(vendorCreateAccountKycVerificationController.fullNameController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your full name");
                            } else if(vendorCreateAccountKycVerificationController.dateController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your date");
                            } else if(vendorCreateAccountKycVerificationController.selectGender.value == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Please select your gender");
                            } else if(vendorCreateAccountKycVerificationController.currentAddressController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your current address");
                            } else if(vendorCreateAccountKycVerificationController.permanentAddressController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your permanent address");
                            } else if(vendorCreateAccountKycVerificationController.cityController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your city");
                            } else if(vendorCreateAccountKycVerificationController.postalCodeController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your postal code");
                            } else if(vendorCreateAccountKycVerificationController.selectIdType.value == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Please select your id");
                            } else if(vendorCreateAccountKycVerificationController.nidNumberController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your id number");
                            } else if(vendorCreateAccountKycVerificationController.bankNameController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank name");
                            } else if(vendorCreateAccountKycVerificationController.accountNumberController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank account number");
                            } else if(vendorCreateAccountKycVerificationController.tinNidNumberController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your TIN/NID number");
                            } else if(vendorCreateAccountKycVerificationController.selectedUploadFrontSideFile.value.path == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Please upload front side iD image");
                            } else if(vendorCreateAccountKycVerificationController.selectedUploadBackSideFile.value.path == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Please upload back side iD image");
                            } else {
                              await vendorCreateAccountKycVerificationController.vendorKycVerificationController(context: context);
                            }
                          },
                          text: "Next",
                        ),

                        SpaceHelperWidget.v(32.h(context)),



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
