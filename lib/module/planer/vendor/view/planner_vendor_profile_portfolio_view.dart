import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerVendorProfilePortfolioView extends StatelessWidget {
  const PlannerVendorProfilePortfolioView({
    super.key,
    required this.userId,
    required this.serviceId,
    required this.isHome,
    required this.isCategory,
    required this.isSearch,
    required this.categoryId,
  });
  final String serviceId;
  final String userId;
  final bool isHome;
  final bool isCategory;
  final bool isSearch;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    final PlannerVendorProfilePortfolioController plannerVendorProfilePortfolioController = Get.put(PlannerVendorProfilePortfolioController(context: context,userId: userId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>PlannerVendorProfileView(
          serviceId: serviceId,
          userId: userId,
          isHome: isHome,
          isCategory: isCategory,
          isSearch: isSearch,
          categoryId: categoryId,
        ),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: plannerVendorProfilePortfolioController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [


                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>PlannerVendorProfileView(
                      serviceId: serviceId,
                      userId: userId,
                      isSearch: isSearch,
                      isCategory: isCategory,
                      isHome: isHome,
                      categoryId: categoryId,
                    ),preventDuplicates: false);
                  },
                  title: "Portfolio",
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
                                              image: NetworkImage(plannerVendorProfilePortfolioController.getPlannerAllPortfolioResponseModel.value.data?[index].url),
                                              fit: BoxFit.cover,
                                            )
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child:ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(12.r(context)),
                              child: ImageHelperWidget.styledImage(
                                context: context,
                                height: 320.h(context),
                                width: 220.w(context),
                                imageUrl: plannerVendorProfilePortfolioController.getPlannerAllPortfolioResponseModel.value.data?[index].url,
                              ),
                            ),
                          );
                        },
                        childCount: plannerVendorProfilePortfolioController.getPlannerAllPortfolioResponseModel.value.data?.length
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
