import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserHomeDashboardController extends GetxController {

  Rx<TextEditingController> searchController = TextEditingController().obs;

  RxInt index = 0.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString address = "".obs;


  void changeIndex(int changeValue) {
    index.value = changeValue;
  }

  RxBool isLoading = false.obs;
  BuildContext context;
  UserHomeDashboardController({required this.context});
  Rx<ClientHomeResponseModel> clientHomeResponseModel = ClientHomeResponseModel().obs;
  Rx<UserMyProfileDetailsResponseModel> userMyProfileDetailsResponseModel = UserMyProfileDetailsResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getProfileController(context: context);
      await getUserHomeController(context: context);
      await userGetAddressFromLatLng(context: context);
    });
  }

  Future<void> getProfileController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userProfileDetails,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        userMyProfileDetailsResponseModel.value = UserMyProfileDetailsResponseModel.fromJson(data);
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


  Future<void> getUserHomeController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getUserHomeResponse,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        clientHomeResponseModel.value = ClientHomeResponseModel.fromJson(data);
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


  /// Check & request permission
  static Future<void> _handlePermission({required BuildContext context}) async {
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
      LocationPermissionDeniedBox().locationPermissionDeniedBox(context: context);
    }
  }

  /// Get current position
  static Future<Position> getCurrentPosition({required BuildContext context}) async {
    await _handlePermission(context: context);
    return await Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.best));
  }

  /// Get address from latitude & longitude
  Future<void> userGetAddressFromLatLng({required BuildContext context}) async {
    await getCurrentPosition(context: context).then((position) async {
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks.first;
      address.value = "${place.street} ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
      await updateUserAddressController(
        context: context,
        data: {
          "longitude": longitude.value,
          "latitude": latitude.value,
          "address": address.value,
        },
      );
    });
  }


  Future<void> updateUserAddressController({
    required BuildContext context,
    required Map<String,dynamic> data
  }) async {
    BaseApiUtils.put(
      url: ApiUtils.updateUserAddressResponse,
      data: data,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
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


}