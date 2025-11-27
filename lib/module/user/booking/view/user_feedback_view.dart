import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserFeedbackView extends StatelessWidget {
  UserFeedbackView({super.key});

  final UserFeedbackController userFeedbackController = Get.put(UserFeedbackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white251,
          ),
          child: CustomScrollView(
            slivers: [

              AuthAppBarHelperWidget(
                onBackPressed: () async {
                  Get.off(()=>DashboardUserView(index: 1),preventDuplicates: false);
                },
                title: "Feedback",
              ),


              SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [

                        SpaceHelperWidget.v(16.h(context)),

                        title(text: "Communication skills",context: context),
                        SpaceHelperWidget.v(14.h(context)),

                        ratingRow(
                          selected: userFeedbackController.communication.value,
                          onTap: (v) {
                            userFeedbackController.communication.value = v;
                          },
                          context: context,
                        ),


                        SpaceHelperWidget.v(18.h(context)),

                        title(text: "Service",context: context),
                        SpaceHelperWidget.v(14.h(context)),

                        ratingRow(
                          selected: userFeedbackController.service.value,
                          onTap: (v) {
                            userFeedbackController.service.value = v;
                          },
                          context: context,
                        ),


                        SpaceHelperWidget.v(18.h(context)),

                        title(text: "Product quality",context: context),
                        SpaceHelperWidget.v(14.h(context)),

                        ratingRow(
                          selected: userFeedbackController.productQuality.value,
                          onTap: (v) {
                            userFeedbackController.productQuality.value = v;
                          },
                          context: context,
                        ),


                        SpaceHelperWidget.v(32.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          textAlign: TextAlign.start,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.black64,
                          text: "What did you think?",
                        ),


                        SpaceHelperWidget.v(20.h(context)),



                        Obx(() => Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: List.generate(userFeedbackController.options.length, (index) {
                              bool isSelected = userFeedbackController.selectedOptions.contains(userFeedbackController.options[index]);
                              return IntrinsicWidth(
                                child: InkWell(
                                  onTap: () {
                                    userFeedbackController.toggleOption(userFeedbackController.options[index]);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context), vertical: 8.vpm(context)),
                                    decoration: BoxDecoration(
                                      color: isSelected ? ColorUtils.orange241 : ColorUtils.white243,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      children: [
                                
                                        ImageHelperWidget.assetImageWidget(
                                          context: context,
                                          height: 20,
                                          width: 20,
                                          imageString: userFeedbackController.image[index],
                                        ),
                                
                                        SpaceHelperWidget.h(10.w(context)),
                                
                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          alignment: Alignment.centerLeft,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          textColor: ColorUtils.black89,
                                          text: userFeedbackController.options[index],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                          ),
                        ),



                        SpaceHelperWidget.v(32.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          textAlign: TextAlign.start,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.black64,
                          text: "How was your overall experience?",
                        ),

                        SpaceHelperWidget.v(10.h(context)),

                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          textAlign: TextAlign.start,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black89,
                          text: "Submit feedback for a chance to win a free hamper!",
                        ),

                        SpaceHelperWidget.v(16.h(context)),


                        TextFormFieldWidget.textFiledWithMaxLineBuild(
                          context: context,
                          maxLines: 6,
                          hintText: "Write something ...",
                          controller: userFeedbackController.messageController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        SpaceHelperWidget.v(26.h(context)),


                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            userFeedbackController.submitFeedback();
                            Get.off(()=>UserFeedbackSuccessfullView(),preventDuplicates: false);
                          },
                          text: "Submit",
                        ),


                        SpaceHelperWidget.v(26.h(context)),

                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget title({required String text, required BuildContext context}) {
    return TextHelperClass.headingTextWithoutWidth(
      context: context,
      alignment: Alignment.centerLeft,
      textAlign: TextAlign.start,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      textColor: ColorUtils.black64,
      text: text,
    );
  }

  Widget ratingRow({required int selected, required Function(int) onTap, required BuildContext context}) {
    return Row(
      children: List.generate(5, (index) {
        int star = index + 1;
        return GestureDetector(
          onTap: () => onTap(star),
          child: Padding(
            padding: EdgeInsets.only(right: 14.rpm(context)),
            child: Icon(
              Icons.star,
              size: 40.r(context),
              color: star <= selected ? ColorUtils.yellow177 : ColorUtils.gray194,
            ),
          ),
        );
      }),
    );
  }
}