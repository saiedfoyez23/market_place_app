import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorEditPickLocationPlaceController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<VendorGetServiceDetailsResponseModel> vendorGetServiceDetailsResponseModel = VendorGetServiceDetailsResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;

  GoogleMapController? mapController;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  final Rx<LatLng> initialPosition = const LatLng(0, 0).obs; // Dhaka

  final RxSet<Marker> markers = <Marker>{}.obs;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  BuildContext context;
  String serviceId;
  VendorEditPickLocationPlaceController({required this.serviceId,required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(microseconds: 120),() async {
      await getVendorDetailsServiceController(
        context: context,
        serviceId: serviceId,
        onCompleted: () async {
          await plannerPickLocationPlaceLatLng();
        },
      );
    });
  }


  Future<void> getVendorDetailsServiceController({
    required BuildContext context,
    required String serviceId,
    required Function onCompleted,
  }) async {
    BaseApiUtils.get(
      url: "${ApiUtils.serviceDetails}/${serviceId}",
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        vendorGetServiceDetailsResponseModel.value = VendorGetServiceDetailsResponseModel.fromJson(data);
        onCompleted();
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }

  Future<void> moveToLocation({
    required double lat,
    required double lng,
    required String title,
  }) async {
    final position = LatLng(lat, lng);
    latitude.value = lat;
    longitude.value = lng;
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 15),
      ),
    );

    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId("selected_place"),
        position: position,
        infoWindow: InfoWindow(title: title),
      ),
    );
  }

  /// Check & request permission
  static Future<void> _handlePermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled.';
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permission permanently denied';
    }
  }

  /// Get current position
  static Future<Position> getCurrentPosition() async {
    await _handlePermission();
    return await Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.best));
  }

  /// Get address from latitude & longitude
  Future<void> plannerPickLocationPlaceLatLng() async {
    await getCurrentPosition().then((position) async {
      latitude.value = vendorGetServiceDetailsResponseModel.value.data?.location?.coordinates?.last ?? 0.0;
      longitude.value = vendorGetServiceDetailsResponseModel.value.data?.location?.coordinates?.first ?? 0.0;
      searchController.value.text = vendorGetServiceDetailsResponseModel.value.data?.address ?? "";
      initialPosition.value = LatLng(latitude.value, longitude.value);
      isLoading.value = false;
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: initialPosition.value, zoom: 15),
        ),
      );

      markers.clear();
      markers.add(
        Marker(
          markerId: const MarkerId("selected_place"),
          position: initialPosition.value,
          infoWindow: InfoWindow(title: searchController.value.text),
        ),
      );
    });
  }

}