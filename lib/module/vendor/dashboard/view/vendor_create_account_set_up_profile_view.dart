import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorCreateAccountSetUpProfileView extends StatelessWidget {
  VendorCreateAccountSetUpProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorCreateAccountSetUpProfileController vendorCreateAccountSetUpProfileController = Get.put(VendorCreateAccountSetUpProfileController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        VendorProfileDialogBoxWidget().vendorLogOutDialog(context: context);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: vendorCreateAccountSetUpProfileController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    VendorProfileDialogBoxWidget().vendorLogOutDialog(context: context);
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
                          controller: vendorCreateAccountSetUpProfileController.businessNameController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        SpaceHelperWidget.v(20.h(context)),


                        vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data != null ?
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
                              children: List.generate(vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data!.length, (index) {
                                return Obx(()=>IntrinsicWidth(
                                  child: ButtonHelperWidget.customButtonWidget(
                                    context: context,
                                    height: 56.h(context),
                                    padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                    backgroundColor: vendorCreateAccountSetUpProfileController.selectCategory.where((value)=>value == vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]).isEmpty == true ?
                                    ColorUtils.white243 :
                                    vendorCreateAccountSetUpProfileController.selectCategory.where((value)=> value == vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]).first == vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data![index] ?
                                    ColorUtils.orange119 :
                                    ColorUtils.white243,
                                    textColor: vendorCreateAccountSetUpProfileController.selectCategory.where((value)=>value == vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]).isEmpty == true ?
                                    ColorUtils.black89 :
                                    vendorCreateAccountSetUpProfileController.selectCategory.where((value)=>value == vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]).first == vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data![index] ?
                                    ColorUtils.white255 :
                                    ColorUtils.black89,
                                    fontWeight: FontWeight.w500,
                                    onPressed: () async {
                                      if(vendorCreateAccountSetUpProfileController.selectCategory.contains(vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]) == true) {
                                        vendorCreateAccountSetUpProfileController.selectCategory.remove(vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]);
                                        vendorCreateAccountSetUpProfileController.selectCategoryString.remove(vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data![index].title);
                                      } else {
                                        vendorCreateAccountSetUpProfileController.selectCategory.add(vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data![index]);
                                        vendorCreateAccountSetUpProfileController.selectCategoryString.add(vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data![index].title);
                                      }
                                    },
                                    text: vendorCreateAccountSetUpProfileController.categoryResponseModel.value.data?[index].title ?? "",
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
                          controller: vendorCreateAccountSetUpProfileController.aboutYouController.value,
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
                          controller: vendorCreateAccountSetUpProfileController.locationController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SpaceHelperWidget.v(32.h(context)),

                        vendorCreateAccountSetUpProfileController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(
                          context: context,
                        ) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(vendorCreateAccountSetUpProfileController.businessNameController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your business name");
                            } else if(vendorCreateAccountSetUpProfileController.selectCategory.isEmpty == true) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Please select minimum one category");
                            } else if(vendorCreateAccountSetUpProfileController.latitude.value == 0.0 && vendorCreateAccountSetUpProfileController.latitude.value == 0.0) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Your location is not able pick. Please able the location permission");
                            } else if(vendorCreateAccountSetUpProfileController.locationController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Your location is not able pick. Please able the location permission");
                            } else {
                              await vendorCreateAccountSetUpProfileController.vendorUpdateUserAccountController(context: context);
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
      ),
    );
  }
}
