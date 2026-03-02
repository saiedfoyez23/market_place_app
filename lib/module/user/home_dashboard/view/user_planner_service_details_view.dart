import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserPlannerServiceDetailsView extends StatelessWidget {
  const UserPlannerServiceDetailsView({
    super.key,
    required this.isHome,
    required this.serviceId,
    required this.isRecommended,
    required this.isCategory,
    required this.categoryId,
    required this.isPlanner,
    required this.isWishlist,
  });

  final bool isHome;
  final bool isRecommended;
  final bool isCategory;
  final String serviceId;
  final String categoryId;
  final bool isPlanner;
  final bool isWishlist;

  @override
  Widget build(BuildContext context) {
    final UserServiceDetailsController userServiceDetailsController = Get.put(UserServiceDetailsController(
        context: context,serviceId: serviceId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        if(isHome == true) {
          Get.off(()=>DashboardUserView(index: 0),preventDuplicates: false);
        } else if(isRecommended == true) {
          Get.off(()=>UserAllRecommendedServiceView(),preventDuplicates: false);
        } else if(isCategory == true && categoryId != "") {
          Get.off(()=>UserCategoryWiseServiceView(categoryId: categoryId,),preventDuplicates: false);
        } else if (isPlanner == true) {
          Get.off(()=>UserAllPlannerServiceView(),preventDuplicates: false);
        } else if (isWishlist == true) {
          Get.off(()=>DashboardUserView(index: 3),preventDuplicates: false);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(() {
            final data = userServiceDetailsController.getServiceDetailsResponseModel.value;
            return Container(
              height: 930.h(context),
              width: 428.w(context),
              decoration: BoxDecoration(
                color: ColorUtils.white255,
              ),
              child: userServiceDetailsController.isLoading.value == true ?
              LoadingHelperWidget.loadingHelperWidget(
                context: context,
                height: 930.h(context),
              ) :
              CustomScrollView(
                slivers: [



                  AuthAppBarHelperWidget(
                    onBackPressed: () async {
                      if(isHome == true) {
                        Get.off(()=>DashboardUserView(index: 0),preventDuplicates: false);
                      } else if(isRecommended == true) {
                        Get.off(()=>UserAllRecommendedServiceView(),preventDuplicates: false);
                      } else if(isCategory == true && categoryId != "") {
                        Get.off(()=>UserCategoryWiseServiceView(categoryId: categoryId,),preventDuplicates: false);
                      } else if (isPlanner == true) {
                        Get.off(()=>UserAllPlannerServiceView(),preventDuplicates: false);
                      } else if (isWishlist == true) {
                        Get.off(()=>DashboardUserView(index: 3),preventDuplicates: false);
                      }
                    },
                    title: "Service Details",
                  ),



                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            margin: EdgeInsets.only(bottom: 32.bpm(context)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r(context)),
                              color: ColorUtils.white249,
                            ),
                            child: Column(
                              children: [
                                header(
                                  context: context,
                                  imageUrl: data.data!.images!.first,
                                  userServiceDetailsController: userServiceDetailsController,
                                ),
                                SpaceHelperWidget.v(12.h(context)),
                                title(title: data.data?.title,context: context),
                                SpaceHelperWidget.v(12.h(context)),
                                description(text: data.data?.subtitle,context: context),
                                SpaceHelperWidget.v(20.h(context)),
                                buildSections(description: data.data?.description ,context: context),
                                SpaceHelperWidget.v(20.h(context)),
                              ],
                            ),
                          ),


                          vendorCard(
                            userServiceDetailsController: userServiceDetailsController,
                            context: context,
                          ),

                          SpaceHelperWidget.v(32.h(context)),

                          reviews(
                            context: context,
                            userServiceDetailsController: userServiceDetailsController,
                          ),

                          SpaceHelperWidget.v(32.h(context)),


                          ButtonHelperWidget.customButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              Get.off(()=>DashboardUserView(index: 2),preventDuplicates: false);
                            },
                            text: "Message",
                          ),

                          SpaceHelperWidget.v(32.h(context)),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  /// HEADER
  Widget header({
    required String imageUrl,
    required BuildContext context,
    required UserServiceDetailsController userServiceDetailsController,
  }) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r(context)),
            topRight: Radius.circular(12.r(context)),
          ),
          child: Image.network(
            imageUrl,
            height: 192.h(context),
            width: 428.w(context),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 12.h(context),
          right: 12.w(context),
          child: userServiceDetailsController.getServiceDetailsResponseModel.value.data?.isFavorite != false ?
          InkWell(
            onTap: () async {
              await userServiceDetailsController.createFavoritesController(
                context: context,
                serviceId: userServiceDetailsController.getServiceDetailsResponseModel.value.data?.sId,
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
              await userServiceDetailsController.createFavoritesController(
                context: context,
                serviceId: userServiceDetailsController.getServiceDetailsResponseModel.value.data?.sId,
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

  /// TITLE
  Widget title({
    required String title,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.hpm(context)),
      child: TextHelperClass.headingTextWithoutWidth(
        context: context,
        alignment: Alignment.centerLeft,
        textAlign: TextAlign.start,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        textColor: ColorUtils.black48,
        text: title,
      ),
    );
  }

  /// DESCRIPTION
  Widget description({required String text,required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.hpm(context)),
      child: TextHelperClass.headingTextWithoutWidth(
        context: context,
        alignment: Alignment.centerLeft,
        textAlign: TextAlign.start,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        textColor: ColorUtils.black80,
        text: text,
      ),
    );
  }

  /// DYNAMIC SECTION LIST
  Widget buildSections({required String description, required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.hpm(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: "About this Service",
          ),


          SpaceHelperWidget.v(20.h(context)),


          HtmlWidget(description),
        ],
      ),
    );
  }

  /// VENDOR CARD DYNAMIC
  Widget vendorCard({
    required UserServiceDetailsController userServiceDetailsController,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r(context)),
        color: ColorUtils.white249,
      ),
      child: TextButton(
        onPressed: () async {
          Get.off(()=> UserPlannerProfileView(
            isWishlist: isWishlist,
            isPlanner: isPlanner,
            categoryId: categoryId,
            isCategory: isCategory,
            isRecommended: isRecommended,
            isHome: isHome,
            serviceId: serviceId,
            userId: userServiceDetailsController.getServiceDetailsResponseModel.value.data?.author?.sId,
          ),preventDuplicates: false);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 12.hpm(context)),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
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
                  imageAsset: userServiceDetailsController.getServiceDetailsResponseModel.value.data?.author?.photoUrl == null ? ImageUtils.noImage : null,
                  imageUrl: userServiceDetailsController.getServiceDetailsResponseModel.value.data?.author?.photoUrl,
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
                    text: userServiceDetailsController.getServiceDetailsResponseModel.value.data?.author?.name ?? "",
                  ),
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
                          text: '${userServiceDetailsController.getServiceDetailsResponseModel.value.data?.author?.avgRating ?? 0.0} ',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black10,
                        ).toTextSpan(),
                        CustomTextSpan(
                          text: '(${userServiceDetailsController.getServiceDetailsResponseModel.value.data?.author?.ratingCount ?? 0} reviews)',
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

            SpaceHelperWidget.v(14.h(context)),


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
                    text: userServiceDetailsController.getServiceDetailsResponseModel.value.data?.author?.address,
                  ),
                ),


              ],
            ),


            SpaceHelperWidget.v(16.h(context)),


            TextHelperClass.headingTextWithoutWidth(
              context: context,
              alignment: Alignment.centerLeft,
              textAlign: TextAlign.start,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              textColor: ColorUtils.black95,
              text: userServiceDetailsController.getServiceDetailsResponseModel.value.data?.author?.bio ?? "",
            ),

          ],
        ),
      ),
    );
  }

  /// REVIEWS DYNAMIC
  Widget reviews({
    required UserServiceDetailsController userServiceDetailsController,
    required BuildContext context,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Expanded(
              child: TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textColor: ColorUtils.black48,
                text: 'Reviews from Planer',
              ),
            ),

            SpaceHelperWidget.h(12.w(context)),

            ButtonHelperWidget.customButtonWidget(
              context: context,
              onPressed: () async {
                Get.off(()=> UserPlannerProfileView(
                  isWishlist: isWishlist,
                  isPlanner: isPlanner,
                  isCategory: isCategory,
                  categoryId: categoryId,
                  isRecommended: isRecommended,
                  isHome: isHome,
                  serviceId: serviceId,
                  userId: userServiceDetailsController.getServiceDetailsResponseModel.value.data?.author?.sId,
                ),preventDuplicates: false);
              },
              text: "See All",
              padding: EdgeInsets.only(left: 14.5.lpm(context)),
              alignment: Alignment.center,
              textColor: ColorUtils.orange119,
              fontWeight: FontWeight.w600,
              fontSize: 24,
              backgroundColor: Colors.transparent,
            ),
          ],
        ),

        SpaceHelperWidget.v(32.h(context)),


        ...userServiceDetailsController.getAllUserReviewResponseModel.value.data!.reviews!.map((r) => reviewItem(r: r,context: context)).toList(),
      ],
    );
  }

  Widget reviewItem({required GetAllUserReviewResponseReviews r,required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ImageHelperWidget.circleImageHelperWidget(
              width: 32.w(context),
              height: 32.h(context),
              verticalPadding: 1.vpm(context),
              horizontalPadding: 1.hpm(context),
              backgroundColor: ColorUtils.orange213,
              radius: 25.r(context),
              imageAsset: r.user?.photoUrl == null ? ImageUtils.noImage : null,
              imageUrl: r.user?.photoUrl,
            ),

            SpaceHelperWidget.h(12.w(context)),

            Expanded(
              child: Column(
                children: [

                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    textColor: ColorUtils.black48,
                    text: r.user?.name ?? "",
                  ),

                  SpaceHelperWidget.v(6.h(context)),


                  Row(
                    children: [

                      ratingBarWidget(r: r, context: context),

                      SpaceHelperWidget.h(12.w(context)),


                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        textAlign: TextAlign.start,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black61,
                        text: r.overallRating.toString(),
                      ),
                    ],
                  ),

                  SpaceHelperWidget.v(6.h(context)),


                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    textColor: ColorUtils.black95,
                    text: r.review,
                  ),


                ],
              ),
            ),


          ],
        ),
        SpaceHelperWidget.v(14.h(context)),
        Divider(color: ColorUtils.white210,),
        SpaceHelperWidget.v(14.h(context)),
      ],
    );
  }

  Widget ratingBarWidget({required GetAllUserReviewResponseReviews r, required BuildContext context}) {
    int fullStars = r.overallRating.floor();
    num fractional = r.overallRating - fullStars;
    bool showHalf = fractional > 0.0; // Show half star if there's any fraction

    return Row(
      children: [
        ...List.generate(fullStars, (index) => Icon(
          Icons.star,
          color: ColorUtils.yellow199,
          size: 20.r(context),
        )),
        if (showHalf)
          Icon(
            Icons.star_half,
            color: ColorUtils.yellow199,
            size: 20.r(context),
          ),
        ...List.generate(5 - fullStars - (showHalf ? 1 : 0), (index) => Icon(
          Icons.star_border,
          color: ColorUtils.yellow199,
          size: 20.r(context),
        )),
      ],
    );
  }
}
