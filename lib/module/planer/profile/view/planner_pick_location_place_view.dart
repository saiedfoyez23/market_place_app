import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerPickLocationPlaceView extends StatelessWidget {
  PlannerPickLocationPlaceView({super.key});

  final PlannerPickLocationPlaceController plannerPickLocationPlaceController = Get.put(PlannerPickLocationPlaceController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>PlannerProfileServiceView(),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: plannerPickLocationPlaceController.isLoading.value == true ?
            LoadingHelperWidget.loadingHelperWidget(
              context: context,
              height: 930.h(context),
            ) :
            CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>DashboardVendorView(index: 1),preventDuplicates: false);
                  },
                  title: "Pick Location",
                ),


                SliverFillRemaining(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [

                        GooglePlaceAutoCompleteTextField(
                          textEditingController: plannerPickLocationPlaceController.searchController.value,
                          googleAPIKey: "AIzaSyB_3nOokGz9jksH5jN_f05YNEJeZqWizYM",
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
                              plannerPickLocationPlaceController.moveToLocation(
                                lat: double.parse(prediction.lat!),
                                lng: double.parse(prediction.lng!),
                                title: prediction.description ?? "",
                              );
                            }
                          },
                          itemClick: (prediction) {
                            plannerPickLocationPlaceController.searchController.value.text = prediction.description!;
                            plannerPickLocationPlaceController.searchController.value.selection = TextSelection.fromPosition(
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
                              target: plannerPickLocationPlaceController.initialPosition.value,
                              zoom: 15,
                            ),
                            onMapCreated: plannerPickLocationPlaceController.onMapCreated,
                            markers: plannerPickLocationPlaceController.markers,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                          ),
                          ),
                        ),

                        SpaceHelperWidget.v(12.h(context)),


                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(plannerPickLocationPlaceController.searchController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Address is not pick.");
                            } else {
                              FocusScope.of(context).unfocus();
                              print(plannerPickLocationPlaceController.longitude.value);
                              print(plannerPickLocationPlaceController.latitude.value);
                              print(plannerPickLocationPlaceController.searchController.value.text);
                              Get.off(()=> PlannerProfileCreateNewServiceView(
                                long: plannerPickLocationPlaceController.longitude.value,
                                lat: plannerPickLocationPlaceController.latitude.value,
                                address: plannerPickLocationPlaceController.searchController.value.text,),
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
