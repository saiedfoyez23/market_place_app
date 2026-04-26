import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class VendorServiceDetailsView extends StatelessWidget {
  const VendorServiceDetailsView({super.key,required this.serviceId});

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    final VendorServiceDetailsController vendorServiceDetailsController = Get.put(VendorServiceDetailsController(context: context,serviceId: serviceId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardVendorView(index: 1),preventDuplicates: false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(()=>Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white255,
            ),
            child: vendorServiceDetailsController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardVendorView(index: 1),preventDuplicates: false);
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
                          margin: EdgeInsets.only(top: 20.tpm(context),bottom: 32.bpm(context)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r(context)),
                            color: ColorUtils.white249,
                          ),
                          child: Column(
                            children: [

                              header(
                                vendorServiceDetailsController: vendorServiceDetailsController,
                                context: context,
                                imageUrl: vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.images?.isEmpty == true ?
                                [] : vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.images,
                              ),

                              SpaceHelperWidget.v(12.h(context)),
                              title(
                                title: vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.title ?? "",
                                context: context,
                              ),
                              SpaceHelperWidget.v(12.h(context)),
                              description(
                                text: vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.subtitle ?? "",
                                context: context,
                              ),
                              SpaceHelperWidget.v(20.h(context)),
                              buildSections(
                                description: vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.description ?? "",
                                context: context,
                              ),
                              SpaceHelperWidget.v(20.h(context)),
                            ],
                          ),
                        ),


                        Container(
                          margin: EdgeInsets.only(bottom: 20.bpm(context)),
                          padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 12.hpm(context)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r(context)),
                            color: ColorUtils.white249,
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
                                text: "Service Information: ",
                              ),


                              SpaceHelperWidget.v(10.h(context)),

                              rowItem(
                                title: "Category: ",
                                value: vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.category?.title ?? "",
                                context: context,
                              ),
                              rowItem(
                                title: "Price: ",
                                value: "R${vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.price} / ${vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.priceType}" ,
                                context: context,
                              ),
                            ],
                          ),
                        ),


                        if(vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.serviceAreas == null || vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.serviceAreas?.isEmpty == true)...[
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
                                    children: List.generate(vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data!.serviceAreas!.length, (index) {
                                      return serviceChip(text: vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data!.serviceAreas![index].name, context: context);
                                    }),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ],


                        reviews(
                          context: context,
                          reviews: vendorServiceDetailsController.service.value.reviews,
                          vendorServiceDetailsController: vendorServiceDetailsController
                        ),

                        SpaceHelperWidget.v(32.h(context)),


                      ],
                    ),
                  ),
                )

              ],
            ),
          )),
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
    required List? imageUrl,
    required BuildContext context,
    required VendorServiceDetailsController vendorServiceDetailsController
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
                  controller: vendorServiceDetailsController.pageController.value,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    vendorServiceDetailsController.changeIndex(value);
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
                if(vendorServiceDetailsController.index.value == index) {
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
        vendorServiceDetailsController.vendorMyProfileDetailsResponseModel.value.data?.type == "pro" && vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.status == "active" ?
        Positioned(
          top: 12.h(context),
          right: 12.w(context),
          child: InkWell(
            onTap: () async {
              await vendorServiceDetailsController.addFeaturedController(context: context, serviceId: vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.sId);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w(context),
                vertical: 7.5.h(context),
              ),
              decoration: BoxDecoration(
                color: ColorUtils.white255,
                borderRadius: BorderRadius.circular(6.r(context)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [


                  ImageHelperWidget.assetImageWidget(
                    context: context,
                    height: 16.h(context),
                    width: 16.w(context),
                    imageString: vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.isFeatured == true ?
                    ImageUtils.isFevorateImage : ImageUtils.isUnfevorateImage,
                  ),

                  SpaceHelperWidget.h(4.w(context)),


                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textColor: ColorUtils.black96,
                    text: vendorServiceDetailsController.vendorGetServiceDetailsResponseModel.value.data?.isFeatured == true ?
                    "Remove Featured" : "Add Featured",
                  ),
                ],
              ),
            ),
          ),
        ) : SizedBox.shrink()
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

          HtmlWidget(
            description,
          ),

        ],
      ),
    );
  }


  Widget rowItem({required String title,required String value,required BuildContext context}) {
    return Column(
      children: [

        Row(
          children: [

            TextHelperClass.headingTextWithoutWidth(
              context: context,
              alignment: Alignment.centerLeft,
              textAlign: TextAlign.start,
              fontSize: 17,
              fontWeight: FontWeight.w400,
              textColor: ColorUtils.black48,
              text: title,
            ),

            SpaceHelperWidget.h(20.w(context)),

            Expanded(
              child: TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerRight,
                textAlign: TextAlign.right,
                fontSize: 17,
                fontWeight: FontWeight.w600,
                textColor: ColorUtils.black48,
                text: value,
              ),
            ),
          ],
        ),



        SpaceHelperWidget.v(3.h(context)),

        Divider(
          thickness: 1,
          color: ColorUtils.gray194,
        ),

        SpaceHelperWidget.v(7.h(context)),




      ],
    );
  }

  /// REVIEWS DYNAMIC
  Widget reviews({
    required List reviews,
    required VendorServiceDetailsController vendorServiceDetailsController,
    required BuildContext context,}) {
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

            // ButtonHelperWidget.customButtonWidget(
            //   context: context,
            //   onPressed: () async {
            //     Get.off(()=>DashboardVendorView(index: 5),preventDuplicates: false);
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


        ...vendorServiceDetailsController.getAllUserReviewResponseModel.value.data!.reviews!.map((r) => reviewItem(r: r,context: context)).toList(),
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
              imageUrl: r.user?.photoUrl
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
