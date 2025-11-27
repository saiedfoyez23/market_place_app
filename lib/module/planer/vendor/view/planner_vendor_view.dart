import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerVendorView extends StatelessWidget {
  PlannerVendorView({super.key});

  final PlannerVendorController plannerVendorController = Get.put(PlannerVendorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: CustomScrollView(
            slivers: [


              MainPageAppBarHelperWidget(
                centerTitle: true,
                customTitle: Row(
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
                                  text: 'Hello!! ',
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
                            text: "Mohakhali, Dhaka",
                          ),



                        ],
                      ),
                    ),

                  ],
                ),
                actions: [


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

                  SpaceHelperWidget.h(15.w(context)),

                  InkWell(
                    onTap: () async {
                      //Get.off(()=>UserNotificationView(),preventDuplicates: false);
                    },
                    child: ImageHelperWidget.assetImageWidget(
                      context: context,
                      height: 50.h(context),
                      width: 50.w(context),
                      imageString: ImageUtils.offerImage,
                    ),
                  ),

                  SpaceHelperWidget.h(15.w(context)),


                ],
              ),

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
                        return vendorCard(index: index,context: context);
                      },
                  childCount: plannerVendorController.vendors.length,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }


  // ---------------- DYNAMIC CARD ----------------
  Widget vendorCard({required int index,required BuildContext context}) {
    var data = plannerVendorController.vendors[index];

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
            imageSection(img: data.image,index: index,context: context),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.vpm(context)),
              child: Column(
                children: [

                  infoSection(data: data,context: context),
                  buttons(context: context),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  // ---------------- IMAGE ----------------
  Widget imageSection({required String img,required int index,required BuildContext context}) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r(context)),
            topRight: Radius.circular(12.r(context)),
          ),
          child: Image.asset(
            img,
            height: 192.h(context),
            width: 428.w(context),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 12.h(context),
          right: 12.w(context),
          child: ImageHelperWidget.assetImageWidget(
            context: context,
            height: 26.h(context),
            width: 26.w(context),
            imageString: ImageUtils.serviceLoveImage,
          ),
        ),
      ],
    );
  }

  // ---------------- INFO ----------------
  Widget infoSection({required dynamic data,required BuildContext context}) {
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
                imageAsset: ImageUtils.noImage,
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
                  text: data.title,
                ),
              ),

              SpaceHelperWidget.h(6.w(context)),

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
              ),


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
                text: data.category,
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
                        text: '${data.rating} ',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black10,
                      ).toTextSpan(),
                      CustomTextSpan(
                        text: '(${data.reviews} reviews)',
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
            text: "Kids Birthday Party Extravaganza",
          ),

          SpaceHelperWidget.v(6.h(context)),


          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.start,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black80,
            text: data.description,
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


              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                textAlign: TextAlign.start,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textColor: ColorUtils.black94,
                text: data.location,
              ),


            ],
          ),


          SpaceHelperWidget.v(24.h(context)),


        ],
      ),
    );
  }

  // ---------------- BUTTONS ----------------
  Widget buttons({required BuildContext context}) {
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
                Get.off(()=>DashboardPlannerView(index: 2),preventDuplicates: false);
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