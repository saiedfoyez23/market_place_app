import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class VendorProfileView extends StatelessWidget {
  const VendorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorProfileViewController vendorProfileViewController = Get.put(VendorProfileViewController(context: context));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.type == null && vendorProfileViewController.isLoading.value == false ?
          RefreshIndicator(
            onRefresh: () async {
              Get.off(()=>DashboardVendorView(index: 5),preventDuplicates: false);
            },
            child: VendorWithoutSubscriptionProfileWidget().vendorWithoutSubscriptionProfileWidget(context: context, vendorProfileViewController: vendorProfileViewController),
          ) :
          vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.type != null && vendorProfileViewController.isLoading.value == false ?
          RefreshIndicator(
            onRefresh: () async {
              Get.off(()=>DashboardVendorView(index: 5),preventDuplicates: false);
            },
            child: VendorWithSubscriptionProfileWidget().vendorWithSubscriptionProfileWidget(context: context, vendorProfileViewController: vendorProfileViewController),
          ) :
          LoadingHelperWidget.loadingHelperWidget(
            context: context,
            height: 930.h(context),
          ),
        ),
      )),
    );
  }
}
