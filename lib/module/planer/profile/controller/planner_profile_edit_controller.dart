import 'dart:convert';
import 'dart:io';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
class PlannerProfileEditController extends GetxController {
  RxBool isSubmit = false.obs;
  RxBool isLoading = false.obs;
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<CategoryResponseModel> categoryResponseModel = CategoryResponseModel().obs;
  Rx<TextEditingController> bioController = TextEditingController().obs;
  Rx<TextEditingController> addInstagramController = TextEditingController().obs;
  Rx<TextEditingController> addLinkedInController = TextEditingController().obs;
  Rx<TextEditingController> addWebsiteController = TextEditingController().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;
  Rx<PlannerMyProfileDetailsResponseModel> plannerMyProfileDetailsResponseModel = PlannerMyProfileDetailsResponseModel().obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  BuildContext context;
  PlannerProfileEditController({required this.context});

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
  Future<void> plannerGetAddressFromLatLng() async {
    await getCurrentPosition().then((position) async {
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks.first;
      locationController.value.text = "${place.street} ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await plannerGetAddressFromLatLng();
      await plannerGetCategoryController(context: context);
      await getPlannerProfileDetailsController(context: context);
    });
  }

  RxList<String> selectCategoryString = <String>[].obs;


  Rx<File> profileImageFile = File("").obs;
  Rx<File> coverImageFile = File("").obs;

  Future<void> pickProfileImage({required ImageSource source,required BuildContext context}) async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      Navigator.pop(context); // close dialog after selection
      profileImageFile.value = File(pickedFile.path);
    }
  }


  Future<void> pickCoverImage({required ImageSource source,required BuildContext context}) async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      coverImageFile.value = File(pickedFile.path);
    }
  }

  Future<void> plannerGetCategoryController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.categoryResponse,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
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

  Future<void> getPlannerProfileDetailsController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userProfileDetails,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        plannerMyProfileDetailsResponseModel.value = PlannerMyProfileDetailsResponseModel.fromJson(data);
        userNameController.value.text = plannerMyProfileDetailsResponseModel.value.data?.name ?? "";
        emailController.value.text = plannerMyProfileDetailsResponseModel.value.data?.email ?? "";
        phoneNumberController.value.text = plannerMyProfileDetailsResponseModel.value.data?.contractNumber ?? "";
        locationController.value.text = plannerMyProfileDetailsResponseModel.value.data?.address ?? "";
        bioController.value.text = plannerMyProfileDetailsResponseModel.value.data?.bio ?? "";
        addInstagramController.value.text = plannerMyProfileDetailsResponseModel.value.data?.socialProfiles?.instagram ?? "";
        addLinkedInController.value.text = plannerMyProfileDetailsResponseModel.value.data?.socialProfiles?.linkedin ?? "";
        addWebsiteController.value.text = plannerMyProfileDetailsResponseModel.value.data?.socialProfiles?.website ?? "";
        longitude.value = plannerMyProfileDetailsResponseModel.value.data?.location?.coordinates?.first ?? 0.0;
        latitude.value = plannerMyProfileDetailsResponseModel.value.data?.location?.coordinates?.last ?? 0.0;
        print("category ${categoryResponseModel.value.data?.length}");
        plannerMyProfileDetailsResponseModel.value.data?.categories?.forEach((value) {
          selectCategoryString.add(value);
        });
        selectCategoryString.refresh();
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


  Future<void> plannerUpdateUserAccountController({
    required BuildContext context,
  }) async {
    isSubmit.value = true;

    final Map<String, dynamic> jsonData = {
      "name": userNameController.value.text,
      "contractNumber": phoneNumberController.value.text,
      "longitude": longitude.value,
      "latitude": latitude.value,
      "address": locationController.value.text,
      "bio": bioController.value.text,
      "categories": selectCategoryString,
      "socialProfiles": {
        "instagram": addInstagramController.value.text,
        "linkedin": addLinkedInController.value.text,
        "website": addWebsiteController.value.text,
      },
    };
    print(profileImageFile.value.path);
    print(coverImageFile.value.path);

    dio.FormData formData = dio.FormData.fromMap({
      if(profileImageFile.value.path != "")
        "image": await dio.MultipartFile.fromFile(
          profileImageFile.value.path,
          filename: profileImageFile.value.path.split('/').last,
          contentType: dio.DioMediaType(
            MimeTypeUtils.getMimeType(profileImageFile.value.path).split('/').first,
            MimeTypeUtils.getMimeType(profileImageFile.value.path).split('/').last,
          ),
        ),
      if(coverImageFile.value.path != "")
        "coverPhoto": await dio.MultipartFile.fromFile(
          coverImageFile.value.path,
          filename: coverImageFile.value.path.split('/').last,
          contentType: dio.DioMediaType(
            MimeTypeUtils.getMimeType(coverImageFile.value.path).split('/').first,
            MimeTypeUtils.getMimeType(coverImageFile.value.path).split('/').last,
          ),
        ),
      "data": jsonEncode(jsonData),  // important → JSON encoded string!
    });


    await BaseApiUtils.put(
      url: ApiUtils.userUpdateMyProfile,
      formData: formData,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isSubmit.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        Get.off(()=>DashboardPlannerView(index: 5),preventDuplicates: false);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
    );
  }





}