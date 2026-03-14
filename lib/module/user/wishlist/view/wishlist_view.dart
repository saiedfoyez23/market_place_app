import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController = Get.put(WishlistController(context: context));
    return Scaffold(
      body: SafeArea(
        child: Obx(()=> Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: wishlistController.isLoading.value == true ?
          LoadingHelperWidget.loadingHelperWidget(
            context: context,
            height: 930.h(context),
          ) :
          CustomScrollView(
            slivers: [


              MainPageAppBarHelperWidget(
                centerTitle: false,
                title: "Wishlist",
              ),



              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [


                      SpaceHelperWidget.v(32.h(context)),

                    ],
                  ),
                ),
              ),

              wishlistController.getAllFavoritesResponseModel.value.data?.isNotEmpty == true ?
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, int index) {
                          var data = wishlistController.getAllFavoritesResponseModel.value.data?[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                        child: Container(
                          width: 428.w(context),
                          margin: EdgeInsets.only(bottom: 12.bpm(context)),
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.hpm(context),
                            vertical: 14.vpm(context),
                          ),
                          decoration: BoxDecoration(
                              color: ColorUtils.white243,
                              borderRadius: BorderRadius.circular(12.r(context)),
                              border: Border.all(
                                color: ColorUtils.white215,
                                width: .5,
                              )
                          ),
                          child: InkWell(
                            onTap: () async {
                              Get.off(()=> UserPlannerServiceDetailsView(
                                isWishlist: true,
                                isPlanner: false,
                                isSearchBar: false,
                                categoryId: "",
                                isCategory: false,
                                isRecommended: false,
                                isHome: false,
                                serviceId: data?.service?.sId,
                              ), preventDuplicates: false);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // ---------------------- LEFT IMAGE ----------------------

                                ImageHelperWidget.styledImage(
                                  context: context,
                                  height: 150,
                                  width: 100,
                                  imageUrl: data?.service?.images?.first,
                                ),

                                SpaceHelperWidget.h(12.w(context)),

                                // ---------------------- RIGHT CONTENT ----------------------
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          // Profile Image


                                          ImageHelperWidget.circleImageHelperWidget(
                                            width: 18.w(context),
                                            height: 18.h(context),
                                            verticalPadding: 1.vpm(context),
                                            horizontalPadding: 1.hpm(context),
                                            backgroundColor: ColorUtils.orange213,
                                            radius: 25.r(context),
                                            imageAsset: data?.service?.author?.photoUrl == null ? ImageUtils.noImage : null,
                                            imageUrl: data?.service?.author?.photoUrl,
                                          ),

                                          SpaceHelperWidget.h(8.w(context)),


                                          Expanded(
                                            child: TextHelperClass.headingTextWithoutWidth(
                                              context: context,
                                              alignment: Alignment.centerLeft,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              textColor: ColorUtils.black48,
                                              text: data?.service?.author?.name ?? "",
                                            ),
                                          ),


                                          SpaceHelperWidget.h(8.w(context)),


                                          // Rating
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.star, color: ColorUtils.yellow199, size: 16.r(context)),
                                              SpaceHelperWidget.h(4.w(context)),
                                              TextHelperClass.headingTextWithoutWidth(
                                                context: context,
                                                alignment: Alignment.centerLeft,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                textColor: ColorUtils.black10,
                                                text: data?.service?.author?.avgRating.toString() ?? "",
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),


                                      SpaceHelperWidget.v(12.h(context)),

                                      TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        alignment: Alignment.centerLeft,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        textColor: ColorUtils.black48,
                                        text: data?.service?.title ?? "",
                                        textOverFlow: TextOverflow.ellipsis,
                                      ),


                                      SpaceHelperWidget.v(6.h(context)),


                                      TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        alignment: Alignment.centerLeft,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        textColor: ColorUtils.black80,
                                        text: data?.service?.subtitle ?? "",
                                      ),

                                      SpaceHelperWidget.v(12.h(context)),

                                      // Price + Delete Button
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Expanded(
                                            child: RichTextHelperWidget.headingRichText(
                                              context: context,
                                              alignment: Alignment.centerLeft,
                                              textSpans: [
                                                CustomTextSpan(
                                                    text: "From ",
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils.black94
                                                ).toTextSpan(),
                                                CustomTextSpan(
                                                  text: '\$${data?.service?.price ?? ""}',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorUtils.black48,
                                                ).toTextSpan(),
                                              ],
                                            ),
                                          ),


                                          ButtonHelperWidget.customButtonWidget(
                                            context: context,
                                            onPressed: () async {
                                              WishlistDialogBoxWidget().deleteProfileDialog(context: context, wishlistId: data?.sId, wishlistController: wishlistController);
                                            },
                                            text: "Delete",
                                            padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                                            alignment: Alignment.centerRight,
                                            textColor: ColorUtils.red237,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: wishlistController.getAllFavoritesResponseModel.value.data?.length,
                  )
              ) :
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: SizedBox(
                    height: 630.h(context),
                    width: 428.w(context),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.center,
                        textAlign: TextAlign.start,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        textColor: ColorUtils.black48,
                        text: "No Wishlist Available",
                      ),
                    ),
                  ),
                ),
              ),





            ],
          ),
        )),
      ),
    );
  }
}
