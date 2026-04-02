import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorBankDetailsView extends StatelessWidget {
  const VendorBankDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorBankDetailsController vendorBankDetailsController = Get.put(VendorBankDetailsController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>VendorWithdrawView(),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=> SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: vendorBankDetailsController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>VendorWithdrawView(),preventDuplicates: false);
                  },
                  title: "Withdraw",
                  actions: [

                    ButtonHelperWidget.customButtonWidget(
                      context: context,
                      backgroundColor: ColorUtils.orange119,
                      padding: EdgeInsets.symmetric(vertical: 10.vpm(context),horizontal: 10.hpm(context)),
                      borderRadius: 8,
                      fontSize: 14,
                      height: 38,
                      textColor: ColorUtils.white255,
                      fontWeight: FontWeight.w500,
                      onPressed: () async {
                        Get.off(()=>VendorCreateBankAccountView(),preventDuplicates: false);
                      },
                      text: "Add Account",
                    ),

                    SpaceHelperWidget.h(15.w(context))

                  ],
                ),


                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                            (context,int index) {
                          return _accountCard(
                            vendorBankDetailsController: vendorBankDetailsController,
                            item: vendorBankDetailsController.getAllPaystackResponseModel.value.data![index],
                            context: context,
                          );
                        },
                        childCount: vendorBankDetailsController.getAllPaystackResponseModel.value.data?.length
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



  // 🔒 Private widget function
  Widget _accountCard({
    required GetAllPaystackResponse item,
    required BuildContext context,
    required VendorBankDetailsController vendorBankDetailsController,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 14.vpm(context), horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          _rowItem(title: "Account Holder:",value: item.accountName ?? "",context: context),
          _divider(),
          _rowItem(title: "Bank name:",value: item.bankName ?? "",context: context),
          _divider(),
          _rowItem(title: "Account number:",value: '${item.accountNumber.substring(0, 3)}****${item.accountNumber.substring(item.accountNumber.length - 4)}',context: context),
          _divider(),
          _actionRow(context: context,vendorBankDetailsController: vendorBankDetailsController,item: item),
        ],
      ),
    );
  }

  // Row for label + value
  Widget _rowItem({required String title, required String value, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextHelperClass.headingTextWithoutWidth(
              context: context,
              alignment: Alignment.centerLeft,
              textAlign: TextAlign.start,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textColor: ColorUtils.black48,
              text: title,
            ),
          ),
          SpaceHelperWidget.h(10.w(context)),
          Expanded(
            child: TextHelperClass.headingTextWithoutWidth(
              context: context,
              alignment: Alignment.centerRight,
              textAlign: TextAlign.end,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              textColor: ColorUtils.black48,
              text: value,
            ),
          ),
        ],
      ),
    );
  }

  // Divider line
  Widget _divider() {
    return Divider(
      color: Colors.grey.shade400,
      height: 1,
    );
  }

  // Action row
  Widget _actionRow({
    required GetAllPaystackResponse item,
    required BuildContext context,
    required VendorBankDetailsController vendorBankDetailsController,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextHelperClass.headingTextWithoutWidth(
              context: context,
              alignment: Alignment.centerLeft,
              textAlign: TextAlign.start,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textColor: ColorUtils.black48,
              text: "Action:",
            ),
          ),
          SpaceHelperWidget.h(10.w(context)),
          ButtonHelperWidget.customButtonWidget(
            context: context,
            onPressed: () async {
              VendorBankDetailsDialogBox().deleteBankDetailsDialog(context: context, bankInformationId: item.sId, vendorBankDetailsController: vendorBankDetailsController);
            },
            text: "Delete Account",
            fontSize: 16,
            padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
            alignment: Alignment.centerRight,
            textColor: ColorUtils.red237,
            fontWeight: FontWeight.w600,
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
