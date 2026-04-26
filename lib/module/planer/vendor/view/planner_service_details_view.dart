import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerServiceDetailsView extends StatelessWidget {
  const PlannerServiceDetailsView({
    super.key,
    required this.serviceId,
    required this.isHome,
    required this.isCategory,
    required this.isSearch,
    required this.categoryId,
  });
  final bool isSearch;
  final bool isCategory;
  final bool isHome;
  final String serviceId;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final PlannerServiceDetailsController plannerServiceDetailsController = Get.put(PlannerServiceDetailsController(serviceId: serviceId,context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        if(isHome == true) {
          Get.off(()=>DashboardPlannerView(index: 2),preventDuplicates: false);
        } else {
          Get.off(()=>PlannerCategoryWiseServiceView(categoryId: categoryId),preventDuplicates: false);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(() {
            return Container(
              height: 930.h(context),
              width: 428.w(context),
              decoration: BoxDecoration(
                color: ColorUtils.white255,
              ),
              child: plannerServiceDetailsController.isLoading.value == true ?
              LoadingHelperWidget.loadingHelperWidget(
                context: context,
                height: 930.h(context),
              ) :
              CustomScrollView(
                slivers: [



                  AuthAppBarHelperWidget(
                    onBackPressed: () async {
                      if(isHome == true) {
                        Get.off(()=>DashboardPlannerView(index: 2),preventDuplicates: false);
                      } else {
                        Get.off(()=>PlannerCategoryWiseServiceView(categoryId: categoryId),preventDuplicates: false);
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
                                  plannerServiceDetailsController: plannerServiceDetailsController,
                                  context: context,
                                  imageUrl: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.images?.isEmpty == true ?
                                  [] : plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.images,
                                ),
                                SpaceHelperWidget.v(12.h(context)),
                                title(title: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data!.title,context: context),
                                SpaceHelperWidget.v(12.h(context)),
                                description(text: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data!.subtitle,context: context),
                                SpaceHelperWidget.v(20.h(context)),
                                buildSections(serviceDetails: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data!.description,context: context),
                                SpaceHelperWidget.v(20.h(context)),
                              ],
                            ),
                          ),


                          if(plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.serviceAreas?.isEmpty == true || plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.serviceAreas == null) ...[
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
                                      children: List.generate(plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data!.serviceAreas!.length, (index) {
                                        return serviceChip(text: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data!.serviceAreas![index].name, context: context);
                                      }),
                                    ),
                                  ),



                                ],
                              ),
                            ),
                          ],





                          vendorCard(plannerServiceDetailsController: plannerServiceDetailsController,context: context),

                          SpaceHelperWidget.v(32.h(context)),

                          reviews(context: context, plannerServiceDetailsController: plannerServiceDetailsController),

                          SpaceHelperWidget.v(32.h(context)),

                          plannerServiceDetailsController.isCreate.value == true ?
                          LoadingHelperWidget.loadingHelperWidget(context: context) :
                          ButtonHelperWidget.customButtonWidgetAdventPro(
                            context: context,
                            onPressed: () async {
                              plannerServiceDetailsController.isCreate.value = true;
                              Map<String,dynamic> data = {
                                "modelType": "User",
                                "participants": [
                                  plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.author?.sId // connected profile id
                                ]
                              };
                              await plannerServiceDetailsController.createMessageController(context: context, data: data);


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

  /// HEADER
  Widget header({
    required PlannerServiceDetailsController plannerServiceDetailsController,
    required List? imageUrl,
    required BuildContext context,
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
                  controller: plannerServiceDetailsController.pageController.value,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    plannerServiceDetailsController.changeIndex(value);
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
                if(plannerServiceDetailsController.index.value == index) {
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
  Widget title({required String title,required BuildContext context}) {
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
  Widget buildSections({required String serviceDetails, required BuildContext context}) {
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

          HtmlWidget(serviceDetails),


          // ...sections.map((s) => Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Row(
          //       children: [
          //         ImageHelperWidget.assetImageWidget(
          //           context: context,
          //           height: 24.h(context),
          //           width: 24.w(context),
          //           imageString: ImageUtils.grayRightSignImage,
          //         ),
          //
          //         SpaceHelperWidget.h(10.w(context)),
          //
          //
          //         TextHelperClass.headingTextWithoutWidth(
          //           context: context,
          //           alignment: Alignment.centerLeft,
          //           textAlign: TextAlign.start,
          //           fontSize: 20,
          //           fontWeight: FontWeight.w600,
          //           textColor: ColorUtils.black48,
          //           text: s.title,
          //         ),
          //
          //       ],
          //     ),
          //     SpaceHelperWidget.v(16.h(context)),
          //
          //
          //     ...s.items.map((text) => Padding(
          //       padding: EdgeInsets.only(left: 32.lpm(context), bottom: 8.bpm(context)),
          //       child: Row(
          //         children: [
          //           Icon(Icons.circle, size: 10.r(context), color: ColorUtils.blue96),
          //
          //           SpaceHelperWidget.h(10.w(context)),
          //
          //           Expanded(
          //             child: TextHelperClass.headingTextWithoutWidth(
          //               context: context,
          //               alignment: Alignment.centerLeft,
          //               textAlign: TextAlign.start,
          //               fontSize: 16,
          //               fontWeight: FontWeight.w500,
          //               textColor: ColorUtils.black80,
          //               text: text,
          //             ),
          //           ),
          //         ],
          //       ),
          //     )),
          //   ],
          // ),),
        ],
      ),
    );
  }

  /// VENDOR CARD DYNAMIC
  Widget vendorCard({
    required PlannerServiceDetailsController plannerServiceDetailsController,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r(context)),
        color: ColorUtils.white249,
      ),
      child: TextButton(
        onPressed: () async {
          Get.off(()=>PlannerVendorProfileView(
            serviceId: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.sId ?? "",
            userId: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.author?.sId ?? "",
            isCategory: isCategory,
            isHome: isHome,
            isSearch: isSearch,
            categoryId: categoryId,
          ), preventDuplicates: false);
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
                  imageAsset: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.author?.photoUrl == null ? ImageUtils.noImage : null,
                  imageUrl: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.author?.photoUrl
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
                    text: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.author?.name ?? "",
                  ),
                ),

                SpaceHelperWidget.h(6.w(context)),

                if(plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.author?.isKycVerified == true)...[
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
                  ),
                ],

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
                  text: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.author?.categories?.first ?? "",
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
                          text: '${plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.author?.avgRating} ',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black10,
                        ).toTextSpan(),
                        CustomTextSpan(
                          text: '(${plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.author?.ratingCount} reviews)',
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
                    text: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.author?.address ?? "",
                  ),
                ),


              ],
            ),

            SpaceHelperWidget.v(14.h(context)),

            TextHelperClass.headingTextWithoutWidth(
              context: context,
              alignment: Alignment.centerLeft,
              textAlign: TextAlign.start,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              textColor: ColorUtils.black95,
              text: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.author?.bio ?? "",
            ),

          ],
        ),
      ),
    );
  }

  /// REVIEWS DYNAMIC
  Widget reviews({
    required PlannerServiceDetailsController plannerServiceDetailsController,
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
                text: 'Reviews from Planner',
              ),
            ),

            SpaceHelperWidget.h(12.w(context)),

            if(plannerServiceDetailsController.getAllUserReviewResponseModel.value.data?.reviews?.isNotEmpty == true)...[
              ButtonHelperWidget.customButtonWidget(
                context: context,
                onPressed: () async {
                  Get.off(()=>PlannerVendorProfileView(
                    serviceId: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.sId ?? "",
                    userId: plannerServiceDetailsController.getVendorServiceDetailsResponseModel.value.data?.author?.sId ?? "",
                    isSearch: isSearch,
                    isCategory: isCategory,
                    isHome: isHome,
                    categoryId: categoryId,
                  ), preventDuplicates: false);
                },
                text: "See All",
                padding: EdgeInsets.only(left: 14.5.lpm(context)),
                alignment: Alignment.center,
                textColor: ColorUtils.orange119,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                backgroundColor: Colors.transparent,
              ),
            ] else...[
              SizedBox.shrink(),
            ]


          ],
        ),

        SpaceHelperWidget.v(32.h(context)),


        ...plannerServiceDetailsController.getAllUserReviewResponseModel.value.data!.reviews!.map((r) => reviewItem(r: r,context: context)).toList(),
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
                    text: r.review ?? "",
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