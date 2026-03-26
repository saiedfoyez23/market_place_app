import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerProfileSupportView extends StatelessWidget {
  PlannerProfileSupportView({super.key});

  final PlannerProfileSupportController plannerProfileSupportController = Get.put(PlannerProfileSupportController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardPlannerView(index: 5,),preventDuplicates: false);
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
                    Get.off(()=>DashboardPlannerView(index: 5,),preventDuplicates: false);
                  },
                  title: "Support",
                ),


                SliverFillRemaining(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [

                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Subject",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter Subject",
                          controller: plannerProfileSupportController.subjectController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Message",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.textFiledWithMaxLineBuild(
                          context: context,
                          hintText: "Write something....",
                          maxLines: 5,
                          controller: plannerProfileSupportController.messageController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SpaceHelperWidget.v(24.h(context)),


                        plannerProfileSupportController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(
                          context: context,
                        ) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(plannerProfileSupportController.subjectController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter Support Subject");
                            } else if(plannerProfileSupportController.messageController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter Support Message");
                            } else {
                              plannerProfileSupportController.isSubmit.value = true;
                              Map<String,dynamic> data = {
                                "subject": plannerProfileSupportController.subjectController.value.text,
                                "messages": plannerProfileSupportController.messageController.value.text,
                              };
                              await plannerProfileSupportController.createSupportController(context: context,data: data);
                            }
                          },
                          text: "Send Message",
                        ),


                        SpaceHelperWidget.v(40.h(context)),



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
