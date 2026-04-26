import 'package:flutter/material.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PlannerWithSubscriptionProfileWidget {


  Widget plannerWithSubscriptionProfileWidget({
    required BuildContext context,
    required PlannerProfileViewController plannerProfileViewController,
  }) {
    return Obx(()=> plannerProfileViewController.isLoading.value == true ?
    LoadingHelperWidget.loadingHelperWidget(
      context: context,
      height: 930.h(context),
    ) :
    CustomScrollView(
      slivers: [


        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
            child: Column(
              children: [

                SpaceHelperWidget.v(35.h(context)),

                SizedBox(
                  width: 428.w(context),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [


                      ImageHelperWidget.styledImage(
                        context: context,
                        height: 250.h(context),
                        width: 428.w(context),
                        fit: BoxFit.cover,
                        imageUrl: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.coverPhoto,
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
                          imageUrl: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.photoUrl,
                          imageAsset: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.photoUrl == null ? ImageUtils.noImage : null,
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
                      text: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.name ?? "",
                    ),

                    SpaceHelperWidget.h(12.w(context)),


                    if(plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.isKycVerified == true &&
                        plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.isActiveSubscription == true)...[
                      ImageHelperWidget.assetImageWidget(
                        context: context,
                        height: 25.h(context),
                        width: 25.w(context),
                        imageString: ImageUtils.verifyPaymentImage,
                      ),
                    ] else if(plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.isKycVerified == true)...[
                      ImageHelperWidget.assetImageWidget(
                        context: context,
                        height: 25.h(context),
                        width: 25.w(context),
                        imageString: ImageUtils.verifyImage,
                      )
                    ] else if(plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.isActiveSubscription == true) ...[
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
                              text: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.address ?? "",
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
                              text: '${plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.avgRating} ',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black10,
                            ).toTextSpan(),
                            CustomTextSpan(
                              text: '(${plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.ratingCount} reviews)',
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

                _buildTabs(context: context,plannerProfileViewController: plannerProfileViewController),

                SpaceHelperWidget.v(20.h(context)),

                plannerProfileViewController.selectedTab.value == PlannerProfileTab.overview ?
                _overviewWidget(context: context, plannerProfileViewController: plannerProfileViewController) :
                _settingsView(context: context, plannerProfileViewController: plannerProfileViewController),




              ],
            ),
          ),
        )



      ],
    ));
  }


  Widget _buildTabs({
    required BuildContext context,
    required PlannerProfileViewController plannerProfileViewController,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(child: _tabItem(
          status: PlannerProfileTab.overview,
          title: "Overview",
          context: context,
          plannerProfileViewController: plannerProfileViewController,
        )),
        Expanded(child: _tabItem(
          status: PlannerProfileTab.settings,
          title: "Settings",
          context: context,
          plannerProfileViewController: plannerProfileViewController,)
        ),
      ],
    );
  }

  Widget _tabItem({
    required String title,
    required PlannerProfileTab status,
    required BuildContext context,
    required PlannerProfileViewController plannerProfileViewController,
  }) {
    bool isSelected = plannerProfileViewController.selectedTab.value == status;
    return InkWell(
      onTap: () {
        plannerProfileViewController.changeTab(status);
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

  Widget _overviewWidget({
    required BuildContext context,
    required PlannerProfileViewController plannerProfileViewController,
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
                text: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.bio ?? "",
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

              rowItem(title: "Phone: ",value: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.contractNumber ?? "",context: context),
              rowItem(title: "Email: ",value: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.email ?? "",context: context),
              rowItem(title: "Location",value: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.address ?? "",context: context),


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
                  children: List.generate(plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data!.categories!.length, (index) {
                    return _serviceChip(text: plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data!.categories![index], context: context);
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

            if(plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data?.isNotEmpty == true)...[
              ButtonHelperWidget.customButtonWidget(
                context: context,
                onPressed: () async {
                  Get.off(()=>PlannerProfileServiceView(),preventDuplicates: false);
                },
                text: "See All",
                padding: EdgeInsets.only(left: 14.5.lpm(context)),
                alignment: Alignment.center,
                textColor: ColorUtils.blue96,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                backgroundColor: Colors.transparent,
              ),
            ] else ...[
              SizedBox.shrink(),
            ],

          ],
        ),

        SpaceHelperWidget.v(10.h(context)),


        if(plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data?.isNotEmpty == true) ...[
          if(plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data!.length > 1) ...[
            Row(
              children: [
                Expanded(child: _buildPlannerCard(service: plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data![0], context: context)),
                SpaceHelperWidget.h(12.w(context)),
                Expanded(child: _buildPlannerCard(service: plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data![1], context: context)),
              ],
            )
          ] else ...[
            Column(
              children: List.generate(plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data!.length, (index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20.bpm(context)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r(context)),
                    color: ColorUtils.white243,
                    border: Border.all(
                        color: ColorUtils.white215,
                        width: 1
                    ),
                  ),
                  child: InkWell(
                    onTap: () async {
                      Get.off(()=> PlannerProfileServiceDetailsView(
                        serviceId: plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].sId ?? "",
                        isProfile: true,
                      ), preventDuplicates: false,);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // IMAGE + HEART
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.r(context)),
                                topRight: Radius.circular(12.r(context)),
                              ),
                              child: plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].images?.isEmpty == true ?
                              SpaceHelperWidget.sq(192.h(context), 428.w(context)) :
                              Image.network(
                                plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data![index].images!.first,
                                height: 192.h(context),
                                width: 428.w(context),
                                fit: BoxFit.cover,
                              ),
                            ),
                            plannerProfileViewController.plannerMyProfileDetailsResponseModel.value.data?.type != null ?
                            Positioned(
                              top: 12.h(context),
                              right: 12.w(context),
                              child: InkWell(
                                onTap: () async {
                                  plannerProfileViewController.isLoading.value = true;
                                  await plannerProfileViewController.addFeaturedController(
                                    context: context,
                                    serviceId: plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].sId,
                                  );
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
                                        imageString: plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].isFeatured == true ?
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
                                        text: plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].isFeatured == true ?
                                        "Remove Featured" : "Add Featured",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ) : SizedBox.shrink(),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.hpm(context),vertical: 20.vpm(context)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                textAlign: TextAlign.start,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                textColor: ColorUtils.black48,
                                text: plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].title,
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                textAlign: TextAlign.start,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black80,
                                text: plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].subtitle ?? "",
                                textOverFlow: TextOverflow.ellipsis
                              ),


                              SpaceHelperWidget.v(12.h(context)),

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                textAlign: TextAlign.start,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                textColor: ColorUtils.black48,
                                text: "Service Area",
                              ),

                              SpaceHelperWidget.v(10.h(context)),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 10.h(context),
                                  spacing: 10.w(context),
                                  children: List.generate(plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data![index].serviceAreas!.length, (Index) {
                                    return IntrinsicWidth(
                                      child: TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        alignment: Alignment.centerLeft,
                                        containerColor: ColorUtils.blue219,
                                        padding: EdgeInsets.symmetric(vertical: 2.vpm(context),horizontal: 8.h(context)),
                                        textAlign: TextAlign.start,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        borderRadius: BorderRadius.circular(6.r(context)),
                                        textColor: ColorUtils.blue71,
                                        text: plannerProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].serviceAreas?[Index].name ?? '',
                                      ),
                                    );
                                  }),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
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




        SpaceHelperWidget.v(15.h(context)),


      ],
    );
  }


  Widget _buildPlannerCard({required GetAllFeaturedServiceResponse service,required BuildContext context}) {
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
              Get.off(()=> PlannerProfileServiceDetailsView(serviceId: service.sId ?? "", isProfile: true,), preventDuplicates: false,);
            },
            text:'View Details',
          ),

        ],
      ),
    );
  }

  Widget _serviceChip({required String text,required BuildContext context}) {
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

  Widget _settingsView({
    required BuildContext context,
    required PlannerProfileViewController plannerProfileViewController,
  }) {
    return Column(
      children: [

        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "Edit Profile",
          imagePath: ImageUtils.plannerEditProfileImage,
          onTap: () async {
            Get.off(()=>PlannerProfileEditView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "Change Password",
          imagePath: ImageUtils.plannerChangePasswordImage,
          onTap: () async {
            Get.off(()=>PlannerProfileChangePasswordView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "Services",
          imagePath: ImageUtils.plannerServicesImage,
          onTap: () async {
            Get.off(()=>PlannerProfileServiceView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "Portfolio",
          imagePath: ImageUtils.plannerPortfolioImage,
          onTap: () async {
            Get.off(()=>PlannerProfilePortfolioView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "My Wallet",
          imagePath: ImageUtils.myWalletImage,
          onTap: () async {
            Get.off(()=>PlannerWithdrawView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "Manage Subscription",
          imagePath: ImageUtils.plannerManageSubscriptionImage,
          onTap: () async {
            Get.off(()=>PlannerProfileManageSubscriptionView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "Support",
          imagePath: ImageUtils.supportImage,
          onTap: () async {
            Get.off(()=>PlannerProfileSupportView(),preventDuplicates: false);
          },
        ),

        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "FAQ",
          imagePath: ImageUtils.plannerFaqImage,
          onTap: () async {
            Get.off(()=>PlannerProfileFaqView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "Notification Manage",
          imagePath: ImageUtils.plannerNotificationManageImage,
          onTap: () async {
            Get.off(()=>PlannerProfileNotificationView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "Terms & Condition",
          imagePath: ImageUtils.plannerTermsAndConditionImage,
          onTap: () async {
            Get.off(()=>PlannerProfileTermsAndConditionView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "Privacy & Policy",
          imagePath: ImageUtils.plannerPrivacyAndPolicyImage,
          onTap: () async {
            Get.off(()=>PlannerProfilePrivacyAndPolicyView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "Delete Profile",
          imagePath: ImageUtils.plannerDeleteProfileImage,
          onTap: () async {
            PlannerProfileDialogBoxWidget().plannerDeleteProfileDialog(
              context: context,
              plannerProfileViewController: plannerProfileViewController,
            );
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "Log Out",
          imagePath: ImageUtils.plannerLogOutImage,
          onTap: () async {
            PlannerProfileDialogBoxWidget().plannerLogOutDialog(context: context);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),

      ],
    );
  }



}