import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorCreateAccountOtpView extends StatelessWidget {
  VendorCreateAccountOtpView({super.key});

  final VendorCreateAccountOtpController vendorCreateAccountOtpController = Get.put(VendorCreateAccountOtpController());

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
                  Get.off(()=>VendorLoginView(),preventDuplicates: false);
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
                        text: "To confirm your account, enter the 6-digit code we sent to shahidhasn@gmail.com",
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
                        pinController: vendorCreateAccountOtpController.pinController.value,
                      ),


                      SpaceHelperWidget.v(18.h(context)),


                      vendorCreateAccountOtpController.timeCounter.value > 0 ?
                      ButtonHelperWidget.customRichTextButton(
                        context: context,
                        normalText: 'Resend code',
                        highlightedText: ' ${vendorCreateAccountOtpController.timeCounter.value}s',
                        onPressed: null,
                      ) : vendorCreateAccountOtpController.isResendOtpSend.value == true ?
                      ButtonHelperWidget.customRichTextButton(
                        context: context,
                        normalText: 'Resend code',
                        highlightedText: ' sending...',
                        onPressed: null,
                      ) : ButtonHelperWidget.customButtonWidget(
                        context: context,
                        onPressed: () async {
                          vendorCreateAccountOtpController.isResendOtpSend.value = true;
                          Future.delayed(Duration(seconds: 1),() async {
                            await vendorCreateAccountOtpController.resetVariable();
                          });
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


                      ButtonHelperWidget.customButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {
                          Get.off(()=>VendorLoginView(),preventDuplicates: false);
                        },
                        text: "Submit",
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
