import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerVendorProfileView extends StatelessWidget {
  PlannerVendorProfileView({
    super.key,
    required this.serviceId,
    required this.userId,
    required this.isHome,
    required this.isCategory,
    required this.isSearch,
    required this.categoryId,
  });
  final String serviceId;
  final String userId;
  final bool isCategory;
  final bool isHome;
  final bool isSearch;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final PlannerVendorProfileController plannerVendorProfileController = Get.put(PlannerVendorProfileController(userId: userId,context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        if(isSearch == true) {
          Get.off(()=> DashboardPlannerView(index: 2,),preventDuplicates: false);
        } else {
          Get.off(()=>PlannerServiceDetailsView(
            serviceId: serviceId,
            isCategory: isCategory,
            isHome: isHome,
            isSearch: isSearch,
            categoryId: categoryId,
          ),preventDuplicates: false);
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
            child: plannerVendorProfileController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              slivers: [


                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    if(isSearch == true) {
                      Get.off(()=> DashboardPlannerView(index: 2,),preventDuplicates: false);
                    } else {
                      Get.off(()=>PlannerServiceDetailsView(
                        serviceId: serviceId,
                        isCategory: isCategory,
                        isHome: isHome,
                        isSearch: isSearch,
                        categoryId: categoryId,
                      ),preventDuplicates: false);
                    }
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
                                imageAsset: plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.coverPhoto == null ? ImageUtils.coverImage : null,
                                imageUrl: plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.coverPhoto,
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
                                  imageAsset: plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.photoUrl == null ? ImageUtils.noImage : null,
                                  imageUrl: plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.photoUrl,
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
                              text: plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.name ?? "",
                            ),

                            SpaceHelperWidget.h(12.w(context)),

                            if(plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.isKycVerified == true &&
                                plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.isActiveSubscription == true)...[
                              ImageHelperWidget.assetImageWidget(
                                context: context,
                                height: 25.h(context),
                                width: 25.w(context),
                                imageString: ImageUtils.verifyPaymentImage,
                              ),
                            ] else if(plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.isKycVerified == true)...[
                              ImageHelperWidget.assetImageWidget(
                                context: context,
                                height: 25.h(context),
                                width: 25.w(context),
                                imageString: ImageUtils.verifyImage,
                              )
                            ] else if(plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.isActiveSubscription == true) ...[
                              ImageHelperWidget.assetImageWidget(
                                context: context,
                                height: 25.h(context),
                                width: 25.w(context),
                                imageString: ImageUtils.verifyPaymentImage,
                              )
                            ] else...[
                              SizedBox.shrink()
                            ],



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
                                      text: plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.address ?? "",
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
                                      text: '${plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.avgRating} ',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: ColorUtils.black10,
                                    ).toTextSpan(),
                                    CustomTextSpan(
                                      text: '(${plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.ratingCount} reviews)',
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

                        buildTabs(context: context,plannerVendorProfileController: plannerVendorProfileController),

                        SpaceHelperWidget.v(20.h(context)),


                        plannerVendorProfileController.selectedTab.value == PlannerVendorProfileTab.overview ?
                        overviewWidget(
                          context: context,
                          plannerVendorProfileController: plannerVendorProfileController,
                        ):
                        reviewWidget(
                          context: context,
                          plannerVendorProfileController: plannerVendorProfileController,
                        ),


                        SpaceHelperWidget.v(32.h(context)),

                        plannerVendorProfileController.isCreate.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(context: context) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            plannerVendorProfileController.isCreate.value = true;
                            Map<String,dynamic> data = {
                              "modelType": "User",
                              "participants": [
                                plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.sId // connected profile id
                              ]
                            };
                            await plannerVendorProfileController.createMessageController(context: context, data: data);


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
    required PlannerVendorProfileController plannerVendorProfileController,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(child: tabItem(status: PlannerVendorProfileTab.overview,title: "Overview",context: context,plannerVendorProfileController: plannerVendorProfileController)),
        Expanded(child: tabItem(status: PlannerVendorProfileTab.reviews,title: "Reviews",context: context,plannerVendorProfileController: plannerVendorProfileController)),
      ],
    );
  }

  Widget tabItem({
    required String title,
    required PlannerVendorProfileTab status,
    required BuildContext context,
    required PlannerVendorProfileController plannerVendorProfileController,
  }) {
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

  Widget overviewWidget({
    required BuildContext context,
    required PlannerVendorProfileController plannerVendorProfileController,
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
                text: plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.bio ?? "",
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

              rowItem(title: "Phone: ",value: plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.contractNumber ?? "",context: context),
              rowItem(title: "Email: ",value: plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.email ?? "",context: context),
              rowItem(title: "Location",value: plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data?.address ?? "",context: context),


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
                  children: List.generate(plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data!.categories!.length, (index) {
                    return serviceChip(text: plannerVendorProfileController.getVendorProfileDetailsResponseModel.value.data!.categories![index], context: context);
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

            if(plannerVendorProfileController.getAllFeaturedServiceResponseModel.value.data?.isNotEmpty == true)...[
              ButtonHelperWidget.customButtonWidget(
                context: context,
                onPressed: () async {
                  Get.off(()=>PlannerVendorProfileFeatureView(
                    serviceId: serviceId,
                    userId: userId,
                    isSearch: isSearch,
                    isHome: isHome,
                    isCategory: isCategory,
                    categoryId: categoryId,
                  ),preventDuplicates: false);
                },
                text: "See All",
                padding: EdgeInsets.only(left: 14.5.lpm(context)),
                alignment: Alignment.center,
                textColor: ColorUtils.blue96,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                backgroundColor: Colors.transparent,
              ),
            ] else ...[
              SizedBox.shrink(),
            ],

          ],
        ),

        SpaceHelperWidget.v(20.h(context)),

        if(plannerVendorProfileController.getAllFeaturedServiceResponseModel.value.data?.isNotEmpty == true)...[
          if(plannerVendorProfileController.getAllFeaturedServiceResponseModel.value.data!.length > 1)...[
            Row(
              children: [
                Expanded(child: buildPlannerFeatureCard(service: plannerVendorProfileController.getAllFeaturedServiceResponseModel.value.data![0], context: context)),
                SpaceHelperWidget.h(12.w(context)),
                Expanded(child: buildPlannerFeatureCard(service: plannerVendorProfileController.getAllFeaturedServiceResponseModel.value.data![1], context: context)),
              ],
            )
          ] else ...[
            Row(
              children: [
                Expanded(child: buildPlannerFeatureCard(service: plannerVendorProfileController.getAllFeaturedServiceResponseModel.value.data![0], context: context)),
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
                text: 'Vendor Services',
              ),
            ),

            SpaceHelperWidget.h(12.w(context)),


            if(plannerVendorProfileController.getAllPlannerWiseServiceResponseModel.value.data?.isNotEmpty == true) ...[
              ButtonHelperWidget.customButtonWidget(
                context: context,
                onPressed: () async {
                  Get.off(()=>PlannerAllVendorServiceView(
                    userId: userId,
                    serviceId: serviceId,
                    isCategory: isCategory,
                    isHome: isHome,
                    isSearch: isSearch,
                    categoryId: categoryId,
                  ),preventDuplicates: false);
                },
                text: "See All",
                padding: EdgeInsets.only(left: 14.5.lpm(context)),
                alignment: Alignment.center,
                textColor: ColorUtils.blue96,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                backgroundColor: Colors.transparent,
              ),
            ] else ...[
              SizedBox.shrink(),
            ],

          ],
        ),

        SpaceHelperWidget.v(20.h(context)),

        if(plannerVendorProfileController.getAllPlannerWiseServiceResponseModel.value.data?.isNotEmpty == true) ...[
          if(plannerVendorProfileController.getAllPlannerWiseServiceResponseModel.value.data!.length > 1) ...[
            Row(
              children: [
                Expanded(child: buildPlannerCard(service: plannerVendorProfileController.getAllPlannerWiseServiceResponseModel.value.data![0], context: context)),
                SpaceHelperWidget.h(12.w(context)),
                Expanded(child: buildPlannerCard(service: plannerVendorProfileController.getAllPlannerWiseServiceResponseModel.value.data![1], context: context)),
              ],
            )
          ] else ...[
            Row(
              children: [
                Expanded(child: buildPlannerCard(service: plannerVendorProfileController.getAllPlannerWiseServiceResponseModel.value.data![0], context: context)),
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

            if(plannerVendorProfileController.getPlannerAllPortfolioResponseModel.value.data?.isNotEmpty == true)...[
              ButtonHelperWidget.customButtonWidget(
                context: context,
                onPressed: () async {
                  Get.off(()=>PlannerVendorProfilePortfolioView(
                    userId: userId,
                    serviceId: serviceId,
                    isSearch: isSearch,
                    isHome: isHome,
                    isCategory: isCategory,
                    categoryId: categoryId,
                  ),preventDuplicates: false);
                },
                text: "See All",
                padding: EdgeInsets.only(left: 14.5.lpm(context)),
                alignment: Alignment.center,
                textColor: ColorUtils.blue96,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                backgroundColor: Colors.transparent,
              ),
            ] else...[
              SizedBox.shrink(),
            ]


          ],
        ),

        SpaceHelperWidget.v(20.h(context)),

        if(plannerVendorProfileController.getPlannerAllPortfolioResponseModel.value.data?.isNotEmpty == true)...[
          if(plannerVendorProfileController.getPlannerAllPortfolioResponseModel.value.data!.length > 2)...[
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
                          imageUrl: plannerVendorProfileController.getPlannerAllPortfolioResponseModel.value.data?[index].url ?? "",
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
              children: List.generate(plannerVendorProfileController.getPlannerAllPortfolioResponseModel.value.data!.length, (index) {
                return Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ImageHelperWidget.styledImage(
                          context: context,
                          height: 125.h(context),
                          width: 125.w(context),
                          borderRadius: 0,
                          imageUrl: plannerVendorProfileController.getPlannerAllPortfolioResponseModel.value.data?[index].url ?? "",
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
              Get.off(()=>PlannerVendorWiseServiceDetailsView(
                vendorWiseServiceId: service.sId ?? "",
                serviceId: serviceId,
                userId: userId,
                isCategory: isCategory,
                isSearch: isSearch,
                isHome: isHome,
                categoryId: categoryId,
              ),preventDuplicates: false,
              );
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
              Get.off(()=>PlannerVendorWiseServiceDetailsView(
                vendorWiseServiceId: service.sId ?? "",
                serviceId: serviceId,
                userId: userId,
                isHome: isHome,
                isSearch: isSearch,
                isCategory: isCategory,
                categoryId: categoryId,
              ), preventDuplicates: false,);
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


  Widget reviewWidget({
    required BuildContext context,
    required PlannerVendorProfileController plannerVendorProfileController}) {
    return Column(
      children: [

        TextHelperClass.headingTextWithoutWidth(
          context: context,
          alignment: Alignment.centerLeft,
          textAlign: TextAlign.start,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          textColor: ColorUtils.black48,
          text: "Reviews from Vendor",
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
                  text: '${plannerVendorProfileController.getAllUserReviewResponseModel.value.data?.avgRating}',
                ),

                SpaceHelperWidget.v(10.h(context)),

                Obx(() {
                  int fullStars = plannerVendorProfileController.getAllUserReviewResponseModel.value.data?.avgRating.floor();
                  num fractional = plannerVendorProfileController.getAllUserReviewResponseModel.value.data?.avgRating - fullStars;
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
                  text: "${plannerVendorProfileController.getAllUserReviewResponseModel.value.data?.ratingCount}",
                ),




              ],
            ),

            SpaceHelperWidget.h(15.w(context)),


            Obx(() {
              final breakdown = plannerVendorProfileController.getAllUserReviewResponseModel.value.data?.ratingBreakdown;

              if (breakdown == null) {
                return const SizedBox();
              }

              final total = plannerVendorProfileController.getAllUserReviewResponseModel.value.data?.ratingCount ?? 0;

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


        ...plannerVendorProfileController.getAllUserReviewResponseModel.value.data!.reviews!.map((r) => reviewItem(r: r,context: context)).toList(),



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
              imageAsset: r.user?.photoUrl == true ? ImageUtils.noImage : null,
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
