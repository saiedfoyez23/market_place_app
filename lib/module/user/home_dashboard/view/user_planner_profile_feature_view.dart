import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserPlannerProfileFeatureView extends StatelessWidget {
  const UserPlannerProfileFeatureView({
    super.key,
    required this.isSearchBar,
    required this.isHome,
    required this.isRecommended,
    required this.serviceId,
    required this.userId,
    required this.categoryId,
    required this.isCategory,
    required this.isPlanner,
    required this.isWishlist,
  });

  final bool isSearchBar;
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
    final UserPlannerProfileFeatureController userPlannerProfileFeatureController = Get.put(UserPlannerProfileFeatureController(
        context: context, userId: userId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>UserPlannerProfileView(
          isHome: isHome,
          isRecommended: isRecommended,
          serviceId: serviceId,
          userId: userId,
          categoryId: categoryId,
          isCategory: isCategory,
          isPlanner: isPlanner,
          isWishlist: isWishlist,
          isSearchBar: isSearchBar,
        ),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white255,
            ),
            child: userPlannerProfileFeatureController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            RefreshIndicator(
              onRefresh: () async {
                Get.off(()=>UserPlannerProfileFeatureView(
                  isSearchBar: isSearchBar,
                  isHome: isHome,
                  isRecommended: isRecommended,
                  serviceId: serviceId,
                  userId: userId,
                  categoryId: categoryId,
                  isCategory: isCategory,
                  isPlanner: isPlanner,
                  isWishlist: isWishlist,
                ),preventDuplicates: false);
              },
              child: CustomScrollView(
                slivers: [


                  AuthAppBarHelperWidget(
                    onBackPressed: () async {
                      Get.off(()=>UserPlannerProfileView(
                        isSearchBar: isSearchBar,
                        isHome: isHome,
                        isRecommended: isRecommended,
                        serviceId: serviceId,
                        userId: userId,
                        categoryId: categoryId,
                        isCategory: isCategory,
                        isPlanner: isPlanner,
                        isWishlist: isWishlist,
                      ),preventDuplicates: false);
                    },
                    title: "Feature List",
                  ),


                  userPlannerProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?.isNotEmpty == true ?
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context,int index) {
                        return vendorCard(
                          index: index,
                          context: context,
                          userPlannerProfileFeatureController: userPlannerProfileFeatureController,
                        );
                      },
                      childCount: userPlannerProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?.length,
                    ),
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
                            text: "No Feature Service Available",
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        )),
      ),
    );
  }


  // ---------------- DYNAMIC CARD ----------------
  Widget vendorCard({
    required int index,
    required BuildContext context,
    required UserPlannerProfileFeatureController userPlannerProfileFeatureController,
  }) {
    var data = userPlannerProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
      child: Container(
        margin: EdgeInsets.only(bottom: 20.bpm(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r(context)),
          color: ColorUtils.white243,
          border: Border.all(
            color: ColorUtils.white215,
            width: 1,
          ),
        ),
        child: Column(
          children: [


            imageSection(
              img: data!.images!.first,
              index: index,
              context: context,
              userPlannerProfileFeatureController: userPlannerProfileFeatureController,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.vpm(context)),
              child: Column(
                children: [

                  infoSection(
                    index: index,
                    context: context,
                    userPlannerProfileFeatureController: userPlannerProfileFeatureController,
                  ),

                  buttons(
                    index: index,
                    context: context,
                    userPlannerProfileFeatureController: userPlannerProfileFeatureController,
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  // ---------------- IMAGE ----------------
  Widget imageSection({
    required String img,
    required int index,
    required BuildContext context,
    required UserPlannerProfileFeatureController userPlannerProfileFeatureController,
  }) {
    var data = userPlannerProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index];

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r(context)),
            topRight: Radius.circular(12.r(context)),
          ),
          child: Image.network(
            img,
            height: 192.h(context),
            width: 428.w(context),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 12.h(context),
          right: 12.w(context),
          child: data?.isFavorite != false ?
          InkWell(
            onTap: () async {
              await userPlannerProfileFeatureController.createFavoritesController(
                context: context,
                serviceId: data?.sId,
                userId: userId,
              );
            },
            child: ImageHelperWidget.assetImageWidget(
              context: context,
              height: 26.h(context),
              width: 26.w(context),
              imageString: ImageUtils.unfavoriteIcon,
            ),
          ) : InkWell(
            onTap: () async {
              await userPlannerProfileFeatureController.createFavoritesController(
                context: context,
                serviceId: data?.sId,
                userId: userId,
              );
            },
            child: ImageHelperWidget.assetImageWidget(
              context: context,
              height: 26.h(context),
              width: 26.w(context),
              imageString: ImageUtils.favoriteIcon,
            ),
          ),
        ),
      ],
    );
  }

  // ---------------- INFO ----------------
  Widget infoSection({
    required int index,
    required BuildContext context,
    required UserPlannerProfileFeatureController userPlannerProfileFeatureController,
  }) {
    var data = userPlannerProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.hpm(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              ImageHelperWidget.circleImageHelperWidget(
                width: 32.w(context),
                height: 32.h(context),
                verticalPadding: 1.vpm(context),
                horizontalPadding: 1.hpm(context),
                backgroundColor: ColorUtils.orange213,
                radius: 25.r(context),
                imageAsset: data?.author?.photoUrl == null ? ImageUtils.noImage : null,
                imageUrl: data?.author?.photoUrl,
              ),

              SpaceHelperWidget.h(12.w(context)),

              Expanded(
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  textAlign: TextAlign.start,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black48,
                  text: data?.author?.name ?? "",
                ),
              ),

              SpaceHelperWidget.h(6.w(context)),

              if(data?.author?.isKycVerified == true)...[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.hpm(context),vertical: 2.vpm(context)),
                  decoration: BoxDecoration(
                    color: ColorUtils.blue219,
                    borderRadius: BorderRadius.circular(6.r(context)),
                  ),
                  child: Row(
                    children: [

                      ImageHelperWidget.assetImageWidget(
                        context: context,
                        height: 17.h(context),
                        width: 17.w(context),
                        imageString: ImageUtils.verifyImage,
                      ),

                      SpaceHelperWidget.h(6.w(context)),

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        textAlign: TextAlign.start,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: ColorUtils.black48,
                        text: "Verified",
                      ),


                    ],
                  ),
                )
              ] else...[
                SizedBox.shrink()
              ]



            ],
          ),

          SpaceHelperWidget.v(14.h(context)),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                containerColor: ColorUtils.blue219,
                padding: EdgeInsets.symmetric(vertical: 2.vpm(context),horizontal: 8.h(context)),
                textAlign: TextAlign.start,
                fontSize: 17,
                fontWeight: FontWeight.w400,
                borderRadius: BorderRadius.circular(6.r(context)),
                textColor: ColorUtils.blue71,
                text: data?.category?.title ?? "",
              ),



              SpaceHelperWidget.h(6.w(context)),

              Row(
                children: [
                  Icon(Icons.star, color: ColorUtils.yellow199, size: 20.r(context)),
                  SpaceHelperWidget.h(6.w(context)),
                  RichTextHelperWidget.headingWithoutWidthRichText(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textSpans: [
                      CustomTextSpan(
                        text: '${data?.author?.avgRating} ',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black10,
                      ).toTextSpan(),
                      CustomTextSpan(
                        text: '(${data?.author?.ratingCount} reviews)',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorUtils.black10,
                      ).toTextSpan(),
                    ],
                  ),
                ],
              ),


            ],
          ),

          SpaceHelperWidget.v(16.h(context)),


          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: data?.title ?? "",
          ),

          SpaceHelperWidget.v(6.h(context)),


          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black80,
            text: data?.subtitle ?? "",
          ),


          SpaceHelperWidget.v(12.h(context)),

          Row(
            children: [
              ImageHelperWidget.assetImageWidget(
                context: context,
                height: 21.h(context),
                width: 21.w(context),
                imageString: ImageUtils.locationImage,
              ),

              SpaceHelperWidget.h(8.w(context)),


              Expanded(
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  textAlign: TextAlign.start,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black94,
                  text: data?.address ?? "",
                ),
              ),


            ],
          ),


          SpaceHelperWidget.v(24.h(context)),


        ],
      ),
    );
  }

  // ---------------- BUTTONS ----------------
  Widget buttons({
    required int index,
    required BuildContext context,
    required UserPlannerProfileFeatureController userPlannerProfileFeatureController,
  }) {
    var data = userPlannerProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index];
    return Obx(()=>Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.hpm(context)),
      child: Row(
        children: [


          Expanded(
            child: userPlannerProfileFeatureController.serviceId.value == userPlannerProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index].sId && userPlannerProfileFeatureController.isCreate.value == true ?
            LoadingHelperWidget.loadingHelperWidget(context: context) :
            ButtonHelperWidget.customButtonWidgetAdventPro(
              context: context,
              onPressed: () async {
                userPlannerProfileFeatureController.serviceId.value = userPlannerProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index].sId;
                userPlannerProfileFeatureController.isCreate.value = true;
                Map<String,dynamic> data = {
                  "modelType": "User",
                  "participants": [
                    userPlannerProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index].author?.sId // connected profile id
                  ]
                };
                await userPlannerProfileFeatureController.createMessageController(context: context, data: data);
              },
              text: "Message",
            ),
          ),


          SpaceHelperWidget.h(16.w(context)),

          Expanded(
            child: ButtonHelperWidget.customButtonWidgetAdventPro(
              context: context,
              onPressed: () async {
                Get.off(()=>UserPlannerWiseServiceDetailsView(
                  isWishlist: isWishlist,
                  isCategory: isCategory,
                  isPlanner: isPlanner,
                  isRecommended: isRecommended,
                  plannerWiseServiceId: data?.sId ?? "",
                  isHome: isHome,
                  isSearchBar: isSearchBar,
                  serviceId: serviceId,
                  userId: userId,
                  categoryId: categoryId,
                ),preventDuplicates: false);
              },
              text: "View Details",
              textColor: ColorUtils.blue96,
              backgroundColor: ColorUtils.blue206,
            ),
          ),

        ],
      ),
    ));
  }
}
