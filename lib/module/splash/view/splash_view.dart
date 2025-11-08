import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});


  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
            image: DecorationImage(
              image: AssetImage(ImageUtils.onboardingScreenImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ImageHelperWidget.assetImageWidget(
              context: context,
              height: 72,
              width: 353,
              imageString: ImageUtils.logoImage,
            ),
          ),
        ),
      ),
    );
  }
}
