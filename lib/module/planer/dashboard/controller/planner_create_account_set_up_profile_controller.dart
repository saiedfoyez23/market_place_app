import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../../utils/utils.dart';

class PlannerCreateAccountSetUpProfileController extends GetxController {

  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<CategoryResponseModel> categoryResponseModel = CategoryResponseModel().obs;
  Rx<TextEditingController> businessNameController = TextEditingController().obs;
  Rx<TextEditingController> aboutYouController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> addInstagramController = TextEditingController().obs;
  Rx<TextEditingController> addLinkedInController = TextEditingController().obs;
  Rx<TextEditingController> addWebsiteController = TextEditingController().obs;
  RxList<CategoryResponseData> selectCategory = <CategoryResponseData>[].obs;


  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxBool isLoading = false.obs;

  BuildContext context;
  PlannerCreateAccountSetUpProfileController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getAddressFromLatLng();
      await getCategoryController(context: context);
    });
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
  Future<void> getAddressFromLatLng() async {
    await getCurrentPosition().then((position) async {
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks.first;
      locationController.value.text = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
    });
  }


  Future<void> getCategoryController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.categoryResponse,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        categoryResponseModel.value = CategoryResponseModel.fromJson(data);
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


  Future<void> createUserAccountController({
    required BuildContext context,
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    isLoading.value = true;

    final Map<String, dynamic> jsonData = {
      "longitude": longitude.value,
      "latitude": latitude.value,
      "address": locationController.value.text,
      "bio": aboutYouController.value.text,
      "categories": selectCategory,
      "socialProfiles": {
        "instagram": addInstagramController.value.text,
        "linkedin": addLinkedInController.value.text,
        "website": addWebsiteController.value.text,
      },
    };
    print(jsonData);

    dio.FormData formData = dio.FormData.fromMap({
      "data": jsonEncode(jsonData),  // important → JSON encoded string!
    });

    await BaseApiUtils.post(
      url: ApiUtils.userRegistration,
      formData: formData,
      onSuccess: (e,data) async {
        await LocalStorageUtils.setString(AppConstantUtils.crateUserResponse, jsonEncode(data));
        isLoading.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        Get.delete<PlannerCreateAccountController>();
        Get.off(()=>PlannerCreateAccountOtpView(),preventDuplicates: false);
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