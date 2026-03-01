import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditController extends GetxController {
  RxBool isSubmit = false.obs;
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> bioController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<UserMyProfileDetailsResponseModel> userMyProfileDetailsResponseModel = UserMyProfileDetailsResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  Rx<File> imageFile = File("").obs;
  RxBool isLoading = false.obs;
  BuildContext context;
  ProfileEditController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await userGetAddressFromLatLng();
      await getProfileController(context: context);
    });
  }

  Future<void> pickImage({required ImageSource source,required BuildContext context}) async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      Navigator.pop(context); // close dialog after selection
      imageFile.value = File(pickedFile.path);
    }
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
  Future<void> userGetAddressFromLatLng() async {
    await getCurrentPosition().then((position) async {
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks.first;
      locationController.value.text = "${place.street} ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
    });
  }

  Future<void> getProfileController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userProfileDetails,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        userMyProfileDetailsResponseModel.value = UserMyProfileDetailsResponseModel.fromJson(data);
        userNameController.value.text = userMyProfileDetailsResponseModel.value.data?.name ?? "";
        emailController.value.text = userMyProfileDetailsResponseModel.value.data?.email ?? "";
        phoneNumberController.value.text = userMyProfileDetailsResponseModel.value.data?.contractNumber ?? "";
        bioController.value.text = userMyProfileDetailsResponseModel.value.data?.bio ?? "";
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


  Future<void> userUpdateUserAccountController({
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
    };
    print(imageFile.value.path);

    dio.FormData formData = dio.FormData.fromMap({
      if(imageFile.value.path != "")
        "image": await dio.MultipartFile.fromFile(
          imageFile.value.path,
          filename: imageFile.value.path.split('/').last,
          contentType: dio.DioMediaType(
            MimeTypeUtils.getMimeType(imageFile.value.path).split('/').first,
            MimeTypeUtils.getMimeType(imageFile.value.path).split('/').last,
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
        Get.off(()=>DashboardUserView(index: 4,),preventDuplicates: false);
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