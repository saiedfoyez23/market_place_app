import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserPlannerProfileView extends StatelessWidget {
  UserPlannerProfileView({
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
    final UserPlannerProfileController userPlannerProfileController = Get.put(UserPlannerProfileController(userId: userId,context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        if(isSearchBar == true) {
          Get.off(()=>DashboardUserView(index: 0),preventDuplicates: false);
        } else {
          Get.off(()=>UserPlannerServiceDetailsView(
            isSearchBar: isSearchBar,
            isWishlist: isWishlist,
            isPlanner: isPlanner,
            categoryId: categoryId,
            isCategory: isCategory,
            isRecommended: isRecommended,
            isHome: isHome,
            serviceId: serviceId,
          ), preventDuplicates: false);
        }
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white255,
            ),
            child: userPlannerProfileController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [


                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    if(isSearchBar == true) {
                      Get.off(()=>DashboardUserView(index: 0),preventDuplicates: false);
                    } else {
                      Get.off(()=>UserPlannerServiceDetailsView(
                        isSearchBar: isSearchBar,
                        isWishlist: isWishlist,
                        isPlanner: isPlanner,
                        isRecommended: isRecommended,
                        isHome: isHome,
                        serviceId: serviceId,
                        isCategory: isCategory,
                        categoryId: categoryId,
                      ), preventDuplicates: false);
                    }
                  },
                  title: "Planner Information",
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
                                imageAsset: userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.coverPhoto == null ? ImageUtils.coverImage : null,
                                imageUrl: userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.coverPhoto,
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
                                  imageAsset: userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.photoUrl == null ? ImageUtils.noImage : null,
                                  imageUrl: userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.photoUrl,
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
                              text: userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.name ?? "",
                            ),

                            SpaceHelperWidget.h(12.w(context)),


                            userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.isKycVerified == true ?
                            ImageHelperWidget.assetImageWidget(
                              context: context,
                              height: 25.h(context),
                              width: 25.w(context),
                              imageString: ImageUtils.verifyImage,
                            ) : userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.isActiveSubscription == true ?
                            ImageHelperWidget.assetImageWidget(
                              context: context,
                              height: 25.h(context),
                              width: 25.w(context),
                              imageString: ImageUtils.verifyPaymentImage,
                            ) : userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.isKycVerified == true &&
                                userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.isActiveSubscription == true ?
                            ImageHelperWidget.assetImageWidget(
                              context: context,
                              height: 25.h(context),
                              width: 25.w(context),
                              imageString: ImageUtils.verifyPaymentImage,
                            ) : SizedBox.shrink(),

                            SpaceHelperWidget.h(6.w(context)),

                          ],
                        ),


                        SpaceHelperWidget.v(20.h(context)),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [


                            Expanded(
                              child: Row(
                                children: [

                                  ImageHelperWidget.assetImageWidget(
                                    context: context,
                                    height: 20.h(context),
                                    width: 20.w(context),
                                    imageString: ImageUtils.vendorLocationImage,
                                  ),

                                  SpaceHelperWidget.h(12.w(context)),

                                  Expanded(
                                    child: TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.centerLeft,
                                      textAlign: TextAlign.start,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      textColor: ColorUtils.black48,
                                      text: userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.address ?? "",
                                    ),
                                  ),


                                ],
                              ),
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
                                      text: '${userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.avgRating} ',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: ColorUtils.black10,
                                    ).toTextSpan(),
                                    CustomTextSpan(
                                      text: '(${userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.ratingCount} reviews)',
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

                        buildTabs(
                          context: context,
                          userPlannerProfileController: userPlannerProfileController,
                        ),

                        SpaceHelperWidget.v(20.h(context)),


                        userPlannerProfileController.selectedTab.value == UserVendorProfileTab.overview ?
                        overviewWidget(
                          context: context,
                          userPlannerProfileController: userPlannerProfileController,
                        ):
                        reviewWidget(
                          context: context,
                          userPlannerProfileController: userPlannerProfileController,
                        ),


                        SpaceHelperWidget.v(32.h(context)),

                        userPlannerProfileController.isCreate.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(context: context) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            userPlannerProfileController.isCreate.value = true;
                            Map<String,dynamic> data = {
                              "modelType": "User",
                              "participants": [
                                userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.sId // connected profile id
                              ]
                            };
                            await userPlannerProfileController.createMessageController(context: context, data: data);


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
      ),
    );
  }

  /// ------------------------------
  /// TAB BAR
  /// ------------------------------
  Widget buildTabs({
    required BuildContext context,
    required UserPlannerProfileController userPlannerProfileController,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: tabItem(
            status: UserVendorProfileTab.overview,
            title: "Overview",
            context: context,
            userPlannerProfileController: userPlannerProfileController,
          ),
        ),
        Expanded(
            child: tabItem(
              status: UserVendorProfileTab.reviews,
              title: "Reviews",
              context: context,
              userPlannerProfileController: userPlannerProfileController,
            ),
        ),
      ],
    );
  }

  Widget tabItem({
    required String title,
    required UserVendorProfileTab status,
    required BuildContext context,
    required UserPlannerProfileController userPlannerProfileController,
  }) {
    bool isSelected = userPlannerProfileController.selectedTab.value == status;
    return InkWell(
      onTap: () {
        userPlannerProfileController.changeTab(status);
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

  Widget overviewWidget({
    required BuildContext context,
    required UserPlannerProfileController userPlannerProfileController,
  }) {
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
                text: userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.bio ?? "",
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

              rowItem(title: "Phone: ",value: userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.contractNumber ?? "",context: context),
              rowItem(title: "Email: ",value: userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.email ?? "",context: context),
              rowItem(title: "Location",value: userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data?.address ?? "",context: context),


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


              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data!.categories!.length, (index) {
                    return serviceChip(text: userPlannerProfileController.getPlannerProfileDetailsResponseModel.value.data!.categories![index], context: context);
                  }),
                ),
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
                text: 'Feature List',
              ),
            ),

            SpaceHelperWidget.h(12.w(context)),

            if(userPlannerProfileController.getAllFeaturedServiceResponseModel.value.data?.isNotEmpty == true) ...[
              ButtonHelperWidget.customButtonWidget(
                context: context,
                onPressed: () async {
                  Get.off(()=>UserPlannerProfileFeatureView(
                      isHome: isHome,
                      isSearchBar: isSearchBar,
                      isRecommended: isRecommended,
                      serviceId: serviceId,
                      userId: userId,
                      categoryId: categoryId,
                      isCategory: isCategory,
                      isPlanner: isPlanner,
                      isWishlist: isWishlist),
                      preventDuplicates: false
                  );
                },
                text: "See All",
                padding: EdgeInsets.only(left: 14.5.lpm(context)),
                alignment: Alignment.center,
                textColor: ColorUtils.blue96,
                fontWeight: FontWeight.w600,
                fontSize: 24,
                backgroundColor: Colors.transparent,
              ),
            ] else ...[
              SizedBox.shrink(),
            ],

          ],
        ),

        SpaceHelperWidget.v(20.h(context)),

        if(userPlannerProfileController.getAllFeaturedServiceResponseModel.value.data?.isNotEmpty == true) ...[
          if(userPlannerProfileController.getAllFeaturedServiceResponseModel.value.data!.length > 1) ...[
            Row(
              children: [
                Expanded(child: buildPlannerFeatureCard(service: userPlannerProfileController.getAllFeaturedServiceResponseModel.value.data![0], context: context)),
                SpaceHelperWidget.h(12.w(context)),
                Expanded(child: buildPlannerFeatureCard(service: userPlannerProfileController.getAllFeaturedServiceResponseModel.value.data![1], context: context)),
              ],
            )
          ] else ...[
            Row(
              children: [
                Expanded(child: buildPlannerFeatureCard(service: userPlannerProfileController.getAllFeaturedServiceResponseModel.value.data![0], context: context)),
                SpaceHelperWidget.h(12.w(context)),
                Expanded(child: SizedBox.shrink())
              ],
            )
          ]
        ] else ...[
          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.center,
            textAlign: TextAlign.start,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: "No Feature List Available",
          ),
        ],


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
                text: 'Planner Services',
              ),
            ),

            SpaceHelperWidget.h(12.w(context)),


            if(userPlannerProfileController.getAllPlannerWiseServiceResponseModel.value.data?.isNotEmpty == true) ...[
              ButtonHelperWidget.customButtonWidget(
                context: context,
                onPressed: () async {
                  Get.off(()=>UserPlannerProfileServiceView(
                    isHome: isHome,
                    isSearchBar: isSearchBar,
                    isRecommended: isRecommended,
                    serviceId: serviceId,
                    userId: userId,
                    categoryId: categoryId,
                    isCategory: isCategory,
                    isPlanner: isPlanner,
                    isWishlist: isWishlist,),
                      preventDuplicates: false
                  );
                },
                text: "See All",
                padding: EdgeInsets.only(left: 14.5.lpm(context)),
                alignment: Alignment.center,
                textColor: ColorUtils.blue96,
                fontWeight: FontWeight.w600,
                fontSize: 24,
                backgroundColor: Colors.transparent,
              ),
            ] else ...[
              SizedBox.shrink(),
            ],

          ],
        ),

        SpaceHelperWidget.v(20.h(context)),

        if(userPlannerProfileController.getAllPlannerWiseServiceResponseModel.value.data?.isNotEmpty == true) ...[
          if(userPlannerProfileController.getAllPlannerWiseServiceResponseModel.value.data!.length > 1) ...[
            Row(
              children: [
                Expanded(child: buildPlannerCard(service: userPlannerProfileController.getAllPlannerWiseServiceResponseModel.value.data![0], context: context)),
                SpaceHelperWidget.h(12.w(context)),
                Expanded(child: buildPlannerCard(service: userPlannerProfileController.getAllPlannerWiseServiceResponseModel.value.data![1], context: context)),
              ],
            )
          ] else ...[
            Row(
              children: [
                Expanded(child: buildPlannerCard(service: userPlannerProfileController.getAllPlannerWiseServiceResponseModel.value.data![0], context: context)),
                SpaceHelperWidget.h(12.w(context)),
                Expanded(child: SizedBox.shrink()),
              ],
            )
          ]
        ] else ...[
          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.center,
            textAlign: TextAlign.start,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: "No Planner Services Available",
          ),
        ],


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

            if(userPlannerProfileController.getPlannerAllPortfolioResponseModel.value.data?.isNotEmpty == true)...[
              ButtonHelperWidget.customButtonWidget(
                context: context,
                onPressed: () async {
                  Get.off(()=>UserPlannerProfilePortfolioView(
                    isHome: isHome,
                    isSearchBar: isSearchBar,
                    isRecommended: isRecommended,
                    serviceId: serviceId,
                    userId: userId,
                    categoryId: categoryId,
                    isCategory: isCategory,
                    isPlanner: isPlanner,
                    isWishlist: isWishlist,),
                      preventDuplicates: false
                  );
                },
                text: "See All",
                padding: EdgeInsets.only(left: 14.5.lpm(context)),
                alignment: Alignment.center,
                textColor: ColorUtils.blue96,
                fontWeight: FontWeight.w600,
                fontSize: 24,
                backgroundColor: Colors.transparent,
              ),
            ] else...[
              SizedBox.shrink(),
            ]


          ],
        ),

        SpaceHelperWidget.v(20.h(context)),

        if(userPlannerProfileController.getPlannerAllPortfolioResponseModel.value.data?.isNotEmpty == true)...[
          if(userPlannerProfileController.getPlannerAllPortfolioResponseModel.value.data!.length > 2)...[
            Row(
              children: List.generate(3, (index) {
                return Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ImageHelperWidget.styledImage(
                          context: context,
                          height: 125.h(context),
                          width: 125.w(context),
                          borderRadius: 0,
                          imageUrl: userPlannerProfileController.getPlannerAllPortfolioResponseModel.value.data?[index].url ?? "",
                        ),
                      ),
                      SpaceHelperWidget.h(5.w(context)),
                    ],
                  ),
                );
              }),
            )
          ] else...[
            Row(
              children: List.generate(userPlannerProfileController.getPlannerAllPortfolioResponseModel.value.data!.length, (index) {
                return Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ImageHelperWidget.styledImage(
                          context: context,
                          height: 125.h(context),
                          width: 125.w(context),
                          borderRadius: 0,
                          imageUrl: userPlannerProfileController.getPlannerAllPortfolioResponseModel.value.data?[index].url ?? "",
                        ),
                      ),
                      SpaceHelperWidget.h(5.w(context)),
                    ],
                  ),
                );
              }),
            )
          ]
        ] else...[
          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.center,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: 'No Portfolio Available',
          ),
        ],

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

  Widget buildPlannerCard({required GetAllPlannerWiseServiceResponse service,required BuildContext context}) {
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
            height: 130.h(context),
            width: 438.w(context),
            imageUrl: service.images?.first,
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
                        text: '${service.author?.avgRating ?? 0.0} ',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black10
                    ).toTextSpan(),
                    CustomTextSpan(
                      text: '(${service.author?.ratingCount ?? 0} review)',
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
              Get.off(()=>UserPlannerWiseServiceDetailsView(
                isSearchBar: isSearchBar,
                isWishlist: isWishlist,
                isCategory: isCategory,
                plannerWiseServiceId: service.sId,
                isPlanner: isPlanner,
                isRecommended: isRecommended,
                isHome: isHome,
                serviceId: serviceId,
                userId: userId,
                categoryId: categoryId,
              ),preventDuplicates: false);
            },
            text:'View Details',
          ),

        ],
      ),
    );
  }

  Widget buildPlannerFeatureCard({required GetAllFeaturedServiceResponse service,required BuildContext context}) {
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
            height: 130.h(context),
            width: 438.w(context),
            imageUrl: service.images?.first,
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
                        text: '${service.author?.avgRating ?? 0.0} ',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black10
                    ).toTextSpan(),
                    CustomTextSpan(
                      text: '(${service.author?.ratingCount ?? 0} review)',
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
              Get.off(()=>UserPlannerWiseServiceDetailsView(
                isWishlist: isWishlist,
                isCategory: isCategory,
                isPlanner: isPlanner,
                isSearchBar: isSearchBar,
                plannerWiseServiceId: service.sId,
                isRecommended: isRecommended,
                isHome: isHome,
                serviceId: serviceId,
                userId: userId,
                categoryId: categoryId,
              ),preventDuplicates: false);
            },
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

  Widget reviewWidget({required BuildContext context,required UserPlannerProfileController userPlannerProfileController}) {
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
          text: "Ratings and reviews are verified and are "
              "from people who use the same type of device that you use",
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
                  text: '${userPlannerProfileController.getAllUserReviewResponseModel.value.data?.avgRating ?? ""}',
                ),

                SpaceHelperWidget.v(10.h(context)),

                Obx(() {

                  int fullStars = userPlannerProfileController.getAllUserReviewResponseModel.value.data?.avgRating.floor();
                  num fractional = userPlannerProfileController.getAllUserReviewResponseModel.value.data?.avgRating - fullStars;
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
                  text: "${userPlannerProfileController.getAllUserReviewResponseModel.value.data?.ratingCount}",
                ),




              ],
            ),

            SpaceHelperWidget.h(15.w(context)),


            Obx(() {
              final breakdown = userPlannerProfileController.getAllUserReviewResponseModel.value.data?.ratingBreakdown;

              if (breakdown == null) {
                return const SizedBox();
              }

              final total = userPlannerProfileController.getAllUserReviewResponseModel.value.data?.ratingCount ?? 0;

              final ratingItems = [
                (star: 5, count: breakdown.excellent ?? 0),
                (star: 4, count: breakdown.veryGood ?? 0),
                (star: 3, count: breakdown.good ?? 0),
                (star: 2, count: breakdown.fair ?? 0),
                (star: 1, count: breakdown.poor ?? 0),
              ];


              return Expanded(
                flex: 2,
                child: Column(
                  children: ratingItems.map((star) {
                    final progress = total == 0 ? 0.0 : star.count / total;
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
                            text: star.star.toString(),
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
              );
            })


          ],
        ),

        SpaceHelperWidget.v(24.h(context)),


        ...userPlannerProfileController.getAllUserReviewResponseModel.value.data!.reviews!.map((r) => reviewItem(r: r,context: context)).toList(),



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
              imageUrl: r.user?.photoUrl,
              imageAsset: r.user?.photoUrl == null ? ImageUtils.noImage : null,
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
                    text: r.user?.name,
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
