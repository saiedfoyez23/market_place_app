import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorProfilePortfolioView extends StatelessWidget {
  VendorProfilePortfolioView({super.key});


  @override
  Widget build(BuildContext context) {
    final VendorProfilePortfolioController vendorProfilePortfolioController = Get.put(VendorProfilePortfolioController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardVendorView(index: 5),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: vendorProfilePortfolioController.isLoading.value == true ?
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
                  title: "Portfolio",
                  actions: [

                    vendorProfilePortfolioController.isSubmit.value == true ?
                    LoadingHelperWidget.loadingHelperWidget(
                      height: 40,
                      width: 50,
                      context: context,
                    ) :
                    ButtonHelperWidget.customIconButtonWidgetAdventPro(
                      context: context,
                      backgroundColor: ColorUtils.orange119,
                      textSize: 20,
                      iconSize: 20,
                      height: 40,
                      padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 16.hpm(context)),
                      borderRadius: 8,
                      textColor: ColorUtils.white255,
                      fontWeight: FontWeight.w700,
                      onPressed: () async {
                        await vendorProfilePortfolioController.pickFile(context: context);
                      },
                      iconPath: ImageUtils.uploadIconImage,
                      text: "Upload",
                    ),

                    SpaceHelperWidget.h(15.w(context))

                  ],
                ),


                SliverToBoxAdapter(
                  child: SpaceHelperWidget.v(32.h(context)),
                ),



                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                            (context,int index) {
                          return InkWell(
                            onTap: () async {
                              showDialog(
                                context: context,
                                barrierDismissible: true, // user must tap a button
                                builder: (context) {
                                  return Dialog(
                                    insetPadding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.r(context)),
                                    ),
                                    child: IntrinsicHeight(
                                      child: Container(
                                        height: 768.h(context),
                                        width: 428.w(context),
                                        decoration: BoxDecoration(
                                            color: ColorUtils.white255,
                                            borderRadius: BorderRadius.circular(20.r(context)),
                                            image: DecorationImage(
                                              image: AssetImage(vendorProfilePortfolioController.imageString[index]),
                                              fit: BoxFit.cover,
                                            )
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  clipBehavior: Clip.antiAlias,
                                  borderRadius: BorderRadius.circular(12.r(context)),
                                  child: ImageHelperWidget.styledImage(
                                    context: context,
                                    height: 320.h(context),
                                    width: 220.w(context),
                                    imageUrl: vendorProfilePortfolioController.vendorUserWisePortfolioModel.value.data?[index].url,
                                  ),
                                ),


                                Positioned(
                                  top: 12.h(context),
                                  right: 12.w(context),
                                  child: InkWell(
                                    onTap: () async {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false, // user must tap a button
                                        builder: (context) {
                                          return Obx(()=>Dialog(
                                            insetPadding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.r(context)),
                                            ),
                                            child: IntrinsicHeight(
                                              child: Container(
                                                width: 428.w(context),
                                                decoration: BoxDecoration(
                                                  color: ColorUtils.white255,
                                                  borderRadius: BorderRadius.circular(20.r(context)),
                                                ),
                                                padding: EdgeInsets.fromLTRB(
                                                  16.lpm(context),
                                                  20.tpm(context),
                                                  16.rpm(context),
                                                  20.bpm(context),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    /// ===== Title Text =====

                                                    TextHelperClass.headingTextWithoutWidth(
                                                      context: context,
                                                      alignment: Alignment.center,
                                                      textAlign: TextAlign.center,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600,
                                                      textColor: ColorUtils.black21,
                                                      text: "Are you sure you want to delete the portfolio image? ",
                                                    ),


                                                    SpaceHelperWidget.v(32.h(context)),


                                                    /// ===== Buttons Row =====
                                                    Row(
                                                      children: [
                                                        /// No Button

                                                        Expanded(
                                                          child: ButtonHelperWidget.customButtonWidget(
                                                            context: context,
                                                            onPressed: () async {
                                                              Navigator.pop(context);
                                                            },
                                                            text: "No",
                                                            borderRadius: 40,
                                                            backgroundColor: ColorUtils.white243,
                                                            fontWeight: FontWeight.w600,
                                                            textColor: ColorUtils.black89,
                                                            fontSize: 20,
                                                          ),
                                                        ),


                                                        SpaceHelperWidget.h(10.w(context)),


                                                        Expanded(
                                                          child: vendorProfilePortfolioController.isDelete.value == true ?
                                                          LoadingHelperWidget.loadingHelperWidget(
                                                            context: context,
                                                            height: 56.h(context),
                                                          ) :
                                                          ButtonHelperWidget.customButtonWidget(
                                                            context: context,
                                                            onPressed: () async {
                                                              await vendorProfilePortfolioController.deleteVendorPortfolioController(
                                                                context: context,
                                                                id: vendorProfilePortfolioController.vendorUserWisePortfolioModel.value.data?[index].sId ?? "",
                                                              );
                                                            },
                                                            text: "Delete",
                                                            borderRadius: 40,
                                                            backgroundColor: ColorUtils.red191,
                                                            fontWeight: FontWeight.w600,
                                                            textColor: ColorUtils.white255,
                                                            fontSize: 20,
                                                          ),
                                                        ),

                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ));
                                        },
                                      );
                                    },
                                    child: ImageHelperWidget.assetImageWidget(
                                      context: context,
                                      height: 32.h(context),
                                      width: 32.w(context),
                                      imageString: ImageUtils.fileDeleteImage,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: vendorProfilePortfolioController.vendorUserWisePortfolioModel.value.data?.length
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.h(context),
                      crossAxisSpacing: 15.w(context),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: SpaceHelperWidget.v(32.h(context)),
                ),


              ],
            ),
          ),
        )),
      ),
    );
  }
}
