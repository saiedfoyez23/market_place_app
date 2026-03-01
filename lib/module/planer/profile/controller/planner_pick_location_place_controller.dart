import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlannerPickLocationPlaceController extends GetxController {


  RxBool isLoading = false.obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;

  GoogleMapController? mapController;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  final Rx<LatLng> initialPosition = const LatLng(0, 0).obs; // Dhaka

  final RxSet<Marker> markers = <Marker>{}.obs;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(microseconds: 120),() async {
      await plannerPickLocationPlaceLatLng();
    });
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
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks.first;
      searchController.value.text = "${place.street} ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
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