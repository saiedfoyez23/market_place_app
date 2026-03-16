import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerVendorProfileFeatureView extends StatelessWidget {
  const PlannerVendorProfileFeatureView({
    super.key,
    required this.serviceId,
    required this.userId,
    required this.isHome,
    required this.isCategory,
    required this.isSearch,
    required this.categoryId
  });

  final String serviceId;
  final String userId;
  final bool isHome;
  final bool isCategory;
  final bool isSearch;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    final PlannerVendorProfileFeatureController plannerVendorProfileFeatureController = Get.put(PlannerVendorProfileFeatureController(
        context: context, userId: userId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>PlannerVendorProfileView(
          serviceId: serviceId,
          userId: userId,
          isHome: isHome,
          isCategory: isCategory,
          isSearch: isSearch,
          categoryId: categoryId,
        ),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white255,
            ),
            child: plannerVendorProfileFeatureController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            RefreshIndicator(
              onRefresh: () async {
                Get.off(()=>PlannerVendorProfileFeatureView(
                  serviceId: serviceId,
                  userId: userId,
                  isSearch: isSearch,
                  isCategory: isCategory,
                  isHome: isHome,
                  categoryId: categoryId,
                ),preventDuplicates: false);
              },
              child: CustomScrollView(
                slivers: [


                  AuthAppBarHelperWidget(
                    onBackPressed: () async {
                      Get.off(()=>PlannerVendorProfileView(
                        serviceId: serviceId,
                        userId: userId,
                        isSearch: isSearch,
                        isCategory: isCategory,
                        isHome: isHome,
                        categoryId: categoryId,
                      ),preventDuplicates: false);
                    },
                    title: "Feature List",
                  ),


                  plannerVendorProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?.isNotEmpty == true ?
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context,int index) {
                        return vendorCard(
                          index: index,
                          context: context,
                          plannerVendorProfileFeatureController: plannerVendorProfileFeatureController,
                        );
                      },
                      childCount: plannerVendorProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?.length,
                    ),
                  ) :
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                      child: SizedBox(
                        height: 630.h(context),
                        width: 428.w(context),
                        child: Align(
                          alignment: Alignment.center,
                          child: TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.center,
                            textAlign: TextAlign.start,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            textColor: ColorUtils.black48,
                            text: "No Feature Service Available",
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        )),
      ),
    );
  }


  // ---------------- DYNAMIC CARD ----------------
  Widget vendorCard({
    required int index,
    required BuildContext context,
    required PlannerVendorProfileFeatureController plannerVendorProfileFeatureController,
  }) {
    var data = plannerVendorProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
      child: Container(
        margin: EdgeInsets.only(bottom: 20.bpm(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r(context)),
          color: ColorUtils.white243,
          border: Border.all(
            color: ColorUtils.white215,
            width: 1,
          ),
        ),
        child: Column(
          children: [


            imageSection(
              img: data!.images!.first,
              index: index,
              context: context,
              plannerVendorProfileFeatureController: plannerVendorProfileFeatureController,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.vpm(context)),
              child: Column(
                children: [

                  infoSection(
                    index: index,
                    context: context,
                    plannerVendorProfileFeatureController: plannerVendorProfileFeatureController,
                  ),

                  buttons(
                    index: index,
                    context: context,
                    plannerVendorProfileFeatureController: plannerVendorProfileFeatureController,
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  // ---------------- IMAGE ----------------
  Widget imageSection({
    required String img,
    required int index,
    required BuildContext context,
    required PlannerVendorProfileFeatureController plannerVendorProfileFeatureController,
  }) {
    var data = plannerVendorProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index];

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r(context)),
            topRight: Radius.circular(12.r(context)),
          ),
          child: Image.network(
            img,
            height: 192.h(context),
            width: 428.w(context),
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  // ---------------- INFO ----------------
  Widget infoSection({
    required int index,
    required BuildContext context,
    required PlannerVendorProfileFeatureController plannerVendorProfileFeatureController,
  }) {
    var data = plannerVendorProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.hpm(context)),
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
                imageAsset: data?.author?.photoUrl == null ? ImageUtils.noImage : null,
                imageUrl: data?.author?.photoUrl,
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
                  text: data?.author?.name ?? "",
                ),
              ),

              SpaceHelperWidget.h(6.w(context)),

              if(data?.author?.isKycVerified == true)...[
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
                )
              ] else...[
                SizedBox.shrink()
              ]



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
                text: data?.category?.title ?? "",
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
                        text: '${data?.author?.avgRating} ',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black10,
                      ).toTextSpan(),
                      CustomTextSpan(
                        text: '(${data?.author?.ratingCount} reviews)',
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


          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: data?.title ?? "",
          ),

          SpaceHelperWidget.v(6.h(context)),


          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black80,
            text: data?.subtitle ?? "",
          ),


          SpaceHelperWidget.v(12.h(context)),

          Row(
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
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black94,
                  text: data?.address ?? "",
                ),
              ),


            ],
          ),


          SpaceHelperWidget.v(24.h(context)),


        ],
      ),
    );
  }

  // ---------------- BUTTONS ----------------
  Widget buttons({
    required int index,
    required BuildContext context,
    required PlannerVendorProfileFeatureController plannerVendorProfileFeatureController,
  }) {
    var data = plannerVendorProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index];
    return Obx(()=>Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.hpm(context)),
      child: Row(
        children: [

          Expanded(
            child: plannerVendorProfileFeatureController.serviceId.value == plannerVendorProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index].sId && plannerVendorProfileFeatureController.isCreate.value == true ?
            LoadingHelperWidget.loadingHelperWidget(context: context) :
            ButtonHelperWidget.customButtonWidgetAdventPro(
              context: context,
              onPressed: () async {
                plannerVendorProfileFeatureController.serviceId.value = plannerVendorProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index].sId;
                plannerVendorProfileFeatureController.isCreate.value = true;
                Map<String,dynamic> data = {
                  "modelType": "User",
                  "participants": [
                    plannerVendorProfileFeatureController.getAllFeaturedServiceResponseModel.value.data?[index].author?.sId // connected profile id
                  ]
                };
                await plannerVendorProfileFeatureController.createMessageController(context: context, data: data);
              },
              text: "Message",
            ),
          ),
          SpaceHelperWidget.h(16.w(context)),

          Expanded(
            child: ButtonHelperWidget.customButtonWidgetAdventPro(
              context: context,
              onPressed: () async {
                Get.off(()=>PlannerVendorWiseServiceDetailsView(
                  vendorWiseServiceId: data?.sId ?? "",
                  serviceId: serviceId,
                  userId: userId,
                  isCategory: isCategory,
                  isSearch: isSearch,
                  isHome: isHome,
                  categoryId: categoryId,
                ),preventDuplicates: false,);
              },
              text: "View Details",
              textColor: ColorUtils.blue96,
              backgroundColor: ColorUtils.blue206,
            ),
          ),

        ],
      ),
    ));
  }
}
