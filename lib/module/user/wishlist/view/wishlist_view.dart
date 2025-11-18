import 'package:flutter/material.dart';
import 'package:marketplaceapp/utils/utils.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 930.h(context),
        width: 428.w(context),
        decoration: BoxDecoration(
          color: ColorUtils.white251,
        ),
        child: CustomScrollView(
          slivers: [


            MainPageAppBarHelperWidget(
              centerTitle: false,
              title: "Wishlist",
            ),



            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                child: Column(
                  children: [


                    SpaceHelperWidget.v(32.h(context)),

                  ],
                ),
              ),
            ),


            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                        child: Container(
                          width: 428.w(context),
                          margin: EdgeInsets.only(bottom: 12.bpm(context)),
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.hpm(context),
                            vertical: 14.vpm(context),
                          ),
                          decoration: BoxDecoration(
                              color: ColorUtils.white243,
                              borderRadius: BorderRadius.circular(12.r(context)),
                              border: Border.all(
                                color: ColorUtils.white215,
                                width: .5,
                              )
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ---------------------- LEFT IMAGE ----------------------

                              Padding(
                                padding: EdgeInsets.only(top: 14.tpm(context)),
                                child: ImageHelperWidget.assetImageWidget(
                                  context: context,
                                  height: 116.h(context),
                                  width: 100.w(context),
                                  imageString: ImageUtils.wishlistImage,
                                ),
                              ),

                              SpaceHelperWidget.h(12.w(context)),

                              // ---------------------- RIGHT CONTENT ----------------------
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [


                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        // Profile Image


                                        ImageHelperWidget.circleImageHelperWidget(
                                          width: 18.w(context),
                                          height: 18.h(context),
                                          verticalPadding: 1.vpm(context),
                                          horizontalPadding: 1.hpm(context),
                                          backgroundColor: ColorUtils.orange213,
                                          radius: 25.r(context),
                                          imageAsset: ImageUtils.noImage,
                                        ),

                                        SpaceHelperWidget.h(8.w(context)),


                                        Expanded(
                                          child: TextHelperClass.headingTextWithoutWidth(
                                            context: context,
                                            alignment: Alignment.centerLeft,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            textColor: ColorUtils.black48,
                                            text: "Party Perfect",
                                          ),
                                        ),


                                        // Rating
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star, color: ColorUtils.yellow199, size: 16.r(context)),
                                            SpaceHelperWidget.h(4.w(context)),
                                            TextHelperClass.headingTextWithoutWidth(
                                              context: context,
                                              alignment: Alignment.centerLeft,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              textColor: ColorUtils.black10,
                                              text: "4.7",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),


                                    SpaceHelperWidget.v(12.h(context)),

                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.centerLeft,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      textColor: ColorUtils.black48,
                                      text: "Kids Birthday Party Extravaganza",
                                    ),


                                    SpaceHelperWidget.v(6.h(context)),


                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.centerLeft,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      textColor: ColorUtils.black80,
                                      text: "Colorful themed decorations with games, entertainment, and birthday cake",
                                    ),

                                    SpaceHelperWidget.v(12.h(context)),

                                    // Price + Delete Button
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Expanded(
                                          child: RichTextHelperWidget.headingRichText(
                                            context: context,
                                            alignment: Alignment.centerLeft,
                                            textSpans: [
                                              CustomTextSpan(
                                                  text: "From ",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorUtils.black94
                                              ).toTextSpan(),
                                              CustomTextSpan(
                                                text: '\$200',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: ColorUtils.black48,
                                              ).toTextSpan(),
                                            ],
                                          ),
                                        ),

                                        ButtonHelperWidget.customButtonWidget(
                                          context: context,
                                          onPressed: () async {

                                          },
                                          text: "Delete",
                                          padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                                          alignment: Alignment.centerRight,
                                          textColor: ColorUtils.red237,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  childCount: 10,
                )
            )





          ],
        ),
      ),
    );
  }
}
