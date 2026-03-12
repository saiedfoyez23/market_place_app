import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerVendorView extends StatelessWidget {
  PlannerVendorView({super.key});


  @override
  Widget build(BuildContext context) {
    final PlannerVendorController plannerVendorController = Get.put(PlannerVendorController(context: context));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: plannerVendorController.isLoading.value == true ?
          LoadingHelperWidget.loadingHelperWidget(
            context: context,
            height: 930.h(context),
          ) :
          RefreshIndicator(
            onRefresh: () async {
              Get.off(()=>DashboardPlannerView(index: 2),preventDuplicates: false);
            },
            child: CustomScrollView(
              slivers: [

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
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
                              imageAsset: plannerVendorController.plannerMyProfileDetailsResponseModel.value.data?.photoUrl == null ? ImageUtils.noImage : null,
                              imageUrl: plannerVendorController.plannerMyProfileDetailsResponseModel.value.data?.photoUrl,
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
                                          text: 'Hello!! ',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: ColorUtils.black64
                                      ).toTextSpan(),
                                      CustomTextSpan(
                                        text: plannerVendorController.plannerMyProfileDetailsResponseModel.value.data?.name.toString().split(" ").first ?? "",
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
                                    text: plannerVendorController.plannerMyProfileDetailsResponseModel.value.data?.address ?? "",
                                  ),



                                ],
                              ),
                            ),




                            SpaceHelperWidget.h(15.w(context)),

                            InkWell(
                              onTap: () async {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  barrierColor: Colors.black.withOpacity(0.3),
                                  builder: (context) {
                                    return PlannerCategoryDialogBox();
                                  },
                                );
                              },
                              child: ImageHelperWidget.assetImageWidget(
                                context: context,
                                height: 50.h(context),
                                width: 50.w(context),
                                imageString: ImageUtils.filterSearchImage,
                              ),
                            ),

                            SpaceHelperWidget.h(15.w(context)),

                            InkWell(
                              onTap: () async {
                                Get.off(()=>PlannerOfferView(),preventDuplicates: false);
                              },
                              child: ImageHelperWidget.assetImageWidget(
                                context: context,
                                height: 50.h(context),
                                width: 50.w(context),
                                imageString: ImageUtils.offerImage,
                              ),
                            ),


                          ],
                        ),


                        SpaceHelperWidget.v(32.h(context)),

                      ],
                    ),
                  ),
                ),


                SliverFillRemaining(
                  child: CustomScrollView(
                    slivers: [

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                          child: Column(
                            children: [

                              SpaceHelperWidget.v(16.h(context)),

                              // Search Bar
                              TextFormFieldWidget.build(
                                context: context,
                                hintText: "Search Planner...",
                                controller: plannerVendorController.searchController.value,
                                keyboardType: TextInputType.emailAddress,
                                readOnly: true,
                                onTap: () async {
                                  showDialog(
                                    context: context,
                                    barrierColor: Colors.black.withOpacity(0.3),
                                    builder: (context) {
                                      return PlannerSearchDialogBox();
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

                              // app bar



                            ],
                          ),
                        ),
                      ),

                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context,int index) {
                            return vendorCard(
                              index: index,
                              context: context,
                              plannerVendorController: plannerVendorController,
                            );
                          },
                          childCount: plannerVendorController.getAllVendorServiceResponseModel.value.data?.length,
                        ),
                      ),



                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }


  // ---------------- DYNAMIC CARD ----------------
  Widget vendorCard({
    required PlannerVendorController plannerVendorController,
    required int index,
    required BuildContext context,
  }) {
    var data = plannerVendorController.getAllVendorServiceResponseModel.value.data?[index];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
      child: Container(
        margin: EdgeInsets.only(bottom: 20.bpm(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r(context)),
          color: ColorUtils.white243,
          border: Border.all(
              color: ColorUtils.white215,
              width: 1
          ),
        ),
        child: Column(
          children: [
            imageSection(
              plannerVendorController: plannerVendorController,
              img: data!.images!.first,
              index: index,
              context: context,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.vpm(context)),
              child: Column(
                children: [

                  infoSection(
                    context: context,
                    plannerVendorController: plannerVendorController,
                    index: index,
                  ),

                  buttons(
                    context: context,
                    plannerVendorController: plannerVendorController,
                    index: index,
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
    required PlannerVendorController plannerVendorController,
    required BuildContext context,
  }) {
    var data = plannerVendorController.getAllVendorServiceResponseModel.value.data?[index];
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
        // Positioned(
        //   top: 12.h(context),
        //   right: 12.w(context),
        //   child: data?.isFavorite != false ?
        //   InkWell(
        //     onTap: () async {
        //       await plannerVendorController.createFavoritesController(
        //         context: context,
        //         serviceId: data?.sId,
        //       );
        //     },
        //     child: ImageHelperWidget.assetImageWidget(
        //       context: context,
        //       height: 26.h(context),
        //       width: 26.w(context),
        //       imageString: ImageUtils.unfavoriteIcon,
        //     ),
        //   ) : InkWell(
        //     onTap: () async {
        //       await plannerVendorController.createFavoritesController(
        //         context: context,
        //         serviceId: data?.sId,
        //       );
        //     },
        //     child: ImageHelperWidget.assetImageWidget(
        //       context: context,
        //       height: 26.h(context),
        //       width: 26.w(context),
        //       imageString: ImageUtils.favoriteIcon,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  // ---------------- INFO ----------------
  Widget infoSection({
    required PlannerVendorController plannerVendorController,
    required BuildContext context,
    required int index,
  }) {
    var data = plannerVendorController.getAllVendorServiceResponseModel.value.data?[index];
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

              data?.author?.isKycVerified == true ?
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
              ) :
              SizedBox.shrink(),


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
                text: data?.category?.title ?? '',
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
                        text: '${data?.author?.avgRating ?? "0"} ',
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
            text: data?.subtitle,
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
    required PlannerVendorController plannerVendorController,
    required BuildContext context,
    required int index,
  }) {
    var data = plannerVendorController.getAllVendorServiceResponseModel.value.data?[index];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.hpm(context)),
      child: Row(
        children: [

          Expanded(
            child: ButtonHelperWidget.customButtonWidgetAdventPro(
              context: context,
              onPressed: () async {
                Get.off(()=>DashboardPlannerView(index: 3),preventDuplicates: false);
              },
              text: "Message",
            ),
          ),

          SpaceHelperWidget.h(16.w(context)),

          Expanded(
            child: ButtonHelperWidget.customButtonWidgetAdventPro(
              context: context,
              onPressed: () async {
                Get.off(()=>PlannerServiceDetailsView(
                  serviceId: data?.sId ?? "",
                  isCategory: false,
                  isHome: true,
                  categoryId: "",
                  isSearch: false,
                ),preventDuplicates: false);
              },
              text: "View Details",
              textColor: ColorUtils.blue96,
              backgroundColor: ColorUtils.blue206,
            ),
          ),

        ],
      ),
    );
  }
}