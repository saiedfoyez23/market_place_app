import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class UserPlannerProfilePortfolioView extends StatelessWidget {
  const UserPlannerProfilePortfolioView({
    super.key,
    required this.isHome,
    required this.isRecommended,
    required this.serviceId,
    required this.userId,
    required this.categoryId,
    required this.isCategory,
    required this.isPlanner,
    required this.isWishlist,
  });

  final bool isHome;
  final bool isRecommended;
  final bool isPlanner;
  final String serviceId;
  final String userId;
  final bool isCategory;
  final String categoryId;
  final bool isWishlist;

  @override
  Widget build(BuildContext context) {
    final UserPlannerProfilePortfolioController userPlannerProfilePortfolioController = Get.put(UserPlannerProfilePortfolioController(context: context,userId: userId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>UserPlannerProfileView(
          isHome: isHome,
          isRecommended: isRecommended,
          isPlanner: isPlanner,
          serviceId: serviceId,
          userId: userId,
          isCategory: isCategory,
          categoryId: categoryId,
          isWishlist: isWishlist,
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
            child: userPlannerProfilePortfolioController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [


                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>UserPlannerProfileView(
                      isHome: isHome,
                      isRecommended: isRecommended,
                      isPlanner: isPlanner,
                      serviceId: serviceId,
                      userId: userId,
                      isCategory: isCategory,
                      categoryId: categoryId,
                      isWishlist: isWishlist,
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
                                              image: NetworkImage(userPlannerProfilePortfolioController.getPlannerAllPortfolioResponseModel.value.data?[index].url),
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
                                imageUrl: userPlannerProfilePortfolioController.getPlannerAllPortfolioResponseModel.value.data?[index].url,
                              ),
                            ),
                          );
                        },
                        childCount: userPlannerProfilePortfolioController.getPlannerAllPortfolioResponseModel.value.data?.length
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
