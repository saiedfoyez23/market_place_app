import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerCreateAccountSetUpProfileView extends StatelessWidget {
  const PlannerCreateAccountSetUpProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    PlannerCreateAccountSetUpProfileController plannerCreateAccountSetUpProfileController = Get.put(PlannerCreateAccountSetUpProfileController(context: context));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: plannerCreateAccountSetUpProfileController.isLoading.value == true ?
          LoadingHelperWidget.loadingHelperWidget(
            context: context,
            height: 930.h(context),
          ) :
          CustomScrollView(
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
                        controller: plannerCreateAccountSetUpProfileController.businessNameController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),



                      plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data != null ?
                      Column(
                        children: [

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
                            children: List.generate(plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data!.length, (index) {
                              return Obx(()=>IntrinsicWidth(
                                child: ButtonHelperWidget.customButtonWidget(
                                  context: context,
                                  height: 56.h(context),
                                  padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                  backgroundColor: plannerCreateAccountSetUpProfileController.selectCategory.where((value)=>value == plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]).isEmpty == true ?
                                  ColorUtils.white243 :
                                  plannerCreateAccountSetUpProfileController.selectCategory.where((value)=> value == plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]).first == plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data![index] ?
                                  ColorUtils.orange119 :
                                  ColorUtils.white243,
                                  textColor: plannerCreateAccountSetUpProfileController.selectCategory.where((value)=>value == plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]).isEmpty == true ?
                                  ColorUtils.black89 :
                                  plannerCreateAccountSetUpProfileController.selectCategory.where((value)=>value == plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]).first == plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data![index] ?
                                  ColorUtils.white255 :
                                  ColorUtils.black89,
                                  fontWeight: FontWeight.w500,
                                  onPressed: () async {
                                    if(plannerCreateAccountSetUpProfileController.selectCategory.contains(plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]) == true) {
                                      plannerCreateAccountSetUpProfileController.selectCategory.remove(plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]);
                                      plannerCreateAccountSetUpProfileController.selectCategoryString.remove(plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data![index].title);
                                    } else {
                                      plannerCreateAccountSetUpProfileController.selectCategory.add(plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]);
                                      plannerCreateAccountSetUpProfileController.selectCategoryString.add(plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data![index].title);
                                    }
                                  },
                                  text: plannerCreateAccountSetUpProfileController.categoryResponseModel.value.data?[index].title ?? "",
                                ),
                              ));
                            }),
                          ),

                        ],
                      ) :
                      SizedBox.shrink(),



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
                        controller: plannerCreateAccountSetUpProfileController.aboutYouController.value,
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
                        controller: plannerCreateAccountSetUpProfileController.locationController.value,
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
                        controller: plannerCreateAccountSetUpProfileController.addInstagramController.value,
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
                        controller: plannerCreateAccountSetUpProfileController.addLinkedInController.value,
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
                        controller: plannerCreateAccountSetUpProfileController.addWebsiteController.value,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      SpaceHelperWidget.v(32.h(context)),

                      plannerCreateAccountSetUpProfileController.isSubmit.value == true ?
                      LoadingHelperWidget.loadingHelperWidget(
                        context: context,
                      ) :
                      ButtonHelperWidget.customButtonWidgetAdventPro(
                        context: context,
                        onPressed: () async {
                          if(plannerCreateAccountSetUpProfileController.businessNameController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your business name");
                          } else if(plannerCreateAccountSetUpProfileController.selectCategory.isEmpty == true) {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Please select minimum one category");
                          } else if(plannerCreateAccountSetUpProfileController.latitude.value == 0.0 && plannerCreateAccountSetUpProfileController.latitude.value == 0.0) {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Your location is not able pick. Please able the location permission");
                          } else if(plannerCreateAccountSetUpProfileController.locationController.value.text == "") {
                            MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Your location is not able pick. Please able the location permission");
                          } else {
                            await plannerCreateAccountSetUpProfileController.plannerUpdateUserAccountController(context: context);
                          }
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
