import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class VendorProfilePortfolioView extends StatelessWidget {
  VendorProfilePortfolioView({super.key});

  final VendorProfilePortfolioController vendorProfilePortfolioController = Get.put(VendorProfilePortfolioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  Get.off(()=>DashboardVendorView(index: 5),preventDuplicates: false);
                },
                title: "Portfolio",
                actions: [

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
                      await vendorProfilePortfolioController.pickFile();
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
                          child: ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 181.h(context),
                            width: 189.w(context),
                            imageString: vendorProfilePortfolioController.imageString[index],
                          ),
                        );
                      },
                      childCount: vendorProfilePortfolioController.imageString.length
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
      ),
    );
  }
}
