import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorCreateOrderPickLocationPlaceView extends StatelessWidget {
  const VendorCreateOrderPickLocationPlaceView({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorCreateOrderPickLocationPlaceController vendorCreateOrderPickLocationPlaceController = Get.put(VendorCreateOrderPickLocationPlaceController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>DashboardVendorView(index: 2),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: vendorCreateOrderPickLocationPlaceController.isLoading.value == true ?
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
                  title: "Order Location",
                ),


                SliverFillRemaining(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [

                        GooglePlaceAutoCompleteTextField(
                          textEditingController: vendorCreateOrderPickLocationPlaceController.searchController.value,
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
                              vendorCreateOrderPickLocationPlaceController.moveToLocation(
                                lat: double.parse(prediction.lat!),
                                lng: double.parse(prediction.lng!),
                                title: prediction.description ?? "",
                              );
                            }
                          },
                          itemClick: (prediction) {
                            vendorCreateOrderPickLocationPlaceController.searchController.value.text = prediction.description!;
                            vendorCreateOrderPickLocationPlaceController.searchController.value.selection = TextSelection.fromPosition(
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
                              target: vendorCreateOrderPickLocationPlaceController.initialPosition.value,
                              zoom: 15,
                            ),
                            onMapCreated: vendorCreateOrderPickLocationPlaceController.onMapCreated,
                            markers: vendorCreateOrderPickLocationPlaceController.markers,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                          ),
                          ),
                        ),

                        SpaceHelperWidget.v(12.h(context)),


                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(vendorCreateOrderPickLocationPlaceController.searchController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Address is not pick.");
                            } else {
                              FocusScope.of(context).unfocus();
                              print(vendorCreateOrderPickLocationPlaceController.longitude.value);
                              print(vendorCreateOrderPickLocationPlaceController.latitude.value);
                              print(vendorCreateOrderPickLocationPlaceController.searchController.value.text);
                              Get.off(()=>VendorCreateNewOrderView(
                                long: vendorCreateOrderPickLocationPlaceController.longitude.value,
                                lat: vendorCreateOrderPickLocationPlaceController.latitude.value,
                                address: vendorCreateOrderPickLocationPlaceController.searchController.value.text,),
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
