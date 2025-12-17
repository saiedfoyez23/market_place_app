import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerCreateAccountSetUpProfileView extends StatelessWidget {
  PlannerCreateAccountSetUpProfileView({super.key});

  final PlannerCreateAccountController plannerCreateAccountController = Get.put(PlannerCreateAccountController());

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
                  PlannerProfileDialogBoxWidget().plannerLogOutDialog(context: context);
                },
                title: "Set-up Profile",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperWidget.v(32.h(context)),


                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "Business Name",
                      ),

                      SpaceHelperWidget.v(6.h(context)),


                      TextFormFieldWidget.build(
                        context: context,
                        hintText: "Enter your business name",
                        controller:  plannerCreateAccountController.businessNameController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),


                      SpaceHelperWidget.v(20.h(context)),


                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "Category",
                      ),

                      SpaceHelperWidget.v(6.h(context)),

                      Wrap(
                        runSpacing: 10.h(context),
                        spacing: 10.w(context),
                        children: List.generate(plannerCreateAccountController.categoryList.length, (index) {
                          return Obx(()=>IntrinsicWidth(
                            child: ButtonHelperWidget.customButtonWidget(
                              context: context,
                              height: 56.h(context),
                              padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                              backgroundColor: plannerCreateAccountController.selectCategory.value == plannerCreateAccountController.categoryList[index] ? ColorUtils.orange119 : ColorUtils.white243,
                              textColor:  plannerCreateAccountController.selectCategory.value == plannerCreateAccountController.categoryList[index] ? ColorUtils.white255 : ColorUtils.black89,
                              fontWeight: FontWeight.w500,
                              onPressed: () async {
                                plannerCreateAccountController.selectCategory.value = plannerCreateAccountController.categoryList[index];
                              },
                              text: plannerCreateAccountController.categoryList[index],
                            ),
                          ));
                        }),
                      ),


                      SpaceHelperWidget.v(20.h(context)),

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "About You",
                      ),

                      SpaceHelperWidget.v(6.h(context)),


                      TextFormFieldWidget.textFiledWithMaxLineBuild(
                        context: context,
                        maxLines: 5,
                        hintText: "Write something ...",
                        controller:  plannerCreateAccountController.aboutYouController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),


                      SpaceHelperWidget.v(20.h(context)),


                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "Location",
                      ),

                      SpaceHelperWidget.v(6.h(context)),


                      TextFormFieldWidget.build(
                        context: context,
                        hintText: "Enter your location",
                        controller:  plannerCreateAccountController.locationController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),


                      SpaceHelperWidget.v(20.h(context)),


                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "Add Instagram",
                      ),

                      SpaceHelperWidget.v(6.h(context)),


                      TextFormFieldWidget.build(
                        context: context,
                        hintText: "Enter your instagram link",
                        controller:  plannerCreateAccountController.addInstagramController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),


                      SpaceHelperWidget.v(20.h(context)),


                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "Add Linkedin",
                      ),

                      SpaceHelperWidget.v(6.h(context)),

                      TextFormFieldWidget.build(
                        context: context,
                        hintText: "Enter your linkedin link",
                        controller:  plannerCreateAccountController.addLinkedInController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      SpaceHelperWidget.v(20.h(context)),


                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "Add Website",
                      ),

                      SpaceHelperWidget.v(6.h(context)),


                      TextFormFieldWidget.build(
                        context: context,
                        hintText: "Enter your website link",
                        controller:  plannerCreateAccountController.addWebsiteController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      SpaceHelperWidget.v(32.h(context)),

                      ButtonHelperWidget.customButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {
                          Get.off(()=>PlannerCreateAccountKycVerificationView(),preventDuplicates: false);
                        },
                        text: "Next",
                      ),

                      SpaceHelperWidget.v(32.h(context)),


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
