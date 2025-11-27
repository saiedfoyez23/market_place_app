import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerVendorController extends GetxController {

  var favoriteList = <int, bool>{}.obs;

  Rx<TextEditingController> searchController = TextEditingController().obs;

  RxList<PlannerVendorModel> vendors = <PlannerVendorModel>[
    PlannerVendorModel(
      image: ImageUtils.wishlistImage,
      title: "Bella Photography Studio",
      category: "Photography",
      location: "Mohakhali, Gulshan 01",
      description:
      "Colorful themed decorations with games, entertainment, and birthday cake arrangement.",
      rating: 4.7,
      reviews: 320,
      isVerified: true,
    ),
    PlannerVendorModel(
      image: ImageUtils.wishlistImage,
      title: "Happy Moments Decor",
      category: "Decoration",
      location: "Banani, Dhaka",
      description:
      "Premium decoration with customized balloon setups and lighting.",
      rating: 4.8,
      reviews: 290,
      isVerified: true,
    ),
    PlannerVendorModel(
      image: ImageUtils.wishlistImage,
      title: "Party Master Event",
      category: "Event Planner",
      location: "Mirpur, Dhaka",
      description:
      "Complete birthday event package with games, music & cakes.",
      rating: 4.9,
      reviews: 510,
      isVerified: false,
    ),
  ].obs;


  void toggleFavorite(int index) {
    favoriteList[index] = !(favoriteList[index] ?? false);
  }


}


class PlannerVendorModel {
  String image;
  String title;
  String category;
  String location;
  String description;
  double rating;
  int reviews;
  bool isVerified;

  PlannerVendorModel({
    required this.image,
    required this.title,
    required this.category,
    required this.location,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.isVerified,
  });
}