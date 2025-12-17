import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorCreateAccountKycVerificationView extends StatelessWidget {
  VendorCreateAccountKycVerificationView({super.key});

  final VendorCreateAccountController vendorCreateAccountController = Get.put(VendorCreateAccountController());

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
                              controller: vendorCreateAccountController.fullNameController.value,
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
                                          controller: vendorCreateAccountController.dateController.value,
                                          keyboardType: TextInputType.emailAddress,
                                          onTap: () async {
                                            await vendorCreateAccountController.dateTimeController(context: context);
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
                                        value: vendorCreateAccountController.selectGender.value == "" ? null : vendorCreateAccountController.selectGender.value,
                                        items: ["Male","Female","Other"],
                                        onChanged: (value) {
                                          vendorCreateAccountController.selectGender.value = value!;
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
                              controller: vendorCreateAccountController.permanentAddressController.value,
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
                              controller: vendorCreateAccountController.currentAddressController.value,
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
                                        controller: vendorCreateAccountController.cityController.value,
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
                                        controller: vendorCreateAccountController.postalCodeController.value,
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
                              value: vendorCreateAccountController.selectIdType.value == "" ? null : vendorCreateAccountController.selectIdType.value,
                              items: ["NID","Driving License","Working Permit","TIN Certificate"],
                              onChanged: (value) {
                                vendorCreateAccountController.selectIdType.value = value!;
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
                              controller: vendorCreateAccountController.nidNumberController.value,
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
                                            await vendorCreateAccountController.pickUploadFrontSideFile();
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
                                                  text: vendorCreateAccountController.selectedUploadFrontSideFile.value.path == "" ? "JPG/PNG" : vendorCreateAccountController.selectedUploadFrontSideFile.value.path,
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
                                            await vendorCreateAccountController.pickUploadBackSideFile();
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
                                                  text: vendorCreateAccountController.selectedUploadBackSideFile.value.path == "" ? "JPG/PNG" : vendorCreateAccountController.selectedUploadBackSideFile.value.path,
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
                              controller: vendorCreateAccountController.bankNameController.value,
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
                              controller: vendorCreateAccountController.accountNumberController.value,
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
                              controller: vendorCreateAccountController.businessNameController.value,
                              keyboardType: TextInputType.emailAddress,
                            ),





                          ],
                        ),
                      ),


                      SpaceHelperWidget.v(32.h(context)),

                      ButtonHelperWidget.customButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {
                          Get.off(()=>DashboardVendorView(index: 0),preventDuplicates: false);
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
