import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';
class PlannerCategoryDialogBox extends StatelessWidget {
  const PlannerCategoryDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    final PlannerAllCategoryController plannerAllCategoryController = Get.put(PlannerAllCategoryController(context: context));
    return Dialog(
      insetPadding: EdgeInsets.only(top: 129.tpm(context),bottom: 530.bpm(context)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      child: Obx(()=>Container(
        width: 428.w(context),
        padding: EdgeInsets.symmetric(horizontal: 20.hpm(context),vertical: 20.vpm(context)),
        decoration: BoxDecoration(
          color: ColorUtils.white251,
          borderRadius: BorderRadius.circular(12.r(context)),
        ),
        child: plannerAllCategoryController.isLoading.value == true ?
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

                  Column(
                    children: [

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black96,
                        text: "All Categories",
                      ),

                      SpaceHelperWidget.v(10.h(context)),


                      CustomDropdownHelperClass<CategoryResponseData>(
                        value: plannerAllCategoryController.selectCategory.value.sId == null ? null : plannerAllCategoryController.selectCategory.value,
                        items: plannerAllCategoryController.categoryResponseModel.value.data!,
                        itemBuilder: (value) {
                          return TextHelperClass.headingTextWithoutWidth(
                            context: context,
                            alignment: Alignment.centerLeft,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            textColor: ColorUtils.black48,
                            text: value.title ?? "",
                          );
                        },
                        fillColor: ColorUtils.white243,
                        onChanged: (value) {
                          plannerAllCategoryController.selectCategory.value = value!;
                        },
                      ),

                    ],
                  ),

                  SpaceHelperWidget.v(15.h(context)),

                  Row(
                    children: [


                      Expanded(
                        child: ButtonHelperWidget.customButtonWidget(
                          context: context,
                          onPressed: () async {
                            Get.delete<PlannerAllCategoryController>(force: true);
                            Get.back();
                          },
                          text: "Cancel",
                          textColor: ColorUtils.blue96,
                          backgroundColor: ColorUtils.blue206,
                        ),
                      ),

                      SpaceHelperWidget.h(16.w(context)),

                      Expanded(
                        child: ButtonHelperWidget.customButtonWidget(
                          context: context,
                          onPressed: () async {
                            Get.delete<PlannerAllCategoryController>(force: true);
                            Get.back();
                            Get.off(()=>PlannerCategoryWiseServiceView(categoryId: plannerAllCategoryController.selectCategory.value.sId ?? ""),preventDuplicates: false);
                          },
                          text: "Search by Filter",
                        ),
                      ),


                    ],
                  )


                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
