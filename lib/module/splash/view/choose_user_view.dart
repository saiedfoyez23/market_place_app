import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class ChooseUserView extends StatelessWidget {
  ChooseUserView({super.key});

  final ChooseUserController chooseUserController = Get.put(ChooseUserController());

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
            child: CustomScrollView(
              slivers: [

                SliverToBoxAdapter(
                  child: Column(
                    children: [

                      SpaceHelperWidget.v(65.h(context)),


                      ImageHelperWidget.assetImageWidget(
                        context: context,
                        height: 70,
                        width: 344,
                        imageString: ImageUtils.logoImage,
                      ),

                      SpaceHelperWidget.v(65.h(context)),


                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        textColor: ColorUtils.black48,
                        text: "Choose your role",
                      ),

                      SpaceHelperWidget.v(12.h(context)),

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        textColor: ColorUtils.black96,
                        text: "Select how you want to get started",
                      ),

                      SpaceHelperWidget.v(20.h(context)),


                      ButtonHelperWidget.userChooseButtonWidget(
                        context: context,
                        descriptionFontSize: 20,
                        titleFontSize: 24,
                        onPressed: () {
                          chooseUserController.chooseUser(useRole: "Customer");
                        },
                        title: "Customer",
                        description: "Discover planners and event professionals for your next event, book securely, and manage your orders with ease.",
                        imagePath: ImageUtils.customerImage,
                        backgroundColor: chooseUserController.chooseUseRole.value == "Customer" ? ColorUtils.orange213 : ColorUtils.orange241,
                        borderColor: chooseUserController.chooseUseRole.value == "Customer" ? ColorUtils.orange119 : ColorUtils.orange213,
                      ),


                      SpaceHelperWidget.v(20.h(context)),


                      ButtonHelperWidget.userChooseButtonWidget(
                        context: context,
                        descriptionFontSize: 20,
                        titleFontSize: 24,
                        onPressed: () {
                          chooseUserController.chooseUser(useRole: "Planner");
                        },
                        title: "Planner",
                        description: "Organize events, connect with vendors, and manage clients efficiently.",
                        imagePath: ImageUtils.plannerImage,
                        backgroundColor: chooseUserController.chooseUseRole.value == "Planner" ? ColorUtils.orange213 : ColorUtils.orange241,
                        borderColor: chooseUserController.chooseUseRole.value == "Planner" ? ColorUtils.orange119 : ColorUtils.orange213,
                      ),

                      SpaceHelperWidget.v(20.h(context)),



                      ButtonHelperWidget.userChooseButtonWidget(
                        context: context,
                        descriptionFontSize: 20,
                        titleFontSize: 24,
                        onPressed: () {
                          chooseUserController.chooseUser(useRole: "Vendor");
                        },
                        title: "Vendor",
                        description: "Showcase your services or products and reach new customers.",
                        imagePath: ImageUtils.vendorImage,
                        backgroundColor: chooseUserController.chooseUseRole.value == "Vendor" ? ColorUtils.orange213 : ColorUtils.orange241,
                        borderColor: chooseUserController.chooseUseRole.value == "Vendor" ? ColorUtils.orange119 : ColorUtils.orange213,
                      ),


                      SpaceHelperWidget.v(24.h(context)),


                      ButtonHelperWidget.customButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {
                          if(chooseUserController.chooseUseRole.value == "Vendor") {
                            await chooseUserController.vendorLoginRedirection();
                          } else if(chooseUserController.chooseUseRole.value == "Planner") {
                            await chooseUserController.plannerLoginRedirection();
                          } else if(chooseUserController.chooseUseRole.value == "Customer") {
                            await chooseUserController.userLoginRedirection();
                          }
                        },
                        text: "Next",
                      ),



                    ],
                  ),
                ),



              ],
            ),
          ),
        ),
      )),
    );
  }
}
