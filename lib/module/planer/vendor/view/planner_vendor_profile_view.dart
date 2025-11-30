import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerVendorProfileView extends StatelessWidget {
  PlannerVendorProfileView({super.key});

  final PlannerVendorProfileController plannerVendorProfileController = Get.put(PlannerVendorProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: CustomScrollView(
            slivers: [


              AuthAppBarHelperWidget(
                onBackPressed: () async {
                  Get.off(()=>PlannerServiceDetailsView(),preventDuplicates: false);
                },
                title: "Vendor Information",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SizedBox(
                        width: 428.w(context),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [


                            ImageHelperWidget.styledImage(
                              context: context,
                              imageAsset: ImageUtils.coverImage,
                              height: 250.h(context),
                              width: 428.w(context),
                            ),

                            // Profile Image
                            Padding(
                              padding: EdgeInsets.only(top: 110.h(context)),
                              child: ImageHelperWidget.circleImageHelperWidget(
                                width: 150.w(context),
                                height: 150.h(context),
                                verticalPadding: 4.5.vpm(context),
                                horizontalPadding: 4.5.vpm(context),
                                backgroundColor: ColorUtils.orange213,
                                radius: 75.r(context),
                                imageAsset: ImageUtils.noImage,
                              ),
                            ),
                          ],
                        ),
                      ),


                      SpaceHelperWidget.v(20.h(context)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            textAlign: TextAlign.start,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            textColor: ColorUtils.black48,
                            text: "Bella Photography Studio",
                          ),

                          SpaceHelperWidget.h(12.w(context)),

                          ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 25.h(context),
                            width: 25.w(context),
                            imageString: ImageUtils.verifyImage,
                          ),

                          SpaceHelperWidget.h(6.w(context)),

                        ],
                      ),


                      SpaceHelperWidget.v(20.h(context)),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [

                              ImageHelperWidget.assetImageWidget(
                                  context: context,
                                  height: 20.h(context),
                                  width: 20.w(context),
                                  imageString: ImageUtils.vendorLocationImage
                              ),

                              SpaceHelperWidget.h(12.w(context)),

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                textAlign: TextAlign.start,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black48,
                                text: "Mohakhali, Dhaka",
                              ),


                            ],
                          ),


                          SpaceHelperWidget.h(12.w(context)),



                          Row(
                            children: [
                              Icon(Icons.star, color: ColorUtils.yellow199, size: 20.r(context)),

                              SpaceHelperWidget.h(12.w(context)),

                              RichTextHelperWidget.headingWithoutWidthRichText(
                                context: context,
                                alignment: Alignment.centerLeft,
                                textSpans: [
                                  CustomTextSpan(
                                    text: '${plannerVendorProfileController.rating} ',
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


                      SpaceHelperWidget.v(20.h(context)),

                      buildTabs(context: context),

                      SpaceHelperWidget.v(20.h(context)),


                      plannerVendorProfileController.selectedTab.value == PlannerVendorProfileTab.overview ?
                      overviewWidget(context: context):
                      reviewWidget(context: context),


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
              )



            ],
          ),
        ),
      )),
    );
  }

  /// ------------------------------
  /// TAB BAR
  /// ------------------------------
  Widget buildTabs({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(child: tabItem(status: PlannerVendorProfileTab.overview,title: "Overview",context: context)),
        Expanded(child: tabItem(status: PlannerVendorProfileTab.reviews,title: "Reviews",context: context)),
      ],
    );
  }

  Widget tabItem({required String title,required PlannerVendorProfileTab status,required BuildContext context}) {
    bool isSelected = plannerVendorProfileController.selectedTab.value == status;
    return InkWell(
      onTap: () {
        plannerVendorProfileController.changeTab(status);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.center,
            textAlign: TextAlign.center,
            fontSize: 17,
            fontWeight: isSelected == true ? FontWeight.w600 : FontWeight.w500,
            textColor: isSelected == true ? ColorUtils.orange119 : ColorUtils.black64,
            text: title,
          ),
          SpaceHelperWidget.v(4.h(context)),
          if (isSelected)
            Container(
              height: 3.h(context),
              color: ColorUtils.orange119,
            )
        ],
      ),
    );
  }

  Widget overviewWidget({required BuildContext context}) {
    return Column(
      children: [

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
                text: "About:",
              ),


              SpaceHelperWidget.v(10.h(context)),

              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                textAlign: TextAlign.start,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textColor: ColorUtils.black95,
                text: "I have a 4 years old golden retriever. I’ve taken good care of him since he was 8 weeks old. He’s very playful and super friendly to any dogs and people. My dog is particularly adept at fostering positive interactions, demonstrating a calm and considerate demeanor with small dogs",
              ),


            ],
          ),
        ),


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
                text: "Contact Information: ",
              ),


              SpaceHelperWidget.v(10.h(context)),

              rowItem(title: "Phone: ",value: "+880213 5646",context: context),
              rowItem(title: "Email: ",value: "yourmail@.com",context: context),
              rowItem(title: "Location",value: "Mohakhali, Dhaka",context: context),


            ],
          ),
        ),


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
                text: "Services:  ",
              ),


              SpaceHelperWidget.v(10.h(context)),


              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  serviceChip(text: "Wedding Photography",context: context),
                  serviceChip(text: "Event Conerage",context: context),
                  serviceChip(text: "Photo Editing",context: context),
                  serviceChip(text: "Portrait Sessions",context: context),
                  serviceChip(text: "Albums & Prints",context: context),
                ],
              ),








            ],
          ),
        ),


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
                text: 'Vendor Services',
              ),
            ),

            SpaceHelperWidget.h(12.w(context)),

            ButtonHelperWidget.customButtonWidget(
              context: context,
              onPressed: () async {},
              text: "See All",
              padding: EdgeInsets.only(left: 14.5.lpm(context)),
              alignment: Alignment.center,
              textColor: ColorUtils.blue96,
              fontWeight: FontWeight.w600,
              fontSize: 24,
              backgroundColor: Colors.transparent,
            ),
          ],
        ),

        SpaceHelperWidget.v(10.h(context)),

        Row(
          children: [
            Expanded(child: buildPlannerCard(service: plannerVendorProfileController.plannerServices[0], context: context)),
            SpaceHelperWidget.h(12.w(context)),
            Expanded(child: buildPlannerCard(service: plannerVendorProfileController.plannerServices[1], context: context)),
          ],
        ),


        SpaceHelperWidget.v(20.h(context)),


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
                text: 'Portfolio',
              ),
            ),

            SpaceHelperWidget.h(12.w(context)),

            ButtonHelperWidget.customButtonWidget(
              context: context,
              onPressed: () async {},
              text: "See All",
              padding: EdgeInsets.only(left: 14.5.lpm(context)),
              alignment: Alignment.center,
              textColor: ColorUtils.blue96,
              fontWeight: FontWeight.w600,
              fontSize: 24,
              backgroundColor: Colors.transparent,
            ),
          ],
        ),

        SpaceHelperWidget.v(20.h(context)),

        Row(
          children: [
            Expanded(
              child: ImageHelperWidget.assetImageWidget(
                context: context,
                height: 125.h(context),
                width: 125.w(context),
                imageString: ImageUtils.portfolioImage1,
              ),
            ),
            SpaceHelperWidget.h(4.w(context)),
            Expanded(
              child: ImageHelperWidget.assetImageWidget(
                context: context,
                height: 125.h(context),
                width: 125.w(context),
                imageString: ImageUtils.portfolioImage2,
              ),
            ),
            SpaceHelperWidget.h(4.w(context)),
            Expanded(
              child: ImageHelperWidget.assetImageWidget(
                context: context,
                height: 125.h(context),
                width: 125.w(context),
                imageString: ImageUtils.portfolioImage3,
              ),
            ),
          ],
        ),

        SpaceHelperWidget.v(30.h(context)),



      ],
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

  Widget buildPlannerCard({required Map<String, dynamic> service,required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.vpm(context),horizontal: 8.hpm(context)),
      decoration: BoxDecoration(
          color: ColorUtils.white255,
          borderRadius: BorderRadius.circular(12.r(context)),
          border: Border.all(color: ColorUtils.white221)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r(context)),
            child: Container(
              height: 170.w(context),
              color: Colors.transparent,
              child: Image.asset(service['imageUrl'], fit: BoxFit.cover),
            ),
          ),


          SpaceHelperWidget.v(12.h(context)),


          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.center,
            textAlign: TextAlign.center,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black64,
            text: service['name'] ?? '',
          ),


          SpaceHelperWidget.v(12.h(context)),

          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 18.r(context)),
              SpaceHelperWidget.h(6.w(context)),
              Expanded(
                child: RichTextHelperWidget.headingRichText(
                  context: context,
                  alignment: Alignment.centerLeft,
                  textSpans: [
                    CustomTextSpan(
                        text: '${service['rating'].toString()} ',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black10
                    ).toTextSpan(),
                    CustomTextSpan(
                      text: '(${service['reviews']} review)',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorUtils.black94,
                    ).toTextSpan(),
                  ],
                ),
              ),
            ],
          ),

          SpaceHelperWidget.v(12.h(context)),


          ButtonHelperWidget.customButtonWidgetAdventPro(
            context: context,
            backgroundColor: ColorUtils.blue206,
            textColor: ColorUtils.blue96,
            height: 45.h(context),
            borderRadius: 10,
            padding: EdgeInsets.symmetric(vertical: 2.5.vpm(context)),
            onPressed: () async {},
            text:'View Details',
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
            Expanded(
              child: TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                textAlign: TextAlign.start,
                fontSize: 17,
                fontWeight: FontWeight.w400,
                textColor: ColorUtils.black48,
                text: title,
              ),
            ),

            SpaceHelperWidget.h(10.w(context)),

            Expanded(
              child: TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerRight,
                textAlign: TextAlign.start,
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

  Widget reviewWidget({required BuildContext context}) {
    return Column(
      children: [

        TextHelperClass.headingTextWithoutWidth(
          context: context,
          alignment: Alignment.centerLeft,
          textAlign: TextAlign.start,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          textColor: ColorUtils.black48,
          text: "Reviews from Planner",
        ),


        SpaceHelperWidget.v(10.h(context)),

        TextHelperClass.headingTextWithoutWidth(
          context: context,
          alignment: Alignment.centerLeft,
          textAlign: TextAlign.start,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          textColor: ColorUtils.black95,
          text: "Ratings and reviews are verified and are from people who use the same type of device that you use",
        ),


        SpaceHelperWidget.v(24.h(context)),


        Row(
          children: [

            Column(
              children: [

                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.center,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  textColor: ColorUtils.black64,
                  text: '${plannerVendorProfileController.rating.value}',
                ),

                SpaceHelperWidget.v(10.h(context)),

                Obx(() {
                  int fullStars = plannerVendorProfileController.rating.value.floor();
                  double fractional = plannerVendorProfileController.rating.value - fullStars;
                  bool showHalf = fractional > 0.0; // Show half star if there's any fraction

                  return Row(
                    children: [
                      ...List.generate(fullStars, (index) => Icon(
                        Icons.star,
                        color: ColorUtils.yellow199,
                        size: 16.r(context),
                      )),
                      if (showHalf)
                        Icon(
                          Icons.star_half,
                          color: ColorUtils.yellow199,
                          size: 16.r(context),
                        ),
                      ...List.generate(5 - fullStars - (showHalf ? 1 : 0), (index) => Icon(
                        Icons.star_border,
                        color: ColorUtils.yellow199,
                        size: 16.r(context),
                      )),
                    ],
                  );
                }),

                SpaceHelperWidget.v(10.h(context)),

                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.center,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black64,
                  text: "${plannerVendorProfileController.totalReviews.value}",
                ),




              ],
            ),

            SpaceHelperWidget.h(15.w(context)),


            Obx(()=> Expanded(
              flex: 2,
              child: Column(
                children: plannerVendorProfileController.ratingCounts.keys.map((star) {
                  final count = plannerVendorProfileController.ratingCounts[star] ?? 0;
                  final total = plannerVendorProfileController.totalReviews.value;
                  final progress = total == 0 ? 0.0 : count / total; // Should be 0–1

                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.bpm(context)),
                    child: Row(
                      children: [
                        // Star Number
                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.center,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black64,
                          text: star.toString(),
                        ),

                        SpaceHelperWidget.h(6.w(context)),

                        // Progress Bar
                        Expanded(
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(8.r(context)),
                            child: LinearProgressIndicator(
                              value: progress,
                              backgroundColor: ColorUtils.white217,
                              minHeight: 10.h(context),
                              valueColor: const AlwaysStoppedAnimation<Color>(ColorUtils.blue96),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ))


          ],
        ),

        SpaceHelperWidget.v(24.h(context)),


        ...plannerVendorProfileController.reviews.map((r) => reviewItem(r: r,context: context)).toList(),



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
