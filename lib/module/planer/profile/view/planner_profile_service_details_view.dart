import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:url_launcher/url_launcher.dart';


class PlannerProfileServiceDetailsView extends StatelessWidget {
  PlannerProfileServiceDetailsView({super.key,required this.serviceId});

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    final PlannerProfileServiceDetailsController plannerProfileServiceDetailsController = Get.put(PlannerProfileServiceDetailsController(context: context, serviceId: serviceId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>PlannerProfileServiceView(),preventDuplicates: false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(()=>Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white255,
            ),
            child: plannerProfileServiceDetailsController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>PlannerProfileServiceView(),preventDuplicates: false);
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
                                imageUrl: plannerProfileServiceDetailsController.plannerGetServiceDetailsResponseModel.value.data!.images!.first,
                              ),
                              SpaceHelperWidget.v(12.h(context)),
                              title(
                                title: plannerProfileServiceDetailsController.plannerGetServiceDetailsResponseModel.value.data?.title ?? "",
                                context: context,
                              ),
                              SpaceHelperWidget.v(12.h(context)),
                              description(
                                text: plannerProfileServiceDetailsController.plannerGetServiceDetailsResponseModel.value.data?.subtitle ?? "",
                                context: context,
                              ),
                              SpaceHelperWidget.v(20.h(context)),
                              buildSections(
                                description: plannerProfileServiceDetailsController.plannerGetServiceDetailsResponseModel.value.data?.description ?? "",
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
                                value: plannerProfileServiceDetailsController.plannerGetServiceDetailsResponseModel.value.data?.category?.title ?? "",
                                context: context,
                              ),
                              rowItem(
                                title: "Price: ",
                                value: "${plannerProfileServiceDetailsController.plannerGetServiceDetailsResponseModel.value.data?.price} / ${plannerProfileServiceDetailsController.plannerGetServiceDetailsResponseModel.value.data?.priceType}" ,
                                context: context,
                              ),
                              InkWell(
                                onTap: () async {
                                  if (await canLaunchUrl(Uri.parse(plannerProfileServiceDetailsController.plannerGetServiceDetailsResponseModel.value.data?.locationUrl))) {
                                    await launchUrl(Uri.parse(plannerProfileServiceDetailsController.plannerGetServiceDetailsResponseModel.value.data?.locationUrl), mode: LaunchMode.externalApplication);
                                  }
                                },
                                child: rowItem(
                                  title: "Location: ",
                                  value: plannerProfileServiceDetailsController.plannerGetServiceDetailsResponseModel.value.data?.address ?? "",
                                  context: context,
                                ),
                              ),
                            ],
                          ),
                        ),


                        reviews(context: context, reviews: plannerProfileServiceDetailsController.service.value.reviews,),

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

  /// HEADER
  Widget header({required String imageUrl,required BuildContext context}) {
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
          child: ImageHelperWidget.assetImageWidget(
            context: context,
            height: 26.h(context),
            width: 26.w(context),
            imageString: ImageUtils.serviceLoveImage,
          ),
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
  Widget reviews({required List reviews,required BuildContext context}) {
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
                text: 'Reviews from User',
              ),
            ),

            SpaceHelperWidget.h(12.w(context)),

            ButtonHelperWidget.customButtonWidget(
              context: context,
              onPressed: () async {},
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


        ...reviews.map((r) => reviewItem(r: r,context: context)).toList(),
      ],
    );
  }

  Widget reviewItem({required dynamic r,required BuildContext context}) {
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
              imageAsset: ImageUtils.noImage,
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
                    text: r.userName,
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
                        text: r.rating.toString(),
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
                    text: r.comment,
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

  Widget ratingBarWidget({required dynamic r, required BuildContext context}) {
    int fullStars = r.rating.floor();
    double fractional = r.rating - fullStars;
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
