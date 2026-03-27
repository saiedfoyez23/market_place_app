import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorCancelOfferView extends StatelessWidget {
  VendorCancelOfferView({super.key,required this.orderID});

  final String orderID;
  final VendorCancelOfferController vendorCancelOfferController = Get.put(VendorCancelOfferController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>VendorOrderDetailsView(orderID: orderID,isLead: false,),preventDuplicates: false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white255,
            ),
            child: Obx(()=>CustomScrollView(
              slivers: [
          
          
                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>VendorOrderDetailsView(orderID: orderID,isLead: false,),preventDuplicates: false);
                  },
                  title: "Cancel Reason",
                ),
          
          
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [
          
                        SpaceHelperWidget.v(16.h(context)),
          
          
                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          textAlign: TextAlign.start,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.black48,
                          text: "Why you cancel this order",
                        ),
          
          
                        SpaceHelperWidget.v(20.h(context)),
          
          
                        Column(
                          children: vendorCancelOfferController.options.map((option) {
                            return RadioListTileHelperWidget<String>(
                              title: option,
                              value: option,
                              groupValue: vendorCancelOfferController.selectedOption.value,
                              onChanged: (value) {
                                vendorCancelOfferController.selectedOption.value = value!;
                              },
                              activeColor: Color.fromRGBO(252, 119, 87, 1),
                              dense: true,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              contentPadding: EdgeInsets.zero,
                            );
                          }).toList(),
                        ),
          
          
                        SpaceHelperWidget.v(16.h(context)),
          
                        vendorCancelOfferController.selectedOption.value == "Others" ?
                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter a reason",
                          controller: vendorCancelOfferController.otherController.value,
                          keyboardType: TextInputType.emailAddress,
                        ) :
                        SizedBox.shrink(),
          
          
                        SpaceHelperWidget.v(20.h(context)),
          
          
                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Write a note",
                        ),
          
                        SpaceHelperWidget.v(6.h(context)),
          
          
                        TextFormFieldWidget.textFiledWithMaxLineBuild(
                          context: context,
                          hintText: "write something ....",
                          maxLines: 5,
                          controller: vendorCancelOfferController.cancelReasonController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),
          
          
                        SpaceHelperWidget.v(20.h(context)),
          
          
                        vendorCancelOfferController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(context: context) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(vendorCancelOfferController.selectedOption.value == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter order cancel reason");
                            } else if(vendorCancelOfferController.cancelReasonController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Write a note for cancel");
                            }  else if(vendorCancelOfferController.selectedOption.value == "Others" && vendorCancelOfferController.otherController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter order cancel other reason");
                            }
                            vendorCancelOfferController.isSubmit.value = true;
                            Map<String,dynamic> data = {
                              "reason": vendorCancelOfferController.selectedOption.value == "Others" ? vendorCancelOfferController.otherController.value.text : vendorCancelOfferController.selectedOption.value,
                              "note": vendorCancelOfferController.cancelReasonController.value.text
                            };
                            print(data);
                            await vendorCancelOfferController.orderCancelController(context: context, orderId: orderID, data: data);
          
                          },
                          text: "Submit",
                        ),
          
          
          
          
          
          
          
          
          
          
                      ],
                    ),
                  ),
                )
          
          
          
          
          
              ],
            )),
          ),
        ),
      ),
    );
  }
}
