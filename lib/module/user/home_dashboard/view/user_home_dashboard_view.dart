import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserHomeDashboardView extends StatelessWidget {
  UserHomeDashboardView({super.key});

  final UserHomeDashboardController userHomeDashboardController = Get.put(UserHomeDashboardController());

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

              
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SpaceHelperWidget.v(32.h(context)),

                      // app bar
                      Row(
                        children: [

                          ImageHelperWidget.circleImageHelperWidget(
                            width: 50.w(context),
                            height: 50.h(context),
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

                                RichTextHelperWidget.headingRichText(
                                  context: context,
                                  alignment: Alignment.centerLeft,
                                  textSpans: [
                                    CustomTextSpan(
                                        text: 'Welcome back ',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: ColorUtils.black64
                                    ).toTextSpan(),
                                    CustomTextSpan(
                                      text: 'Shahid',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: ColorUtils.orange119,
                                    ).toTextSpan(),
                                  ],
                                ),


                                SpaceHelperWidget.v(3.h(context)),

                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.centerLeft,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  textColor: ColorUtils.black107,
                                  text: "Plan your next event with trusted professionals.",
                                ),



                              ],
                            ),
                          ),


                          SpaceHelperWidget.h(15.w(context)),

                          InkWell(
                            onTap: () async {
                              Get.off(()=>UserNotificationView(),preventDuplicates: false);
                            },
                            child: ImageHelperWidget.assetImageWidget(
                              context: context,
                              height: 50.h(context),
                              width: 50.w(context),
                              imageString: ImageUtils.notificationBellImage,
                            ),
                          ),

                          SpaceHelperWidget.h(15.w(context)),


                          InkWell(
                            onTap: () async {
                              //Get.off(()=>PlannerNotificationView(),preventDuplicates: false);
                            },
                            child: ImageHelperWidget.assetImageWidget(
                              context: context,
                              height: 50.h(context),
                              width: 50.w(context),
                              imageString: ImageUtils.filterSearchImage,
                            ),
                          ),




                        ],
                      ),


                      SpaceHelperWidget.v(32.h(context)),


                      // Search Bar
                      TextFormFieldWidget.build(
                        context: context,
                        hintText: "Search Planner...",
                        controller: userHomeDashboardController.searchController.value,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(
                            20.lpm(context),
                            14.5.tpm(context),
                            5.rpm(context),
                            14.5.bpm(context),
                          ),
                          child: ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 20.h(context),
                            width: 20.w(context),
                            imageString: ImageUtils.searchImage,
                          ),
                        ),
                      ),

                      SpaceHelperWidget.v(32.h(context)),

                      SizedBox(
                        height: 200.h(context),
                        child: PageView(
                          controller: userHomeDashboardController.pageController.value,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value) {
                            userHomeDashboardController.changeIndex(value);
                          },
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r(context)),
                              child: ImageHelperWidget.assetImageWidget(
                                context: context,
                                height: 172,
                                width: 428,
                                imageString: ImageUtils.userDashboardImage,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r(context)),
                              child: ImageHelperWidget.assetImageWidget(
                                context: context,
                                height: 172,
                                width: 428,
                                imageString: ImageUtils.userDashboardImage,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r(context)),
                              child: ImageHelperWidget.assetImageWidget(
                                context: context,
                                height: 172,
                                width: 428,
                                imageString: ImageUtils.userDashboardImage,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r(context)),
                              child: ImageHelperWidget.assetImageWidget(
                                context: context,
                                height: 172,
                                width: 428,
                                imageString: ImageUtils.userDashboardImage,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SpaceHelperWidget.v(20.h(context)),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(4, (index) {
                          if(userHomeDashboardController.index.value == index) {
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



                      SpaceHelperWidget.v(32.h(context)),

                      // Categories

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        textColor: ColorUtils.black48,
                        text: "Categories",
                      ),

                      SpaceHelperWidget.v(16.h(context)),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildCategoryCard(title: 'Weddings', image: ImageUtils.categoryImage4, context: context),
                          buildCategoryCard(title: 'Corporates', image: ImageUtils.categoryImage1, context: context),
                          buildCategoryCard(title: 'Birthday', image: ImageUtils.categoryImage2, context: context),
                          buildCategoryCard(title: 'Others', image: ImageUtils.categoryImage3, context: context),
                        ],
                      ),

                      SpaceHelperWidget.v(32.h(context)),

                      // Upcoming Booking Section
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 14.hpm(context)),
                        decoration: BoxDecoration(
                          color: ColorUtils.white247,
                          borderRadius: BorderRadius.circular(20.r(context)),
                        ),
                        child: Column(
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
                                    text: "Upcoming Booking",
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
                            SpaceHelperWidget.v(12.h(context)),
                            ...userHomeDashboardController.upcomingBookings.map((booking) => buildBookingCard(booking: booking,context: context)).toList(),

                          ],
                        ),
                      ),

                      SpaceHelperWidget.v(32.h(context)),

                      // Recommended for You

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
                              text: 'Recommended for You',
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
                          Expanded(child: buildRecommendationCard(vendor: userHomeDashboardController.recommendedVendors[0], context: context)),
                          SpaceHelperWidget.h(12.w(context)),
                          Expanded(child: buildRecommendationCard(vendor: userHomeDashboardController.recommendedVendors[1], context: context)),
                        ],
                      ),



                      SpaceHelperWidget.v(32.h(context)),

                      // Top Vendor

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
                              text: 'Top Planner',
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
                          Expanded(child: buildVendorCard(vendor: userHomeDashboardController.topVendors[0], context: context)),
                          SpaceHelperWidget.h(12.w(context)),
                          Expanded(child: buildVendorCard(vendor: userHomeDashboardController.topVendors[1], context: context)),
                        ],
                      ),


                      SpaceHelperWidget.v(32.h(context)),

                      // Top Vendor

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
                              text: 'Planner Service',
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
                          Expanded(child: buildPlannerCard(service: userHomeDashboardController.plannerServices[0], context: context)),
                          SpaceHelperWidget.h(12.w(context)),
                          Expanded(child: buildPlannerCard(service: userHomeDashboardController.plannerServices[1], context: context)),
                        ],
                      ),


                      SpaceHelperWidget.v(32.h(context)), // Space for bottom nav
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildCategoryCard({required String title, required String image,required BuildContext context}) {
    return Column(
      children: [
        ImageHelperWidget.assetImageWidget(
          context: context,
          height: 50.h(context),
          width: 50.w(context),
          imageString: image,
        ),

        SpaceHelperWidget.v(6.h(context)),


        TextHelperClass.headingTextWithoutWidth(
          context: context,
          alignment: Alignment.center,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          textColor: ColorUtils.black48,
          text: title,
        ),
      ],
    );
  }

  Widget buildRecommendationCard({required Map<String, dynamic> vendor,required BuildContext context}) {
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
              child: Image.asset(vendor['imageUrl'], fit: BoxFit.cover),
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
            text: vendor['name'] ?? '',
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
                        text: '${vendor['rating'].toString()} ',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black10
                    ).toTextSpan(),
                    CustomTextSpan(
                      text: '(${vendor['reviews']} review)',
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
            onPressed: () async {
              Get.off(()=>UserVendorServiceDetailsView(),preventDuplicates: false);
            },
            text:'View Details',
          ),

        ],
      ),
    );
  }

  Widget buildBookingCard({required Map<String, dynamic> booking,required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.bpm(context)),
      padding: EdgeInsets.only(top: 8.tpm(context),bottom: 12.bpm(context)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ColorUtils.white204,width: 1)),
      ),
      child: Row(
        children: [
          ImageHelperWidget.assetImageWidget(
            context: context,
            height: 40.h(context),
            width: 40.w(context),
            imageString: ImageUtils.upcomingBookingImage,
          ),

          SpaceHelperWidget.h(12.w(context)),

          Expanded(
            child: Column(
              children: [
                TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  textColor: ColorUtils.black64,
                  text: booking['title'],
                ),

                SpaceHelperWidget.v(8.h(context)),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(
                      child: TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black74,
                        text: booking['date'],
                      ),
                    ),


                    Row(
                      children: [

                        ImageHelperWidget.assetImageWidget(
                          context: context,
                          height: 20.h(context),
                          width: 20.w(context),
                          imageString: ImageUtils.confirmedImage,
                        ),

                        SpaceHelperWidget.h(8.w(context)),

                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textColor: ColorUtils.green139,
                          text: booking['status'],
                        ),

                      ],
                    )



                  ],
                ),

              ],
            ),
          ),






        ],
      ),
    );
  }


  Widget buildVendorCard({required Map<String, dynamic> vendor,required BuildContext context}) {
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
              child: Image.asset(vendor['imageUrl'], fit: BoxFit.cover),
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
            text: vendor['name'] ?? '',
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
                        text: '${vendor['rating'].toString()} ',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black10
                    ).toTextSpan(),
                    CustomTextSpan(
                      text: '(${vendor['reviews']} review)',
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
            onPressed: () async {
              Get.off(()=>UserVendorServiceDetailsView(),preventDuplicates: false);
            },
            text:'View Details',
          ),

        ],
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
            onPressed: () async {
              Get.off(()=>UserVendorServiceDetailsView(),preventDuplicates: false);
            },
            text:'View Details',
          ),

        ],
      ),
    );
  }
}
