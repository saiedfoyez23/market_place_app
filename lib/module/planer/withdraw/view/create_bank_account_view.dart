import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class CreateBankAccountView extends StatelessWidget {
  CreateBankAccountView({super.key});

  final CreateBankAccountController createBankAccountController = Get.put(CreateBankAccountController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>PlannerBankDetailsView(),preventDuplicates: false);
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
                    Get.off(()=>PlannerBankDetailsView(),preventDuplicates: false);
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
                                controller: createBankAccountController.bankNameController.value,
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
                                controller: createBankAccountController.accountNumberController.value,
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
                                controller: createBankAccountController.bankCodeController.value,
                                keyboardType: TextInputType.emailAddress,
                              ),





                            ],
                          ),
                        ),


                        SpaceHelperWidget.v(32.h(context)),


                        createBankAccountController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(
                          context: context,
                        ) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(createBankAccountController.bankNameController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank name");
                            } else if(createBankAccountController.accountNumberController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank account number");
                            } else if(createBankAccountController.accountNumberController.value.text.length > 10) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Account number must 10 digits");
                            } else if(createBankAccountController.accountNumberController.value.text.length < 10) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Account number must 10 digits");
                            } else if(createBankAccountController.bankCodeController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank code");
                            } else if(createBankAccountController.bankCodeController.value.text.length > 3) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank code must less than 3 digit");
                            } else if(createBankAccountController.bankCodeController.value.text.length < 3) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your bank code must less than 3 digit");
                            } else {
                              createBankAccountController.isSubmit.value = true;
                              Map<String,dynamic> data = {
                                "accountNumber": createBankAccountController.accountNumberController.value.text,
                                "bankCode": createBankAccountController.bankCodeController.value.text,
                                "accountName": createBankAccountController.bankNameController.value.text
                              };
                              await createBankAccountController.createAccountController(context: context,data: data);
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
