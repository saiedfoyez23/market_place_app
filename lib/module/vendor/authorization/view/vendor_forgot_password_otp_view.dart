import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorForgotPasswordOtpView extends StatelessWidget {
  VendorForgotPasswordOtpView({super.key,required this.email});
  final String email;
  final VendorForgotPasswordOtpController vendorForgotPasswordOtpController = Get.put(VendorForgotPasswordOtpController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>VendorForgotPasswordView(),preventDuplicates: false);
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
                    Get.off(()=>VendorForgotPasswordView(),preventDuplicates: false);
                  },
                  title: "Confirmation code",
                ),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [

                        SpaceHelperWidget.v(18.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          textColor: ColorUtils.black96,
                          text: "To confirm your account, enter the 6-digit code we sent to ${email}",
                        ),


                        SpaceHelperWidget.v(32.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Enter Otp",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.otpInputFiledBuild(
                          context: context,
                          onCompleted: (pin) {},
                          pinController: vendorForgotPasswordOtpController.pinController.value,
                        ),


                        SpaceHelperWidget.v(18.h(context)),


                        vendorForgotPasswordOtpController.timeCounter.value > 0 ?
                        ButtonHelperWidget.customRichTextButton(
                          context: context,
                          normalText: 'Resend code',
                          highlightedText: ' ${vendorForgotPasswordOtpController.timeCounter.value}s',
                          onPressed: null,
                        ) : vendorForgotPasswordOtpController.isResendOtpSend.value == true ?
                        ButtonHelperWidget.customRichTextButton(
                          context: context,
                          normalText: 'Resend code',
                          highlightedText: ' sending...',
                          onPressed: null,
                        ) : ButtonHelperWidget.customButtonWidget(
                          context: context,
                          onPressed: () async {
                            await vendorForgotPasswordOtpController.vendorResendOtpCodeController(
                              context: context,
                              email: email,
                            );
                          },
                          text: "send code again",
                          padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                          alignment: Alignment.center,
                          textColor: ColorUtils.blue96,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          backgroundColor: Colors.transparent,
                        ),


                        SpaceHelperWidget.v(24.h(context)),

                        vendorForgotPasswordOtpController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(context: context) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(vendorForgotPasswordOtpController.pinController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter Otp Code");
                            } else {
                              await vendorForgotPasswordOtpController.vendorVerifyOtpCodeController(
                                context: context,
                                otp: vendorForgotPasswordOtpController.pinController.value.text,
                                email: email,
                              );
                            }
                          },
                          text: "Next",
                        ),







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
