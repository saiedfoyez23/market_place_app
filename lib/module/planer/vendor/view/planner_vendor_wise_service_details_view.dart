import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerVendorWiseServiceDetailsView extends StatelessWidget {
  const PlannerVendorWiseServiceDetailsView({
    super.key,
    required this.vendorWiseServiceId,
    required this.serviceId,
    required this.userId,
    required this.isSearch,
    required this.isHome,
    required this.isCategory,
    required this.categoryId,
  });

  final String vendorWiseServiceId;
  final String serviceId;
  final String userId;
  final bool isSearch;
  final bool isCategory;
  final bool isHome;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final PlannerVendorWiseServiceDetailsController plannerVendorWiseServiceDetailsController = Get.put(PlannerVendorWiseServiceDetailsController(
        context: context,serviceId: vendorWiseServiceId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>PlannerVendorProfileView(
          serviceId: serviceId,
          userId: userId,
          isSearch: isSearch,
          isCategory: isCategory,
          isHome: isHome,
          categoryId: categoryId,
        ),preventDuplicates: false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(() {
            final data = plannerVendorWiseServiceDetailsController.getServiceDetailsResponseModel.value;
            return Container(
              height: 930.h(context),
              width: 428.w(context),
              decoration: BoxDecoration(
                color: ColorUtils.white255,
              ),
              child: plannerVendorWiseServiceDetailsController.isLoading.value == true ?
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
                        isHome: isHome,
                        isSearch: isSearch,
                        isCategory: isCategory,
                        categoryId: categoryId,
                      ),preventDuplicates: false);
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
                                  plannerVendorWiseServiceDetailsController: plannerVendorWiseServiceDetailsController,
                                  context: context,
                                  imageUrl:plannerVendorWiseServiceDetailsController.getServiceDetailsResponseModel.value.data?.images?.isEmpty == true ?
                                  [] : plannerVendorWiseServiceDetailsController.getServiceDetailsResponseModel.value.data?.images,
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


                          if(plannerVendorWiseServiceDetailsController.getServiceDetailsResponseModel.value.data?.serviceAreas?.isEmpty == true || plannerVendorWiseServiceDetailsController.getServiceDetailsResponseModel.value.data?.serviceAreas == null) ...[
                            SizedBox.shrink(),
                          ] else...[
                            Container(
                              margin: EdgeInsets.only(bottom: 20.bpm(context)),
                              padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 12.hpm(context)),
                              decoration: BoxDecoration(
                                color: ColorUtils.white249,
                                border: Border.all(color: ColorUtils.white215,width: .5),
                                borderRadius: BorderRadius.circular(12.r(context)),
                              ),
                              child: Column(
                                children: [

                                  TextHelperClass.headingTextWithoutWidth(
                                    context: context,
                                    alignment: Alignment.centerLeft,
                                    textAlign: TextAlign.start,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    textColor: ColorUtils.black64,
                                    text: "Services Area ",
                                  ),


                                  SpaceHelperWidget.v(10.h(context)),


                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      runAlignment: WrapAlignment.start,
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: List.generate(plannerVendorWiseServiceDetailsController.getServiceDetailsResponseModel.value.data!.serviceAreas!.length, (index) {
                                        return serviceChip(text:plannerVendorWiseServiceDetailsController.getServiceDetailsResponseModel.value.data!.serviceAreas![index].name, context: context);
                                      }),
                                    ),
                                  ),



                                ],
                              ),
                            ),
                          ],


                          reviews(
                            context: context,
                            plannerVendorWiseServiceDetailsController: plannerVendorWiseServiceDetailsController,
                          ),

                          SpaceHelperWidget.v(32.h(context)),

                          plannerVendorWiseServiceDetailsController.isCreate.value == true ?
                          LoadingHelperWidget.loadingHelperWidget(context: context) :
                          ButtonHelperWidget.customButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              plannerVendorWiseServiceDetailsController.isCreate.value = true;
                              Map<String,dynamic> data = {
                                "modelType": "User",
                                "participants": [
                                  plannerVendorWiseServiceDetailsController.getServiceDetailsResponseModel.value.data?.author?.sId // connected profile id
                                ]
                              };
                              await plannerVendorWiseServiceDetailsController.createMessageController(context: context, data: data);


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


  Widget serviceChip({required String text,required BuildContext context}) {
    return IntrinsicWidth(
      child: TextHelperClass.headingTextWithoutWidth(
        context: context,
        alignment: Alignment.centerLeft,
        containerColor: ColorUtils.blue231,
        padding: EdgeInsets.symmetric(vertical: 11.vpm(context),horizontal: 11.h(context)),
        textAlign: TextAlign.start,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        borderRadius: BorderRadius.circular(6.r(context)),
        textColor: ColorUtils.blue96,
        text: text,
      ),
    );
  }


  Widget header({
    required List? imageUrl,
    required BuildContext context,
    required PlannerVendorWiseServiceDetailsController plannerVendorWiseServiceDetailsController,
  }) {
    return Stack(
      children: [
        Column(
          children: [

            imageUrl?.isEmpty == true ?
            SizedBox.shrink() :
            SizedBox(
              height: 200.h(context),
              child: PageView(
                  controller: plannerVendorWiseServiceDetailsController.pageController.value,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    plannerVendorWiseServiceDetailsController.changeIndex(value);
                  },
                  children: List.generate(imageUrl!.length, (index) {
                    return ImageHelperWidget.styledImage(
                      context: context,
                      borderRadius: 12,
                      height: 172,
                      width: 428,
                      imageUrl: imageUrl[index],
                    );
                  })
              ),
            ),

            SpaceHelperWidget.v(20.h(context)),


            imageUrl?.isEmpty == true ?
            SizedBox.shrink() :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(imageUrl!.length, (index) {
                if(plannerVendorWiseServiceDetailsController.index.value == index) {
                  return Container(
                    height: 12.h(context),
                    width: 30.w(context),
                    margin: EdgeInsets.only(right: 6.rpm(context)),
                    decoration: BoxDecoration(
                      color: ColorUtils.orange119,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6.r(context)),
                    ),
                  );
                } else {
                  return Container(
                    height: 12.h(context),
                    width: 12.w(context),
                    margin: EdgeInsets.only(right: 6.rpm(context)),
                    decoration: BoxDecoration(
                      color: ColorUtils.orange213,
                      shape: BoxShape.circle,
                    ),
                  );
                }
              }),
            ),
          ],
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


  /// REVIEWS DYNAMIC
  Widget reviews({
    required PlannerVendorWiseServiceDetailsController plannerVendorWiseServiceDetailsController,
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

            // ButtonHelperWidget.customButtonWidget(
            //   context: context,
            //   onPressed: () async {
            //     Get.off(()=> UserPlannerProfileView(
            //       isWishlist: isWishlist,
            //       isPlanner: isPlanner,
            //       isCategory: isCategory,
            //       categoryId: categoryId,
            //       isRecommended: isRecommended,
            //       isHome: isHome,
            //       serviceId: serviceId,
            //       userId: userPlannerWiseServiceDetailsController.getServiceDetailsResponseModel.value.data?.author?.sId,
            //     ),preventDuplicates: false);
            //   },
            //   text: "See All",
            //   padding: EdgeInsets.only(left: 14.5.lpm(context)),
            //   alignment: Alignment.center,
            //   textColor: ColorUtils.orange119,
            //   fontWeight: FontWeight.w600,
            //   fontSize: 24,
            //   backgroundColor: Colors.transparent,
            // ),
          ],
        ),

        SpaceHelperWidget.v(32.h(context)),


        ...plannerVendorWiseServiceDetailsController.getAllUserReviewResponseModel.value.data!.reviews!.map((r) => reviewItem(r: r,context: context)).toList(),
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
