import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';

import '../../../../utils/utils.dart';


class FilesPage {


  static Widget filesPage({
    required BuildContext context,
    required PlannerProjectDetailsController plannerProjectDetailsController,
  }) {
    return CustomScrollView(
      slivers: [

        SliverToBoxAdapter(
          child: Column(
            children: [

              SpaceHelperWidget.v(16.h(context)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    textColor: ColorUtils.black48,
                    text: "Project Files",
                  ),


                  SpaceHelperWidget.h(16.w(context)),



                  ButtonHelperWidget.customIconButtonWidgetAdventPro(
                    context: context,
                    backgroundColor: ColorUtils.blue96,
                    textSize: 20,
                    iconSize: 20,
                    height: 40,
                    padding: EdgeInsets.symmetric(vertical: 5.5.vpm(context),horizontal: 16.hpm(context)),
                    borderRadius: 8,
                    textColor: ColorUtils.white255,
                    fontWeight: FontWeight.w700,
                    onPressed: () async {
                      await plannerProjectDetailsController.pickFile();
                    },
                    iconPath: ImageUtils.uploadIconImage,
                    text: "Upload File",
                  ),

                ],
              ),

              SpaceHelperWidget.v(16.h(context)),
            ],
          ),
        ),


        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context,int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20.bpm(context)),
                    padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 8.hpm(context)),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorUtils.white215,width: .5),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.r(context)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [


                        ImageHelperWidget.assetImageWidget(
                          context: context,
                          height: 24.h(context),
                          width: 24.w(context),
                          imageString: ImageUtils.fileTypeImage,
                        ),

                        SpaceHelperWidget.h(16.w(context)),


                        Expanded(
                          child: Column(
                            children: [

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                alignment: Alignment.centerLeft,
                                textAlign: TextAlign.start,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                textColor: ColorUtils.black48,
                                text: plannerProjectDetailsController.files[index].name,
                              ),

                              SpaceHelperWidget.v(6.h(context)),


                              RichTextHelperWidget.headingRichText(
                                context: context,
                                alignment: Alignment.centerLeft,
                                textSpans: [
                                  CustomTextSpan(
                                    text: "${plannerProjectDetailsController.files[index].size} . ",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: ColorUtils.black74,
                                  ).toTextSpan(),
                                  CustomTextSpan(
                                    text: "Uploaded  ${DateFormat('dd MMM yyyy').format(plannerProjectDetailsController.files[index].uploadDate)}",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: ColorUtils.black74,
                                  ).toTextSpan(),
                                ],
                              ),


                            ],
                          ),
                        ),


                        SpaceHelperWidget.h(6.w(context)),


                        InkWell(
                          onTap: () async {},
                          child: ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 32.h(context),
                            width: 32.w(context),
                            imageString: ImageUtils.fileDownloadImage,
                          ),
                        ),

                        SpaceHelperWidget.h(12.w(context)),


                        InkWell(
                          onTap: () async {},
                          child: ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 32.h(context),
                            width: 32.w(context),
                            imageString: ImageUtils.fileDeleteImage,
                          ),
                        ),




                        

                      ],
                    ),
                  );
                },
            childCount: plannerProjectDetailsController.files.length,
          ),
        )



      ],
    );
  }



}