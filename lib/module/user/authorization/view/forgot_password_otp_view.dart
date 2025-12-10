import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class ForgotPasswordOtpView extends StatelessWidget {
  ForgotPasswordOtpView({super.key,required this.email});
  final String email;
  final ForgotPasswordOtpController forgotPasswordOtpController = Get.put(ForgotPasswordOtpController());


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
                  Get.off(()=>ForgotPasswordView(),preventDuplicates: false);
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
                        pinController: forgotPasswordOtpController.pinController.value,
                      ),


                      SpaceHelperWidget.v(18.h(context)),


                      forgotPasswordOtpController.timeCounter.value > 0 ?
                      ButtonHelperWidget.customRichTextButton(
                        context: context,
                        normalText: 'Resend code',
                        highlightedText: ' ${forgotPasswordOtpController.timeCounter.value}s',
                        onPressed: null,
                      ) : forgotPasswordOtpController.isResendOtpSend.value == true ?
                      ButtonHelperWidget.customRichTextButton(
                        context: context,
                        normalText: 'Resend code',
                        highlightedText: ' sending...',
                        onPressed: null,
                      ) : ButtonHelperWidget.customButtonWidget(
                        context: context,
                        onPressed: () async {
                          await forgotPasswordOtpController.resetVariable();
                          // await forgotPasswordOtpController.resendOtpCodeController(
                          //   context: context,
                          //   email: email,
                          // );
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


                      forgotPasswordOtpController.isSubmit.value == true ?
                      LoadingHelperWidget.loadingHelperWidget(context: context) :
                      ButtonHelperWidget.customButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {
                          if(forgotPasswordOtpController.pinController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter Otp Code");
                          } else {
                            await forgotPasswordOtpController.verifyOtpCodeController(
                              context: context,
                              otp: forgotPasswordOtpController.pinController.value.text,
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
    );
  }
}
