import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerCancelOfferView extends StatelessWidget {
  PlannerCancelOfferView({super.key,required this.orderID});

  final String orderID;
  final PlannerCancelOfferController plannerCancelOfferController = Get.put(PlannerCancelOfferController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>PlannerOrderDetailsView(orderID: orderID),preventDuplicates: false);
      },
      child: Scaffold(
        body: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: Obx(()=>CustomScrollView(
            slivers: [


              AuthAppBarHelperWidget(
                onBackPressed: () async {
                  Get.off(()=>PlannerOrderDetailsView(orderID: orderID),preventDuplicates: false);
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
                        children: plannerCancelOfferController.options.map((option) {
                          return RadioListTileHelperWidget<String>(
                            title: option,
                            value: option,
                            groupValue: plannerCancelOfferController.selectedOption.value,
                            onChanged: (value) {
                              plannerCancelOfferController.selectedOption.value = value!;
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

                      plannerCancelOfferController.selectedOption.value == "Others" ?
                      TextFormFieldWidget.build(
                        context: context,
                        hintText: "Enter a reason",
                        controller: plannerCancelOfferController.otherController.value,
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
                        controller: plannerCancelOfferController.cancelReasonController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),


                      SpaceHelperWidget.v(20.h(context)),


                      plannerCancelOfferController.isSubmit.value == true ?
                      LoadingHelperWidget.loadingHelperWidget(context: context) :
                      ButtonHelperWidget.customButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {
                          if(plannerCancelOfferController.selectedOption.value == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter order cancel reason");
                          } else if(plannerCancelOfferController.cancelReasonController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Write a note for cancel");
                          }  else if(plannerCancelOfferController.selectedOption.value == "Others" && plannerCancelOfferController.otherController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter order cancel other reason");
                          }
                          plannerCancelOfferController.isSubmit.value = true;
                          Map<String,dynamic> data = {
                            "reason": plannerCancelOfferController.selectedOption.value == "Others" ? plannerCancelOfferController.otherController.value.text : plannerCancelOfferController.selectedOption.value,
                            "note": plannerCancelOfferController.cancelReasonController.value.text
                          };
                          print(data);
                          await plannerCancelOfferController.orderCancelController(context: context, orderId: orderID, data: data);

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
    );
  }
}
