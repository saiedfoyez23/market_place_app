import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorServiceDetailsController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<VendorGetServiceDetailsResponseModel> vendorGetServiceDetailsResponseModel = VendorGetServiceDetailsResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!)).obs;
  BuildContext context;
  String serviceId;
  VendorServiceDetailsController({required this.context,required this.serviceId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getVendorDetailsServiceController(context: context,serviceId: serviceId);
    });
  }

  Future<void> getVendorDetailsServiceController({
    required BuildContext context,
    required String serviceId,
  }) async {
    BaseApiUtils.get(
      url: "${ApiUtils.serviceDetails}/${serviceId}",
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        vendorGetServiceDetailsResponseModel.value = VendorGetServiceDetailsResponseModel.fromJson(data);
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


  Rx<ServiceDetailsModel> service = ServiceDetailsModel(
    title: "Kids Birthday Party Extravaganza",
    description: "Colorful themed decorations with games, entertainment, and birthday cake arrangement. Using a mass messaging platform allows event planners to reach their entire audience in just a few clicks.",
    imageUrl: ImageUtils.wishlistImage,
    sections: [
      ServiceSection(
        title: "Entrance & Welcome Area",
        items: [
          "Welcome board with birthday name & age",
          "Balloon arch / gate decoration",
          "Flower stand or LED frame at entry",
          "Red carpet or themed walkway",
          "Photo booth backdrop",
        ],
      ),
      ServiceSection(
        title: "Cake & Dessert Section",
        items: [
          "Cake stand & dessert trays",
          "Cake backdrop or arch",
          "LED candles or spotlight on cake",
          "Customized cake topper",
        ],
      ),
      ServiceSection(
        title: "Photo Zone",
        items: [
          "Themed photo booth with props",
          "Neon light signs",
          "Instax / Polaroid corner for instant photos",
        ],
      ),
    ],
    vendor: VendorModel(
      name: "Bella Photography Studio",
      image: "assets/user.jpg",
      category: "Photography",
      location: "Mohakhali, Gulshan 01",
      about: "I have a 4 years old golden retriever. I’ve taken good care of him since he was 8 weeks old. He’s very playful and super friendly to any dogs and people. My dog is particularly adept at fostering positive interactions, demonstrating a calm and considerate demeanor with small dogs",
      verified: true,
    ),
    reviews: [
      ReviewModel(
        userName: "SRP–Polash",
        image: "assets/user.jpg",
        rating: 2.5,
        comment: "Sunghee was a great sitter and Dallas thoroughly enjoyed his stay.",
      ),
      ReviewModel(
        userName: "SRP–Polash",
        image: "assets/user.jpg",
        rating: 5.0,
        comment: "Sunghee was a great sitter and Dallas thoroughly enjoyed his stay.",
      ),
      ReviewModel(
        userName: "SRP–Polash",
        image: "assets/user.jpg",
        rating: 5.0,
        comment: "Sunghee was a great sitter and Dallas thoroughly enjoyed his stay.",
      ),
      ReviewModel(
        userName: "SRP–Polash",
        image: "assets/user.jpg",
        rating: 3.5,
        comment: "Sunghee was a great sitter and Dallas thoroughly enjoyed his stay.",
      ),
      ReviewModel(
        userName: "SRP–Polash",
        image: "assets/user.jpg",
        rating: 4,
        comment: "Sunghee was a great sitter and Dallas thoroughly enjoyed his stay.",
      ),
    ],
  ).obs;

}