import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class PlannerCreateAccountKycVerificationView extends StatelessWidget {
  PlannerCreateAccountKycVerificationView({super.key});

  final PlannerCreateAccountKycVerificationController plannerCreateAccountKycVerificationController = Get.put(PlannerCreateAccountKycVerificationController());

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
                  Get.off(()=>PlannerCreateAccountSetUpProfileView(),preventDuplicates: false);
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
                              controller: plannerCreateAccountKycVerificationController.fullNameController.value,
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
                                          controller: plannerCreateAccountKycVerificationController.dateController.value,
                                          keyboardType: TextInputType.emailAddress,
                                          onTap: () async {
                                            await plannerCreateAccountKycVerificationController.dateTimeController(context: context);
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
                                        value: plannerCreateAccountKycVerificationController.selectGender.value == "" ? null : plannerCreateAccountKycVerificationController.selectGender.value,
                                        items: ["Male","Female","Other"],
                                        onChanged: (value) {
                                          plannerCreateAccountKycVerificationController.selectGender.value = value!;
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
                              controller: plannerCreateAccountKycVerificationController.permanentAddressController.value,
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
                              controller: plannerCreateAccountKycVerificationController.currentAddressController.value,
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
                                        controller: plannerCreateAccountKycVerificationController.cityController.value,
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
                                        controller: plannerCreateAccountKycVerificationController.postalCodeController.value,
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
                              value: plannerCreateAccountKycVerificationController.selectIdType.value == "" ? null : plannerCreateAccountKycVerificationController.selectIdType.value,
                              items: ["NID","Driving License","Working Permit","TIN Certificate"],
                              onChanged: (value) {
                                plannerCreateAccountKycVerificationController.selectIdType.value = value!;
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
                              controller: plannerCreateAccountKycVerificationController.nidNumberController.value,
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
                                            await plannerCreateAccountKycVerificationController.pickUploadFrontSideFile();
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
                                                  text: plannerCreateAccountKycVerificationController.selectedUploadFrontSideFile.value.path == "" ? "JPG/PNG" : plannerCreateAccountKycVerificationController.selectedUploadFrontSideFile.value.path,
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
                                            await plannerCreateAccountKycVerificationController.pickUploadBackSideFile();
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
                                                  text: plannerCreateAccountKycVerificationController.selectedUploadBackSideFile.value.path == "" ? "JPG/PNG" : plannerCreateAccountKycVerificationController.selectedUploadBackSideFile.value.path,
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
                              controller: plannerCreateAccountKycVerificationController.bankNameController.value,
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
                              controller: plannerCreateAccountKycVerificationController.accountNumberController.value,
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
                              controller: plannerCreateAccountKycVerificationController.tinNidNumberController.value,
                              keyboardType: TextInputType.emailAddress,
                            ),





                          ],
                        ),
                      ),


                      SpaceHelperWidget.v(32.h(context)),


                      plannerCreateAccountKycVerificationController.isSubmit.value == true ?
                      LoadingHelperWidget.loadingHelperWidget(
                        context: context,
                      ) :
                      ButtonHelperWidget.customButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {
                          if(plannerCreateAccountKycVerificationController.fullNameController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your full name");
                          } else if(plannerCreateAccountKycVerificationController.dateController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your date");
                          } else if(plannerCreateAccountKycVerificationController.selectGender.value == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Please select your gender");
                          } else if(plannerCreateAccountKycVerificationController.currentAddressController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your current address");
                          } else if(plannerCreateAccountKycVerificationController.permanentAddressController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your permanent address");
                          } else if(plannerCreateAccountKycVerificationController.cityController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your city");
                          } else if(plannerCreateAccountKycVerificationController.postalCodeController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your postal code");
                          } else if(plannerCreateAccountKycVerificationController.selectIdType.value == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Please select your id");
                          } else if(plannerCreateAccountKycVerificationController.nidNumberController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your id number");
                          } else if(plannerCreateAccountKycVerificationController.bankNameController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank name");
                          } else if(plannerCreateAccountKycVerificationController.accountNumberController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank account number");
                          } else if(plannerCreateAccountKycVerificationController.tinNidNumberController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your TIN/NID number");
                          } else if(plannerCreateAccountKycVerificationController.selectedUploadFrontSideFile.value.path == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Please upload front side iD image");
                          } else if(plannerCreateAccountKycVerificationController.selectedUploadBackSideFile.value.path == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Please upload back side iD image");
                          } else {
                            await plannerCreateAccountKycVerificationController.plannerKycVerificationController(context: context);
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
    );
  }
}
