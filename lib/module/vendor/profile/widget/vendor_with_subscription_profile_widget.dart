import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:url_launcher/url_launcher.dart';

class VendorWithSubscriptionProfileWidget {

  Widget vendorWithSubscriptionProfileWidget({
    required BuildContext context,
    required VendorProfileViewController vendorProfileViewController,
  }) {
    return Obx(()=> vendorProfileViewController.isLoading.value == true ?
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
                        imageUrl: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.coverPhoto,
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
                          imageUrl: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.photoUrl,
                          imageAsset: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.photoUrl == null ? ImageUtils.noImage : null,
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
                      text: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.name ?? "",
                    ),

                    SpaceHelperWidget.h(12.w(context)),

                    if(vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.isKycVerified == true &&
                        vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.isActiveSubscription == true)...[
                          ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 25.h(context),
                            width: 25.w(context),
                            imageString: ImageUtils.verifyPaymentImage,
                          ),
                    ] else if(vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.isKycVerified == true)...[
                      ImageHelperWidget.assetImageWidget(
                        context: context,
                        height: 25.h(context),
                        width: 25.w(context),
                        imageString: ImageUtils.verifyImage,
                      )
                    ] else if(vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.isActiveSubscription == true) ...[
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
                              text: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.address ?? "",
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
                              text: '${vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.avgRating} ',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black10,
                            ).toTextSpan(),
                            CustomTextSpan(
                              text: '(${vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.ratingCount} reviews)',
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

                _buildTabs(context: context,vendorProfileViewController: vendorProfileViewController),

                SpaceHelperWidget.v(20.h(context)),

                vendorProfileViewController.selectedTab.value == VendorProfileTab.overview ?
                _overviewWidget(context: context, vendorProfileViewController: vendorProfileViewController) :
                _settingsView(context: context, vendorProfileViewController: vendorProfileViewController),




              ],
            ),
          ),
        )



      ],
    ));
  }


  Widget _buildTabs({
    required BuildContext context,
    required VendorProfileViewController vendorProfileViewController,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(child: _tabItem(
          status: VendorProfileTab.overview,
          title: "Overview",
          context: context,
          vendorProfileViewController: vendorProfileViewController,
        )),
        Expanded(child: _tabItem(
          status: VendorProfileTab.settings,
          title: "Settings",
          context: context,
          vendorProfileViewController: vendorProfileViewController,)
        ),
      ],
    );
  }

  Widget _tabItem({
    required String title,
    required VendorProfileTab status,
    required BuildContext context,
    required VendorProfileViewController vendorProfileViewController,
  }) {
    bool isSelected = vendorProfileViewController.selectedTab.value == status;
    return InkWell(
      onTap: () {
        vendorProfileViewController.changeTab(status);
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
    required VendorProfileViewController vendorProfileViewController,
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
                text: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.bio ?? "",
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

              rowItem(title: "Phone: ",value: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.contractNumber ?? "",context: context),
              rowItem(title: "Email: ",value: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.email ?? "",context: context),
              rowItem(title: "Location",value: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.address ?? "",context: context),


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
                  children: List.generate(vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data!.categories!.length, (index) {
                    return _serviceChip(text: vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data!.categories![index], context: context);
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

            if(vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data?.isNotEmpty == true)...[
              ButtonHelperWidget.customButtonWidget(
                context: context,
                onPressed: () async {
                  Get.off(()=>DashboardVendorView(index: 1),preventDuplicates: false);
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


        if(vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data?.isNotEmpty == true) ...[
          if(vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data!.length > 1) ...[
            Row(
              children: [
                Expanded(child: _buildPlannerCard(service: vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data![0], context: context)),
                SpaceHelperWidget.h(12.w(context)),
                Expanded(child: _buildPlannerCard(service: vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data![1], context: context)),
              ],
            )
          ] else ...[
            Column(
              children: List.generate(vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data!.length, (index) {
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
                      Get.off(()=>VendorServiceDetailsView(serviceId: vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].sId),preventDuplicates: false);
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
                              child: vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].images?.isEmpty == true ?
                              SpaceHelperWidget.sq(192.h(context), 428.w(context)) :
                              Image.network(
                                vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data![index].images!.first,
                                height: 192.h(context),
                                width: 428.w(context),
                                fit: BoxFit.cover,
                              ),
                            ),
                            vendorProfileViewController.vendorMyProfileDetailsResponseModel.value.data?.type == "pro" ?
                            Positioned(
                              top: 12.h(context),
                              right: 12.w(context),
                              child: InkWell(
                                onTap: () async {
                                  await vendorProfileViewController.addFeaturedController(context: context, serviceId: vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].sId);
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
                                        imageString:vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].isFeatured == true ?
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
                                        text: vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].isFeatured == true ?
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
                                text:  vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].title,
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                textAlign: TextAlign.start,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black80,
                                text:  vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].subtitle ?? "",
                              ),


                              SpaceHelperWidget.v(12.h(context)),

                              InkWell(
                                onTap: () async {
                                  if (await canLaunchUrl(Uri.parse(vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].locationUrl))) {
                                    await launchUrl(Uri.parse(vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].locationUrl), mode: LaunchMode.externalApplication);
                                  }
                                },
                                child: Row(
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        textColor: ColorUtils.black94,
                                        text: vendorProfileViewController.getAllFeaturedServiceResponseModel.value.data?[index].address,
                                      ),
                                    ),


                                  ],
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
              Get.off(()=>VendorServiceDetailsView(serviceId: service.sId ?? ""),preventDuplicates: false);
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
    required VendorProfileViewController vendorProfileViewController,
  }) {
    return Column(
      children: [

        VendorProfileViewButton().vendorProfileViewButton(
          context: context,
          title: "Edit Profile",
          imagePath: ImageUtils.plannerEditProfileImage,
          onTap: () async {
            Get.off(()=>VendorProfileEditView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        VendorProfileViewButton().vendorProfileViewButton(
          context: context,
          title: "Change Password",
          imagePath: ImageUtils.plannerChangePasswordImage,
          onTap: () async {
            Get.off(()=>VendorProfileChangePasswordView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        VendorProfileViewButton().vendorProfileViewButton(
          context: context,
          title: "Portfolio",
          imagePath: ImageUtils.plannerPortfolioImage,
          onTap: () async {
            Get.off(()=>VendorProfilePortfolioView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        VendorProfileViewButton().vendorProfileViewButton(
          context: context,
          title: "Manage Subscription",
          imagePath: ImageUtils.plannerManageSubscriptionImage,
          onTap: () async {
            Get.off(()=>VendorProfileManageSubscriptionView(),preventDuplicates: false);
          },
        ),

        SpaceHelperWidget.v(16.h(context)),


        PlannerProfileViewButton().plannerProfileViewButton(
          context: context,
          title: "Support",
          imagePath: ImageUtils.supportImage,
          onTap: () async {
            Get.off(()=>VendorProfileSupportView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        VendorProfileViewButton().vendorProfileViewButton(
          context: context,
          title: "FAQ",
          imagePath: ImageUtils.plannerFaqImage,
          onTap: () async {
            Get.off(()=>VendorProfileFaqView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        VendorProfileViewButton().vendorProfileViewButton(
          context: context,
          title: "Notification Manage",
          imagePath: ImageUtils.plannerNotificationManageImage,
          onTap: () async {
            Get.off(()=>VendorProfileNotificationView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        VendorProfileViewButton().vendorProfileViewButton(
          context: context,
          title: "Terms & Condition",
          imagePath: ImageUtils.plannerTermsAndConditionImage,
          onTap: () async {
            Get.off(()=>VendorProfileTermsAndConditionView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        VendorProfileViewButton().vendorProfileViewButton(
          context: context,
          title: "Privacy & Policy",
          imagePath: ImageUtils.plannerPrivacyAndPolicyImage,
          onTap: () async {
            Get.off(()=>VendorProfilePrivacyAndPolicyView(),preventDuplicates: false);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        VendorProfileViewButton().vendorProfileViewButton(
          context: context,
          title: "Delete Profile",
          imagePath: ImageUtils.plannerDeleteProfileImage,
          onTap: () async {
            VendorProfileDialogBoxWidget().vendorDeleteProfileDialog(context: context,vendorProfileViewController: vendorProfileViewController);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),


        VendorProfileViewButton().vendorProfileViewButton(
          context: context,
          title: "Log Out",
          imagePath: ImageUtils.plannerLogOutImage,
          onTap: () async {
            VendorProfileDialogBoxWidget().vendorLogOutDialog(context: context);
          },
        ),


        SpaceHelperWidget.v(16.h(context)),

      ],
    );
  }

}