import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerServiceDetailsView extends StatelessWidget {
  PlannerServiceDetailsView({super.key});


  final PlannerServiceDetailsController plannerServiceDetailsController = Get.put(PlannerServiceDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          final data = plannerServiceDetailsController.service.value;
          return Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white255,
            ),
            child: CustomScrollView(
              slivers: [



                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardPlannerView(index: 2),preventDuplicates: false);
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
                              header(context: context,imageUrl: data.imageUrl),
                              SpaceHelperWidget.v(12.h(context)),
                              title(title: data.title,context: context),
                              SpaceHelperWidget.v(12.h(context)),
                              description(text: data.description,context: context),
                              SpaceHelperWidget.v(20.h(context)),
                              buildSections(sections: data.sections,context: context),
                              SpaceHelperWidget.v(20.h(context)),
                            ],
                          ),
                        ),


                        vendorCard(v: data.vendor,context: context),

                        SpaceHelperWidget.v(32.h(context)),

                        reviews(context: context, reviews: data.reviews,),

                        SpaceHelperWidget.v(32.h(context)),


                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            Get.off(()=>DashboardPlannerView(index: 3),preventDuplicates: false);
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
          child: Image.asset(
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

  /// DYNAMIC SECTION LIST
  Widget buildSections({required List sections, required BuildContext context}) {
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


          ...sections.map((s) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ImageHelperWidget.assetImageWidget(
                    context: context,
                    height: 24.h(context),
                    width: 24.w(context),
                    imageString: ImageUtils.grayRightSignImage,
                  ),

                  SpaceHelperWidget.h(10.w(context)),


                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    textColor: ColorUtils.black48,
                    text: s.title,
                  ),

                ],
              ),
              SpaceHelperWidget.v(16.h(context)),


              ...s.items.map((text) => Padding(
                padding: EdgeInsets.only(left: 32.lpm(context), bottom: 8.bpm(context)),
                child: Row(
                  children: [
                    Icon(Icons.circle, size: 10.r(context), color: ColorUtils.blue96),

                    SpaceHelperWidget.h(10.w(context)),

                    Expanded(
                      child: TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        textAlign: TextAlign.start,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black80,
                        text: text,
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),),
        ],
      ),
    );
  }

  /// VENDOR CARD DYNAMIC
  Widget vendorCard({required dynamic v,required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r(context)),
        color: ColorUtils.white249,
      ),
      child: TextButton(
        onPressed: () async {
          Get.off(()=>PlannerVendorProfileView(),preventDuplicates: false);
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
                  imageAsset: ImageUtils.noImage,
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
                    text: v.name,
                  ),
                ),

                SpaceHelperWidget.h(6.w(context)),

                if(v.verified)...[
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
                  text: v.category,
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
                          text: '${4.7} ',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black10,
                        ).toTextSpan(),
                        CustomTextSpan(
                          text: '(${320} reviews)',
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


                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  textAlign: TextAlign.start,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black94,
                  text: v.location,
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
              text: v.about,
            ),

          ],
        ),
      ),
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
                text: 'Reviews from Planer',
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