import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';


class VendorWithdrawView extends StatelessWidget {
  const VendorWithdrawView({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorGetAllWithdrawController vendorGetAllWithdrawController = Get.put(VendorGetAllWithdrawController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardVendorView(index: 5),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(() => SafeArea(
          child: Container(
              height: 930.h(context),
              width: 428.w(context),
              decoration: BoxDecoration(
                color: ColorUtils.white251,
              ),
              child: vendorGetAllWithdrawController.isLoading.value == true ?
              LoadingHelperWidget.loadingHelperWidget(
                context: context,
                height: 930.h(context),
              ) :
              CustomScrollView(
                slivers: [


                  AuthAppBarHelperWidget(
                    onBackPressed: () async {
                      Get.off(()=>DashboardVendorView(index: 5),preventDuplicates: false);
                    },
                    title: 'My Wallet',
                  ),


                  SliverFillRemaining(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SpaceHelperWidget.v(16.h(context)),
                          // Total Balance Card
                          Container(
                            height: 160.h(context),
                            padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 12.hpm(context)),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  ColorUtils.orange96,
                                  ColorUtils.orange119,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12.r(context)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.centerLeft,
                                      textAlign: TextAlign.start,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      textColor: ColorUtils.white255,
                                      text: 'Total Balance',
                                    ),

                                    SpaceHelperWidget.v(14.h(context)),


                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.centerLeft,
                                      textAlign: TextAlign.start,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                      textColor: ColorUtils.white255,
                                      text: '\$${vendorGetAllWithdrawController.getAllWithdrawResponseModel.value.data?.totalWithdraw}',
                                    ),


                                  ],
                                ),


                                ButtonHelperWidget.customIconButtonWidget(
                                  context: context,
                                  backgroundColor: ColorUtils.white255,
                                  textSize: 16,
                                  iconSize: 20,
                                  height: 38,
                                  padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 10.hpm(context)),
                                  borderRadius: 8,
                                  textColor: ColorUtils.black64,
                                  fontWeight: FontWeight.w500,
                                  onPressed: () async {
                                    Get.off(()=>VendorBankDetailsView(),preventDuplicates: false);
                                  },
                                  iconPath: ImageUtils.myWalletImage,
                                  text: 'Withdraw',
                                ),

                              ],
                            ),
                          ),


                          SpaceHelperWidget.v(32.h(context)),

                          // Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Expanded(
                                child: TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.centerLeft,
                                  textAlign: TextAlign.start,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  textColor: ColorUtils.black48,
                                  text: 'Withdrawal History',
                                ),
                              ),

                              SpaceHelperWidget.h(10.w(context)),


                              Expanded(
                                child: CustomDropdownHelperClass(
                                  fillColor: ColorUtils.white243,
                                  value: vendorGetAllWithdrawController.selectType.value,
                                  items: ["All","Proceed","Complete","Hold","Pending","Reject"],
                                  onChanged: (value) async {
                                    vendorGetAllWithdrawController.filterWithdrawList.value = vendorGetAllWithdrawController.getAllWithdrawResponseWithdrawList;
                                    vendorGetAllWithdrawController.selectType.value = value!;
                                    if(value == "All") {
                                      vendorGetAllWithdrawController.filterWithdrawList.value = vendorGetAllWithdrawController.getAllWithdrawResponseWithdrawList;
                                    } else if(value == "Proceed") {
                                      vendorGetAllWithdrawController.filterWithdrawList.value = vendorGetAllWithdrawController.getAllWithdrawResponseWithdrawList.where((value)=> value.status == "proceed").toList();
                                    } else if(value == "Pending") {
                                      vendorGetAllWithdrawController.filterWithdrawList.value = vendorGetAllWithdrawController.getAllWithdrawResponseWithdrawList.where((value)=> value.status == "pending").toList();
                                    } else if(value == "Hold") {
                                      vendorGetAllWithdrawController.filterWithdrawList.value = vendorGetAllWithdrawController.getAllWithdrawResponseWithdrawList.where((value)=> value.status == "hold").toList();
                                    } else if(value == "Complete") {
                                      vendorGetAllWithdrawController.filterWithdrawList.value = vendorGetAllWithdrawController.getAllWithdrawResponseWithdrawList.where((value)=> value.status == "completed").toList();
                                    } else if(value == "Reject") {
                                      vendorGetAllWithdrawController.filterWithdrawList.value = vendorGetAllWithdrawController.getAllWithdrawResponseWithdrawList.where((value)=> value.status == "failed").toList();
                                    }
                                  },
                                  hintText: "select",
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // List of Withdrawals

                          Expanded(
                            child: Obx(() {
                              final dataList = vendorGetAllWithdrawController.filterWithdrawList;
                              if (dataList.isEmpty) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: TextHelperClass.headingTextWithoutWidth(
                                    context: context,
                                    alignment: Alignment.center,
                                    textAlign: TextAlign.start,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    textColor: ColorUtils.black48,
                                    text: "No Withdrawal History Available",
                                  ),
                                );
                              }

                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: vendorGetAllWithdrawController.filterWithdrawList.length,
                                itemBuilder: (context, index) {
                                  final item = dataList[index];
                                  return _buildWithdrawItem(item: item,context: context);
                                },
                              );
                            }),
                          ),

                        ],
                      ),
                    ),
                  )


                ],
              )
          ),
        )
        ),
      ),
    );
  }

  Widget _buildWithdrawItem({
    required GetAllWithdrawResponseWithdrawList item,
    required BuildContext context,
  }) {
    final amount = item.amount; // Adjust if amount is in cents
    final status = item.status;

    Color statusColor = Colors.grey;
    if (status == 'proceed') statusColor = ColorUtils.yellow95;
    if (status == 'completed') statusColor = ColorUtils.green139;
    if (status == "hold") statusColor = ColorUtils.blue206;
    if (status == 'pending') statusColor = ColorUtils.yellow177;
    if (status == 'reject' || status == 'failed') statusColor = ColorUtils.red181;


    return Container(
      margin: EdgeInsets.only(bottom: 10.bpm(context)),
      padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 8.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white243,
        borderRadius: BorderRadius.circular(8.r(context)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  textAlign: TextAlign.start,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textColor: ColorUtils.black64,
                  text: (item.method ?? '').toString().toUpperCase(),
                ),
                SpaceHelperWidget.v(4.h(context)),
                TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: ColorUtils.black74,
                    text: _formatDate(item.createdAt)
                ),
              ],
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerRight,
                  textAlign: TextAlign.end,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textColor: ColorUtils.black64,
                  text: '\$${NumberFormat('#,###.00').format(amount)}',
                ),
                SpaceHelperWidget.v(4.h(context)),
                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerRight,
                  textAlign: TextAlign.end,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: statusColor,
                  text:  (item.status ?? 'Pending').toUpperCase(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return 'N/A';
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('MMM d, yyyy').format(date);
    } catch (e) {
      return dateStr;
    }
  }
}
