import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserHomeDashboardView extends StatelessWidget {
  const UserHomeDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserHomeDashboardController userHomeDashboardController = Get.put(UserHomeDashboardController(context: context));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: userHomeDashboardController.isLoading.value == true ?
          LoadingHelperWidget.loadingHelperWidget(
            context: context,
            height: 930.h(context),
          ) :
          RefreshIndicator(
            onRefresh: () async {
              Get.off(()=>DashboardUserView(index: 0),preventDuplicates: false);
            },
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
                              imageAsset: userHomeDashboardController.userMyProfileDetailsResponseModel.value.data?.photoUrl == null ? ImageUtils.noImage : null,
                              imageUrl: userHomeDashboardController.userMyProfileDetailsResponseModel.value.data?.photoUrl,
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
                                        text: userHomeDashboardController.userMyProfileDetailsResponseModel.value.data!.name.toString().split(" ").first,
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

                            // SpaceHelperWidget.h(15.w(context)),


                            // InkWell(
                            //   onTap: () async {
                            //     //Get.off(()=>PlannerNotificationView(),preventDuplicates: false);
                            //   },
                            //   child: ImageHelperWidget.assetImageWidget(
                            //     context: context,
                            //     height: 50.h(context),
                            //     width: 50.w(context),
                            //     imageString: ImageUtils.filterSearchImage,
                            //   ),
                            // ),




                          ],
                        ),


                        SpaceHelperWidget.v(32.h(context)),


                        // Search Bar
                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Search Planner Or Category....",
                          controller: userHomeDashboardController.searchController.value,
                          keyboardType: TextInputType.emailAddress,
                          readOnly: true,
                          onTap: () async {
                            showDialog(
                              context: context,
                              barrierColor: Colors.black.withOpacity(0.3),
                              builder: (context) {
                                return UserSearchDialogBox();
                              },
                            );
                          },
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
                            children: List.generate(userHomeDashboardController.clientHomeResponseModel.value.data!.banners!.length, (index) {
                              return ImageHelperWidget.styledImage(
                                context: context,
                                borderRadius: 12,
                                height: 172,
                                width: 428,
                                imageUrl: userHomeDashboardController.clientHomeResponseModel.value.data!.banners![index].url,
                              );
                            })
                          ),
                        ),

                        SpaceHelperWidget.v(20.h(context)),



                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(userHomeDashboardController.clientHomeResponseModel.value.data!.banners!.length, (index) {
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

                        Container(
                          height: 90.h(context),
                          width: 428.w(context),
                          decoration: BoxDecoration(
                            color: Colors.transparent
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: userHomeDashboardController.clientHomeResponseModel.value.data?.categories?.length,
                            itemBuilder: (context,int index) {
                              return InkWell(
                                onTap: () async {
                                  Get.off(()=>UserCategoryWiseServiceView(categoryId: userHomeDashboardController.clientHomeResponseModel.value.data?.categories?[index].sId),preventDuplicates: false);
                                },
                                child: buildCategoryCard(
                                  title: userHomeDashboardController.clientHomeResponseModel.value.data?.categories?[index].title,
                                  image: userHomeDashboardController.clientHomeResponseModel.value.data?.categories?[index].logo,
                                  context: context,
                                ),
                              );
                            },
                          ),
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

                                  if(userHomeDashboardController.clientHomeResponseModel.value.data?.upcomingBooking?.isNotEmpty == true)...[
                                    ButtonHelperWidget.customButtonWidget(
                                      context: context,
                                      onPressed: () async {
                                        Get.off(()=>DashboardUserView(index: 1),preventDuplicates: false);
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
                              SpaceHelperWidget.v(12.h(context)),

                              if(userHomeDashboardController.clientHomeResponseModel.value.data?.upcomingBooking?.isNotEmpty == true)...[
                                ...userHomeDashboardController.clientHomeResponseModel.value.data!.upcomingBooking!.map((booking) => buildBookingCard(booking: booking,context: context)),
                              ] else...[
                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.center,
                                  textAlign: TextAlign.start,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  textColor: ColorUtils.black48,
                                  text: "No Upcoming Booking Available",
                                ),
                              ]


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

                            if(userHomeDashboardController.clientHomeResponseModel.value.data!.recommendServices?.isNotEmpty == true)...[
                              ButtonHelperWidget.customButtonWidget(
                                context: context,
                                onPressed: () async {
                                  Get.off(()=>UserAllRecommendedServiceView(),preventDuplicates: false);
                                },
                                text: "See All",
                                padding: EdgeInsets.only(left: 14.5.lpm(context)),
                                alignment: Alignment.center,
                                textColor: ColorUtils.blue96,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                backgroundColor: Colors.transparent,
                              ),
                            ] else...[
                              SizedBox.shrink(),
                            ],


                          ],
                        ),

                        SpaceHelperWidget.v(20.h(context)),

                        if(userHomeDashboardController.clientHomeResponseModel.value.data!.recommendServices?.isNotEmpty == true)...[
                          if(userHomeDashboardController.clientHomeResponseModel.value.data!.recommendServices!.length > 1)...[
                            Row(
                              children: [
                                Expanded(child: buildRecommendationCard(vendor: userHomeDashboardController.clientHomeResponseModel.value.data!.recommendServices![0], context: context)),
                                SpaceHelperWidget.h(12.w(context)),
                                Expanded(child: buildRecommendationCard(vendor: userHomeDashboardController.clientHomeResponseModel.value.data!.recommendServices![1], context: context)),
                              ],
                            )
                          ] else...[
                            Row(
                              children: [
                                Expanded(child: buildRecommendationCard(vendor: userHomeDashboardController.clientHomeResponseModel.value.data!.recommendServices![0], context: context)),
                                SpaceHelperWidget.h(12.w(context)),
                                Expanded(child: SizedBox.shrink()),
                              ],
                            )
                          ]
                        ] else...[
                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.center,
                            textAlign: TextAlign.start,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            textColor: ColorUtils.black48,
                            text: "No Recommended Service Available",
                          ),
                        ],

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

                            if(userHomeDashboardController.clientHomeResponseModel.value.data!.planerService?.isNotEmpty == true)...[
                              ButtonHelperWidget.customButtonWidget(
                                context: context,
                                onPressed: () async {
                                  Get.off(()=>UserAllPlannerServiceView(),preventDuplicates: false);
                                },
                                text: "See All",
                                padding: EdgeInsets.only(left: 14.5.lpm(context)),
                                alignment: Alignment.center,
                                textColor: ColorUtils.blue96,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                backgroundColor: Colors.transparent,
                              ),
                            ] else...[
                              SizedBox.shrink(),
                            ],

                          ],
                        ),

                        SpaceHelperWidget.v(20.h(context)),


                        if(userHomeDashboardController.clientHomeResponseModel.value.data!.planerService?.isNotEmpty == true)...[
                          if(userHomeDashboardController.clientHomeResponseModel.value.data!.planerService!.length > 1)...[
                            Row(
                              children: [
                                Expanded(child: buildPlannerCard(service: userHomeDashboardController.clientHomeResponseModel.value.data!.planerService![0], context: context)),
                                SpaceHelperWidget.h(12.w(context)),
                                Expanded(child: buildPlannerCard(service: userHomeDashboardController.clientHomeResponseModel.value.data!.planerService![1], context: context)),
                              ],
                            )
                          ] else...[
                            Row(
                              children: [
                                Expanded(child: buildPlannerCard(service: userHomeDashboardController.clientHomeResponseModel.value.data!.planerService![0], context: context)),
                                SpaceHelperWidget.h(12.w(context)),
                                Expanded(child: SizedBox.shrink()),
                              ],
                            )
                          ]
                        ] else...[
                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.center,
                            textAlign: TextAlign.start,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            textColor: ColorUtils.black48,
                            text: "No Planner Service Available",
                          ),
                        ],




                        SpaceHelperWidget.v(32.h(context)), // Space for bottom nav
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget buildCategoryCard({required String title, required String image,required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(right: 24.rpm(context)),
      child: Column(
        children: [
          ImageHelperWidget.styledImage(
            context: context,
            height: 48,
            width: 48,
            imageUrl: image,
            borderRadius: 8
          ),

          SpaceHelperWidget.v(6.h(context)),


          Expanded(
            child: TextHelperClass.headingTextWithoutWidth(
              context: context,
              alignment: Alignment.center,
              textAlign: TextAlign.center,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textColor: ColorUtils.black48,
              text: title,
            ),
          )
        ],
      ),
    );
  }

  Widget buildRecommendationCard({required ClientHomeResponseRecommendServices vendor,required BuildContext context}) {
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

          ImageHelperWidget.styledImage(
            context: context,
            height: 170,
            width: 428,
            imageUrl: vendor.images?.first,
            borderRadius: 8,
          ),


          SpaceHelperWidget.v(12.h(context)),


          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.center,
            textAlign: TextAlign.center,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black64,
            text: vendor.title ?? '',
            textOverFlow: TextOverflow.ellipsis
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
                        text: '${vendor.author?.avgRating.toString()} ',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black10
                    ).toTextSpan(),
                    CustomTextSpan(
                      text: '(${vendor.author?.ratingCount} review)',
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
              Get.off(()=>UserPlannerServiceDetailsView(
                isWishlist: false,
                isSearchBar: false,
                isPlanner: false,
                categoryId: "",
                isCategory: false,
                isRecommended: false,
                isHome: true,
                serviceId: vendor.sId,
              ), preventDuplicates: false);
            },
            text:'View Details',
          ),

        ],
      ),
    );
  }

  Widget buildBookingCard({required ClientHomeResponseUpcomingBooking booking,required BuildContext context}) {
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
                  text: "${booking.title} - ${booking.type}",
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
                        text: DateFormat("MMM dd,yyyy").format(DateTime.parse(booking.startDate)),
                      ),
                    ),


                    booking.status == "completed" ?
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
                          text: booking.status,
                        ),

                      ],
                    ) :
                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: ColorUtils.yellow177,
                      text: booking.status == "running" ? "In Process" : booking.status,
                    ),



                  ],
                ),

              ],
            ),
          ),






        ],
      ),
    );
  }

  Widget buildPlannerCard({required ClientHomeResponsePlanerService service,required BuildContext context}) {
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

          ImageHelperWidget.styledImage(
            context: context,
            height: 170,
            width: 428,
            imageUrl: service.images?.first,
            borderRadius: 8,
          ),

          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8.r(context)),
          //   child: Container(
          //     height: 170.w(context),
          //     color: Colors.transparent,
          //     child: Image.asset(service['imageUrl'], fit: BoxFit.cover),
          //   ),
          // ),


          SpaceHelperWidget.v(12.h(context)),


          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.center,
            textAlign: TextAlign.center,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black64,
            text: service.title ?? '',
            textOverFlow: TextOverflow.ellipsis
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
                        text: '${service.author?.avgRating.toString()} ',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black10
                    ).toTextSpan(),
                    CustomTextSpan(
                      text: '(${service.author?.ratingCount} review)',
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
              Get.off(()=>UserPlannerServiceDetailsView(
                isWishlist: false,
                isPlanner: false,
                isSearchBar: false,
                categoryId: "",
                isCategory: false,
                isRecommended: false,
                isHome: true,
                serviceId: service.sId,
              ), preventDuplicates: false);
            },
            text:'View Details',
          ),

        ],
      ),
    );
  }
}
