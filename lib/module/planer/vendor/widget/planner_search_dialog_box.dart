import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class PlannerSearchDialogBox extends StatelessWidget {
  PlannerSearchDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    final PlannerSearchController plannerSearchController = Get.put(PlannerSearchController(context: context));
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.r(context)),
      ),
      child: Obx(()=>Container(
        height: 930.h(context),
        width: 428.w(context),
        padding: EdgeInsets.symmetric(horizontal: 20.hpm(context),vertical: 20.vpm(context)),
        decoration: BoxDecoration(
          color: ColorUtils.white251,
        ),
        child: plannerSearchController.isLoading.value == true ?
        LoadingHelperWidget.loadingHelperWidget(
          context: context,
          height: 930.h(context),
        ) :
        CustomScrollView(
          slivers: [

            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Search Field
                  TextFormFieldWidget.build(
                    context: context,
                    hintText: "Search Planner Or Category....",
                    controller: plannerSearchController.searchController.value,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) async {
                      if(value?.isEmpty == true) {
                        plannerSearchController.getAllVendorSearchResponseModel.value = GetAllVendorSearchResponseModel();
                      } else {
                        await plannerSearchController.getVendorSearchController(context: context, search: value!);
                      }
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


                  plannerSearchController.getAllVendorSearchResponseModel.value.data == null ?
                  Column(
                    children: [

                      plannerSearchController.plannerSearchResponseModel.value.data?.popularCategories != null ?
                      Column(
                        children: [

                          SpaceHelperWidget.v(20.h(context)),


                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            textColor: ColorUtils.black96,
                            text: "Popular Searches",
                          ),

                          SpaceHelperWidget.v(15.h(context)),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              runSpacing: 10.h(context),
                              spacing: 10.w(context),
                              children: List.generate(plannerSearchController.plannerSearchResponseModel.value.data!.popularCategories!.length, (index) {
                                return Obx(()=>IntrinsicWidth(
                                  child: ButtonHelperWidget.customButtonWidget(
                                    context: context,
                                    height: 56.h(context),
                                    padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                    backgroundColor: plannerSearchController.popularCategory.value == plannerSearchController.plannerSearchResponseModel.value.data!.popularCategories?[index].sId ?
                                    ColorUtils.orange119 :
                                    ColorUtils.white243,
                                    textColor: plannerSearchController.popularCategory.value == plannerSearchController.plannerSearchResponseModel.value.data!.popularCategories?[index].sId ?
                                    ColorUtils.white255 :
                                    ColorUtils.black89,
                                    fontWeight: FontWeight.w500,
                                    onPressed: () async {
                                      Get.back();
                                      Get.delete<PlannerSearchController>(force: true);
                                      plannerSearchController.popularCategory.value = plannerSearchController.plannerSearchResponseModel.value.data!.popularCategories?[index].sId;
                                      Get.off(()=>PlannerCategoryWiseServiceView(categoryId: plannerSearchController.plannerSearchResponseModel.value.data!.popularCategories?[index].sId),preventDuplicates: false);
                                    },
                                    text: plannerSearchController.plannerSearchResponseModel.value.data!.popularCategories?[index].title ?? "",
                                  ),
                                ));
                              }),
                            ),
                          ),

                        ],
                      ) :
                      SizedBox.shrink(),

                      SpaceHelperWidget.v(20.h(context)),


                      plannerSearchController.plannerSearchResponseModel.value.data?.suggestVendor != null ?
                      Column(
                        children: [

                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            textColor: ColorUtils.black96,
                            text: "Suggested Vendor",
                          ),

                          SpaceHelperWidget.v(15.h(context)),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              runSpacing: 10.h(context),
                              spacing: 10.w(context),
                              children: List.generate(plannerSearchController.plannerSearchResponseModel.value.data!.suggestVendor!.length, (index) {
                                return Obx(()=>IntrinsicWidth(
                                  child: ButtonHelperWidget.customButtonWidget(
                                    context: context,
                                    height: 56.h(context),
                                    padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                    backgroundColor: plannerSearchController.suggestedVendor.value == plannerSearchController.plannerSearchResponseModel.value.data?.suggestVendor?[index].sId ?
                                    ColorUtils.orange119 :
                                    ColorUtils.white243,
                                    textColor: plannerSearchController.suggestedVendor.value == plannerSearchController.plannerSearchResponseModel.value.data?.suggestVendor?[index].sId ?
                                    ColorUtils.white255 :
                                    ColorUtils.black89,
                                    fontWeight: FontWeight.w500,
                                    onPressed: () async {
                                      Get.back();
                                      Get.delete<PlannerSearchController>(force: true);
                                      plannerSearchController.suggestedVendor.value = plannerSearchController.plannerSearchResponseModel.value.data?.suggestVendor?[index].sId;
                                      Get.off(()=>PlannerVendorProfileView(
                                        categoryId: "",
                                        isSearch: true,
                                        isCategory: false,
                                        isHome: false,
                                        serviceId: "",
                                        userId: plannerSearchController.plannerSearchResponseModel.value.data?.suggestVendor?[index].sId,
                                      ), preventDuplicates: false);
                                    },
                                    text: plannerSearchController.plannerSearchResponseModel.value.data?.suggestVendor?[index].name ?? "",
                                  ),
                                ));
                              }),
                            ),
                          ),

                        ],
                      ) :
                      SizedBox.shrink(),

                      SpaceHelperWidget.v(20.h(context)),


                      plannerSearchController.plannerSearchResponseModel.value.data?.trendingCategories != null ?
                      Column(
                        children: [

                          TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            textColor: ColorUtils.black96,
                            text: "Trending Categories",
                          ),

                          SpaceHelperWidget.v(15.h(context)),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              runSpacing: 10.h(context),
                              spacing: 10.w(context),
                              children: List.generate(plannerSearchController.plannerSearchResponseModel.value.data!.trendingCategories!.length, (index) {
                                return Obx(()=>IntrinsicWidth(
                                  child: ButtonHelperWidget.customButtonWidget(
                                    context: context,
                                    height: 56.h(context),
                                    padding: EdgeInsets.symmetric(horizontal: 8.5.hpm(context),vertical: 8.5.vpm(context)),
                                    backgroundColor: plannerSearchController.trendingCategories.value == plannerSearchController.plannerSearchResponseModel.value.data?.trendingCategories?[index].sId ?
                                    ColorUtils.orange119 :
                                    ColorUtils.white243,
                                    textColor: plannerSearchController.trendingCategories.value  == plannerSearchController.plannerSearchResponseModel.value.data?.trendingCategories?[index].sId ?
                                    ColorUtils.white255 :
                                    ColorUtils.black89,
                                    fontWeight: FontWeight.w500,
                                    onPressed: () async {
                                      Get.back();
                                      Get.delete<PlannerSearchController>(force: true);
                                      plannerSearchController.trendingCategories.value = plannerSearchController.plannerSearchResponseModel.value.data?.trendingCategories?[index].sId;
                                      Get.off(()=>PlannerCategoryWiseServiceView(categoryId: plannerSearchController.plannerSearchResponseModel.value.data!.popularCategories?[index].sId),preventDuplicates: false);
                                    },
                                    text: plannerSearchController.plannerSearchResponseModel.value.data?.trendingCategories?[index].title ?? "",
                                  ),
                                ));
                              }),
                            ),
                          ),

                        ],
                      ) :
                      SizedBox.shrink(),


                      SpaceHelperWidget.v(24.h(context)),

                      /// Recent Search
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black61,
                              text: "Recent Search",
                            ),
                          ),

                          SpaceHelperWidget.h(6.h(context)),

                          ButtonHelperWidget.customButtonWidget(
                            context: context,
                            onPressed: () async {
                              await plannerSearchController.clearHistoryController(context: context);
                            },
                            text: "Clear All",
                            padding: EdgeInsets.only(left: 14.5.lpm(context)),
                            alignment: Alignment.center,
                            textColor: ColorUtils.blue96,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            backgroundColor: Colors.transparent,
                          ),


                        ],
                      ),

                      SpaceHelperWidget.v(14.h(context)),

                      if(plannerSearchController.plannerSearchResponseModel.value.data?.searchHistory
                          ?.where((value) => value.modelType == "User").toList().isNotEmpty == true)...[
                        Column(
                          children: [

                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black61,
                              text: "User",
                            ),

                            Divider(thickness: .5,color: ColorUtils.gray170,),

                            Obx(() {
                              final userList = plannerSearchController.
                              plannerSearchResponseModel.value.data?.searchHistory
                                  ?.where((value) => value.modelType == "User")
                                  .toList() ?? [];
                              return Column(
                                children: List.generate(userList.length, (index) {
                                  final user = userList[index].user;

                                  return Column(
                                    children: [

                                      InkWell(
                                        onTap: () async {
                                          Get.back();
                                          Get.delete<PlannerSearchController>(force: true);
                                          Get.off(()=>PlannerVendorProfileView(
                                            serviceId: "",
                                            userId: user?.sId ?? "",
                                            isHome: false,
                                            isCategory: false,
                                            isSearch: true,
                                            categoryId: "",
                                          ), preventDuplicates: false);
                                        },
                                        child: Row(
                                          children: [

                                            ImageHelperWidget.circleImageHelperWidget(
                                              width: 40.w(context),
                                              height: 40.h(context),
                                              verticalPadding: 2.vpm(context),
                                              horizontalPadding: 2.hpm(context),
                                              backgroundColor: ColorUtils.orange213,
                                              radius: 20.r(context),
                                              imageAsset: user?.photoUrl == null ? ImageUtils.noImage : null,
                                              imageUrl: user?.photoUrl,
                                            ),

                                            SpaceHelperWidget.h(12.w(context)),

                                            Expanded(
                                              child: TextHelperClass.headingTextWithoutWidth(
                                                context: context,
                                                alignment: Alignment.centerLeft,
                                                textAlign: TextAlign.start,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                textColor: ColorUtils.black48,
                                                text: user?.name,
                                              ),
                                            ),

                                            SpaceHelperWidget.h(12.w(context)),


                                            InkWell(
                                              onTap: () async {
                                                await plannerSearchController.deleteHistoryController(context: context, searchId: userList[index].sId);
                                              },
                                              child: ImageHelperWidget.assetImageWidget(
                                                context: context,
                                                height: 30.h(context),
                                                width: 30.w(context),
                                                imageString: ImageUtils.cancelButtonImage,
                                              ),
                                            ),


                                          ],
                                        ),
                                      ),

                                      SpaceHelperWidget.v(10.h(context)),
                                    ],
                                  );
                                }),
                              );
                            }),

                            SpaceHelperWidget.v(14.h(context)),

                          ],
                        ),
                      ] else...[
                        SizedBox.shrink(),
                      ],




                      if(plannerSearchController.plannerSearchResponseModel.value.data?.searchHistory
                          ?.where((value) => value.modelType == "Service").toList().isNotEmpty == true)...[
                        Column(
                          children: [


                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black61,
                              text: "Service",
                            ),

                            Divider(thickness: .5,color: ColorUtils.gray170,),

                            Obx(() {
                              final userList = plannerSearchController.
                              plannerSearchResponseModel.value.data?.searchHistory
                                  ?.where((value) => value.modelType == "Service")
                                  .toList() ?? [];
                              return Column(
                                children: List.generate(userList.length, (index) {
                                  final service = userList[index].service;

                                  return Column(
                                    children: [

                                      InkWell(
                                        onTap: () async {
                                          Get.back();
                                          Get.delete<PlannerSearchController>(force: true);
                                          Get.off(()=>PlannerServiceDetailsView(
                                            serviceId: service?.sId ?? "",
                                            isHome: true,
                                            isCategory: false,
                                            isSearch: false,
                                            categoryId: "",
                                          ), preventDuplicates: false);
                                        },
                                        child: Row(
                                          children: [

                                            ImageHelperWidget.circleImageHelperWidget(
                                              width: 40.w(context),
                                              height: 40.h(context),
                                              verticalPadding: 2.vpm(context),
                                              horizontalPadding: 2.hpm(context),
                                              backgroundColor: ColorUtils.orange213,
                                              radius: 20.r(context),
                                              imageAsset: service?.images?.isEmpty == true ? ImageUtils.noImage : null,
                                              imageUrl: service?.images?.first,
                                            ),

                                            SpaceHelperWidget.h(12.w(context)),

                                            Expanded(
                                              child: TextHelperClass.headingTextWithoutWidth(
                                                context: context,
                                                alignment: Alignment.centerLeft,
                                                textAlign: TextAlign.start,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                textColor: ColorUtils.black48,
                                                text: service?.title,
                                              ),
                                            ),

                                            SpaceHelperWidget.h(12.w(context)),


                                            InkWell(
                                              onTap: () async {
                                                await plannerSearchController.deleteHistoryController(context: context, searchId: userList[index].sId);
                                              },
                                              child: ImageHelperWidget.assetImageWidget(
                                                context: context,
                                                height: 30.h(context),
                                                width: 30.w(context),
                                                imageString: ImageUtils.cancelButtonImage,
                                              ),
                                            ),


                                          ],
                                        ),
                                      ),
                                      SpaceHelperWidget.v(10.h(context)),
                                    ],
                                  );
                                }),
                              );
                            }),

                            SpaceHelperWidget.v(14.h(context)),

                          ],
                        ),
                      ] else...[
                        SizedBox.shrink(),
                      ],


                      if(plannerSearchController.plannerSearchResponseModel.value
                          .data?.searchHistory?.where((value) => value.modelType == "Category")
                          .toList().isNotEmpty == true)...[
                        Column(
                          children: [
                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black61,
                              text: "Category",
                            ),

                            Divider(thickness: .5,color: ColorUtils.gray170,),

                            Obx(() {
                              final categoryList = plannerSearchController.
                              plannerSearchResponseModel.value.data?.searchHistory
                                  ?.where((value) => value.modelType == "Category")
                                  .toList() ?? [];
                              return Column(
                                children: List.generate(categoryList.length, (index) {
                                  final category = categoryList[index].category;

                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          Get.back();
                                          Get.delete<UserSearchController>(force: true);
                                          Get.off(()=>PlannerCategoryWiseServiceView(categoryId: category?.sId ?? "",),preventDuplicates: false);
                                        },
                                        child: Row(
                                          children: [

                                            ImageHelperWidget.circleImageHelperWidget(
                                              width: 40.w(context),
                                              height: 40.h(context),
                                              verticalPadding: 2.vpm(context),
                                              horizontalPadding: 2.hpm(context),
                                              backgroundColor: ColorUtils.orange213,
                                              radius: 20.r(context),
                                              imageAsset: category?.logo == null ? ImageUtils.noImage : null,
                                              imageUrl: category?.logo,
                                            ),

                                            SpaceHelperWidget.h(12.w(context)),

                                            Expanded(
                                              child: TextHelperClass.headingTextWithoutWidth(
                                                context: context,
                                                alignment: Alignment.centerLeft,
                                                textAlign: TextAlign.start,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                textColor: ColorUtils.black48,
                                                text: category?.title,
                                              ),
                                            ),

                                            SpaceHelperWidget.h(12.w(context)),


                                            InkWell(
                                              onTap: () async {
                                                await plannerSearchController.deleteHistoryController(context: context, searchId: categoryList[index].sId);
                                              },
                                              child: ImageHelperWidget.assetImageWidget(
                                                context: context,
                                                height: 30.h(context),
                                                width: 30.w(context),
                                                imageString: ImageUtils.cancelButtonImage,
                                              ),
                                            ),


                                          ],
                                        ),
                                      ),
                                      SpaceHelperWidget.v(10.h(context)),
                                    ],
                                  );
                                }),
                              );
                            }),

                            SpaceHelperWidget.v(14.h(context)),
                          ],
                        ),
                      ] else...[
                        SizedBox.shrink(),
                      ],








                    ],
                  ) :
                  Column(
                    children: [

                      if(plannerSearchController.getAllVendorSearchResponseModel.value.data?.user?.toList().isNotEmpty == true)...[
                        Column(
                          children: [

                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black61,
                              text: "User",
                            ),

                            Divider(thickness: .5,color: ColorUtils.gray170,),

                            Obx(() {
                              final userList = plannerSearchController.getAllVendorSearchResponseModel.value.data?.user?.toList();

                              return Column(
                                children: List.generate(userList!.length, (index) {
                                  final user = userList[index];
                                  return InkWell(
                                    onTap: () async {
                                      Map<String,dynamic> data = {
                                        "modelType": "User", // here modelType is: User | Service | Category
                                        "refId": user.sId,
                                      };
                                      await plannerSearchController.createHistoryController(
                                        context: context,
                                        data: data,
                                        onComplete: () async {
                                          Get.back();
                                          Get.delete<PlannerSearchController>(force: true);
                                          Get.off(()=>PlannerVendorProfileView(
                                            serviceId: "",
                                            userId: user.sId ?? "",
                                            isHome: false,
                                            isCategory: false,
                                            isSearch: true,
                                            categoryId: "",
                                          ),preventDuplicates: false);
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [

                                            ImageHelperWidget.circleImageHelperWidget(
                                              width: 40.w(context),
                                              height: 40.h(context),
                                              verticalPadding: 2.vpm(context),
                                              horizontalPadding: 2.hpm(context),
                                              backgroundColor: ColorUtils.orange213,
                                              radius: 20.r(context),
                                              imageAsset: user.photoUrl == null ? ImageUtils.noImage : null,
                                              imageUrl: user.photoUrl,
                                            ),

                                            SpaceHelperWidget.h(12.w(context)),

                                            Expanded(
                                              child: TextHelperClass.headingTextWithoutWidth(
                                                context: context,
                                                alignment: Alignment.centerLeft,
                                                textAlign: TextAlign.start,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                textColor: ColorUtils.black48,
                                                text: user.name ?? "",
                                              ),
                                            ),

                                          ],
                                        ),
                                        SpaceHelperWidget.v(10.h(context)),
                                      ],
                                    ),
                                  );
                                }),
                              );
                            }),


                            SpaceHelperWidget.v(14.h(context)),

                          ],
                        )
                      ] else...[
                        SizedBox.shrink()
                      ],


                      if(plannerSearchController.getAllVendorSearchResponseModel.value.data?.service?.toList().isNotEmpty == true)...[
                        Column(
                          children: [
                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black61,
                              text: "Service",
                            ),

                            Divider(thickness: .5,color: ColorUtils.gray170,),

                            Obx(() {
                              final serviceList = plannerSearchController.getAllVendorSearchResponseModel.value.data?.service?.toList();
                              return Column(
                                children: List.generate(serviceList!.length, (index) {
                                  final service = serviceList[index];

                                  return InkWell(
                                    onTap: () async {
                                      Map<String,dynamic> data = {
                                        "modelType": "Service", // here modelType is: User | Service | Category
                                        "refId": service.sId,
                                      };
                                      await plannerSearchController.createHistoryController(
                                        context: context,
                                        data: data,
                                        onComplete: () async {
                                          Get.back();
                                          Get.delete<PlannerSearchController>(force: true);
                                          Get.off(()=>PlannerServiceDetailsView(
                                            isSearch: false,
                                            isHome: true,
                                            serviceId: service.sId ?? "",
                                            categoryId: "",
                                            isCategory: false,
                                          ),preventDuplicates: false);
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [

                                            ImageHelperWidget.circleImageHelperWidget(
                                              width: 40.w(context),
                                              height: 40.h(context),
                                              verticalPadding: 2.vpm(context),
                                              horizontalPadding: 2.hpm(context),
                                              backgroundColor: ColorUtils.orange213,
                                              radius: 20.r(context),
                                              imageAsset: service.images?.isEmpty == true ? ImageUtils.noImage : null,
                                              imageUrl: service.images?.first,
                                            ),

                                            SpaceHelperWidget.h(12.w(context)),

                                            Expanded(
                                              child: TextHelperClass.headingTextWithoutWidth(
                                                context: context,
                                                alignment: Alignment.centerLeft,
                                                textAlign: TextAlign.start,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                textColor: ColorUtils.black48,
                                                text: service.title ?? "",
                                              ),
                                            ),


                                          ],
                                        ),
                                        SpaceHelperWidget.v(10.h(context)),
                                      ],
                                    ),
                                  );
                                }),
                              );
                            }),

                            SpaceHelperWidget.v(14.h(context)),

                          ],
                        )
                      ] else...[
                        SizedBox.shrink()
                      ],


                      if(plannerSearchController.getAllVendorSearchResponseModel.value.data?.categories?.toList().isNotEmpty == true)...[
                        Column(
                          children: [
                            TextHelperClass.headingTextWithoutWidth(
                              context: context,
                              alignment: Alignment.centerLeft,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              textColor: ColorUtils.black61,
                              text: "Category",
                            ),

                            Divider(thickness: .5,color: ColorUtils.gray170,),

                            Obx(() {
                              final categoryList = plannerSearchController.getAllVendorSearchResponseModel.value.data?.categories?.toList();
                              return Column(
                                children: List.generate(categoryList!.length, (index) {
                                  final category = categoryList[index];

                                  return InkWell(
                                    onTap: () async {
                                      Map<String,dynamic> data = {
                                        "modelType": "Category", // here modelType is: User | Service | Category
                                        "refId": category.sId,
                                      };
                                      await plannerSearchController.createHistoryController(
                                        context: context,
                                        data: data,
                                        onComplete: () async {
                                          Get.back();
                                          Get.delete<PlannerSearchController>(force: true);
                                          Get.off(()=>PlannerCategoryWiseServiceView(categoryId: category.sId ?? "",),preventDuplicates: false);
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [

                                            ImageHelperWidget.circleImageHelperWidget(
                                              width: 40.w(context),
                                              height: 40.h(context),
                                              verticalPadding: 2.vpm(context),
                                              horizontalPadding: 2.hpm(context),
                                              backgroundColor: ColorUtils.orange213,
                                              radius: 20.r(context),
                                              imageAsset: category.logo == null ? ImageUtils.noImage : null,
                                              imageUrl: category.logo,
                                            ),

                                            SpaceHelperWidget.h(12.w(context)),

                                            Expanded(
                                              child: TextHelperClass.headingTextWithoutWidth(
                                                context: context,
                                                alignment: Alignment.centerLeft,
                                                textAlign: TextAlign.start,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                textColor: ColorUtils.black48,
                                                text: category.title ?? "",
                                              ),
                                            ),

                                          ],
                                        ),

                                        SpaceHelperWidget.v(10.h(context)),
                                      ],
                                    ),
                                  );
                                }),
                              );
                            }),

                            SpaceHelperWidget.v(14.h(context)),

                          ],
                        )
                      ] else...[
                        SizedBox.shrink()
                      ],



                    ],
                  ),



                ],
              ),
            ),
          ],
        ),
      )),
    );
  }


  Widget _buildSection({
    required String title,
    required String selected,
  }) {
    final categories = [
      "All",
      "Furniture",
      "Clothing",
      "Electronics",
      "Food",
      "Clothing",
      "Others"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: categories.map((e) => _categoryChip(text: e, isSelected: e == selected,),).toList(),
        ),
      ],
    );
  }


  Widget _categoryChip({
    required String text,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffF3705A) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }


}
