import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class PlannerCreateAccountKycVerificationView extends StatelessWidget {
  PlannerCreateAccountKycVerificationView({super.key});

  final PlannerCreateAccountController plannerCreateAccountController = Get.put(PlannerCreateAccountController());

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
                              controller:  plannerCreateAccountController.fullNameController.value,
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
                                          controller:  plannerCreateAccountController.dateController.value,
                                          keyboardType: TextInputType.emailAddress,
                                          onTap: () async {
                                            await plannerCreateAccountController.dateTimeController(context: context);
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
                                        value: plannerCreateAccountController.selectGender.value == "" ? null : plannerCreateAccountController.selectGender.value,
                                        items: ["Male","Female","Other"],
                                        onChanged: (value) {
                                          plannerCreateAccountController.selectGender.value = value!;
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
                              controller:  plannerCreateAccountController.permanentAddressController.value,
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
                              controller:  plannerCreateAccountController.currentAddressController.value,
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
                                        controller:  plannerCreateAccountController.cityController.value,
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
                                        controller:  plannerCreateAccountController.postalCodeController.value,
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
                              value: plannerCreateAccountController.selectIdType.value == "" ? null : plannerCreateAccountController.selectIdType.value,
                              items: ["NID","Driving License","Working Permit","TIN Certificate"],
                              onChanged: (value) {
                                plannerCreateAccountController.selectIdType.value = value!;
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
                              text: "NID Number",
                            ),

                            SpaceHelperWidget.v(6.h(context)),


                            TextFormFieldWidget.build(
                              context: context,
                              fillColor: ColorUtils.white255,
                              hintText: "Enter your nid number",
                              controller:  plannerCreateAccountController.nidNumberController.value,
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
                                            await plannerCreateAccountController.pickUploadFrontSideFile();
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
                                                  text: plannerCreateAccountController.selectedUploadFrontSideFile.value.path == "" ? "JPG/PNG" : plannerCreateAccountController.selectedUploadFrontSideFile.value.path,
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
                                            await plannerCreateAccountController.pickUploadBackSideFile();
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
                                                  text: plannerCreateAccountController.selectedUploadBackSideFile.value.path == "" ? "JPG/PNG" : plannerCreateAccountController.selectedUploadBackSideFile.value.path,
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
                              controller:  plannerCreateAccountController.bankNameController.value,
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
                              controller:  plannerCreateAccountController.accountNumberController.value,
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
                              controller:  plannerCreateAccountController.businessNameController.value,
                              keyboardType: TextInputType.emailAddress,
                            ),





                          ],
                        ),
                      ),


                      SpaceHelperWidget.v(32.h(context)),

                      ButtonHelperWidget.customButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {
                          Get.off(()=>PlannerCreateAccountPickImageView(),preventDuplicates: false);
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
