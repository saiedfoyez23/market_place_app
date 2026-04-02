import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorCreateBankAccountView extends StatelessWidget {
  VendorCreateBankAccountView({super.key});

  final VendorCreateBankAccountController vendorCreateBankAccountController = Get.put(VendorCreateBankAccountController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>VendorBankDetailsView(),preventDuplicates: false);
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
                    Get.off(()=>VendorBankDetailsView(),preventDuplicates: false);
                  },
                  title: "Add Account",
                ),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.hpm(context),vertical: 16.vpm(context)),
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
                                controller: vendorCreateBankAccountController.bankNameController.value,
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
                                controller: vendorCreateBankAccountController.accountNumberController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),


                              SpaceHelperWidget.v(20.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black96,
                                text: "Bank Code",
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              TextFormFieldWidget.build(
                                context: context,
                                fillColor: ColorUtils.white255,
                                hintText: "Enter your Bank Code",
                                controller: vendorCreateBankAccountController.bankCodeController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),





                            ],
                          ),
                        ),


                        SpaceHelperWidget.v(32.h(context)),


                        vendorCreateBankAccountController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(
                          context: context,
                        ) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(vendorCreateBankAccountController.bankNameController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank name");
                            } else if(vendorCreateBankAccountController.accountNumberController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank account number");
                            } else if(vendorCreateBankAccountController.accountNumberController.value.text.length > 10) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank account number must less than 10 digit");
                            } else if(vendorCreateBankAccountController.bankCodeController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank code");
                            } else if(vendorCreateBankAccountController.bankCodeController.value.text.length > 3) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank code must less than 3 digit");
                            } else {
                              vendorCreateBankAccountController.isSubmit.value = true;
                              Map<String,dynamic> data = {
                                "accountNumber": vendorCreateBankAccountController.accountNumberController.value.text,
                                "bankCode": vendorCreateBankAccountController.bankCodeController.value.text,
                                "accountName": vendorCreateBankAccountController.bankNameController.value.text
                              };
                              await vendorCreateBankAccountController.vendorCreateAccountController(context: context,data: data);
                            }
                          },
                          text: "Save",
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
