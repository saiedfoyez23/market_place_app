import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorProfilePaymentSuccessView extends StatelessWidget {
  const VendorProfilePaymentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 930.h(context),
        width: 428.w(context),
        decoration: BoxDecoration(
          color: ColorUtils.white251,
        ),
        child: CustomScrollView(
          slivers: [

            AuthAppBarHelperWidget(
              onBackPressed: () async {
                Get.off(()=>DashboardVendorView(index: 0),preventDuplicates: false);
              },
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                child: Column(
                  children: [

                    SpaceHelperWidget.v(80.h(context)),


                    ImageHelperWidget.assetImageWidget(
                      context: context,
                      height: 213,
                      width: 242,
                      imageString: ImageUtils.successfullImage,
                    ),


                    SpaceHelperWidget.v(80.h(context)),


                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      textAlign: TextAlign.center,
                      alignment: Alignment.center,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black48,
                      text: "Your payment is Successful",
                    ),

                    SpaceHelperWidget.v(12.h(context)),

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.center,
                      textAlign: TextAlign.center,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      textColor: ColorUtils.black96,
                      text: "Your payment is complete",
                    ),


                    SpaceHelperWidget.v(24.h(context)),


                    ButtonHelperWidget.customButtonWidgetAdventPro(
                      context: context,
                      onPressed: () async {
                        Get.off(()=>DashboardVendorView(index: 0),preventDuplicates: false);
                      },
                      text: "Go to Home Page",
                    ),



                  ],
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}
