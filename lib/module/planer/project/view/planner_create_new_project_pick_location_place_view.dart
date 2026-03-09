import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerCreateNewProjectPickLocationPlaceView extends StatelessWidget {
  PlannerCreateNewProjectPickLocationPlaceView({super.key});

  final PlannerCreateNewProjectPickLocationPlaceController plannerCreateNewProjectPickLocationPlaceController = Get.put(PlannerCreateNewProjectPickLocationPlaceController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardPlannerView(index: 1),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: plannerCreateNewProjectPickLocationPlaceController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardPlannerView(index: 1),preventDuplicates: false);
                  },
                  title: "Order Location",
                ),


                SliverFillRemaining(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [

                        GooglePlaceAutoCompleteTextField(
                          textEditingController: plannerCreateNewProjectPickLocationPlaceController.searchController.value,
                          googleAPIKey: "AIzaSyB3Ktiqv1sAYhiBJnWYQ34E45JeNQfjQEc",
                          debounceTime: 800,
                          countries: const ["bd"],
                          isLatLngRequired: true,
                          inputDecoration: const InputDecoration(
                            hintText: "Search location",
                            border: OutlineInputBorder(),
                          ),
                          getPlaceDetailWithLatLng: (prediction) {
                            if (prediction.lat != null &&
                                prediction.lng != null) {
                              FocusScope.of(context).unfocus();
                              plannerCreateNewProjectPickLocationPlaceController.moveToLocation(
                                lat: double.parse(prediction.lat!),
                                lng: double.parse(prediction.lng!),
                                title: prediction.description ?? "",
                              );
                            }
                          },
                          itemClick: (prediction) {
                            plannerCreateNewProjectPickLocationPlaceController.searchController.value.text = prediction.description!;
                            plannerCreateNewProjectPickLocationPlaceController.searchController.value.selection = TextSelection.fromPosition(
                              TextPosition(
                                offset: prediction.description!.length,
                              ),
                            );
                            FocusScope.of(context).unfocus();
                          },
                        ),

                        SpaceHelperWidget.v(12.h(context)),

                        Expanded(
                          child: Obx(() => GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: plannerCreateNewProjectPickLocationPlaceController.initialPosition.value,
                              zoom: 15,
                            ),
                            onMapCreated: plannerCreateNewProjectPickLocationPlaceController.onMapCreated,
                            markers: plannerCreateNewProjectPickLocationPlaceController.markers,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                          ),
                          ),
                        ),

                        SpaceHelperWidget.v(12.h(context)),


                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(plannerCreateNewProjectPickLocationPlaceController.searchController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Address is not pick.");
                            } else {
                              FocusScope.of(context).unfocus();
                              print(plannerCreateNewProjectPickLocationPlaceController.longitude.value);
                              print(plannerCreateNewProjectPickLocationPlaceController.latitude.value);
                              print(plannerCreateNewProjectPickLocationPlaceController.searchController.value.text);
                              Get.off(()=> PlannerCreateNewProjectView(
                                long: plannerCreateNewProjectPickLocationPlaceController.longitude.value,
                                lat: plannerCreateNewProjectPickLocationPlaceController.latitude.value,
                                address: plannerCreateNewProjectPickLocationPlaceController.searchController.value.text,),
                                preventDuplicates: false,
                              );
                            }
                          },
                          text: "Pick Address",
                        ),

                        SpaceHelperWidget.v(12.h(context)),



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
