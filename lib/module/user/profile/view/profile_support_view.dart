import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';

class ProfileSupportView extends StatelessWidget {
  ProfileSupportView({super.key});

  final ProfileSupportController profileSupportController = Get.put(ProfileSupportController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardUserView(index: 4,),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
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
                    Get.off(()=>DashboardUserView(index: 4,),preventDuplicates: false);
                  },
                  title: "Support",
                ),


                SliverFillRemaining(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [

                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Subject",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter Subject",
                          controller: profileSupportController.subjectController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Message",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.textFiledWithMaxLineBuild(
                          context: context,
                          hintText: "Write something....",
                          maxLines: 5,
                          controller: profileSupportController.messageController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SpaceHelperWidget.v(24.h(context)),


                        profileSupportController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(
                          context: context,
                        ) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(profileSupportController.subjectController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter Support Subject");
                            } else if(profileSupportController.messageController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter Support Message");
                            } else {
                              profileSupportController.isSubmit.value = true;
                              Map<String,dynamic> data = {
                                "subject": profileSupportController.subjectController.value.text,
                                "messages": profileSupportController.messageController.value.text,
                              };
                              await profileSupportController.createSupportController(context: context,data: data);
                            }
                          },
                          text: "Send Message",
                        ),


                        SpaceHelperWidget.v(40.h(context)),



                      ],
                    ),
                  ),
                )


              ],
            ),
          ),
        )),
      ),
    );
  }
}
