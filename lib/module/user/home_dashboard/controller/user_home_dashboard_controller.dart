import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserHomeDashboardController extends GetxController {

  Rx<TextEditingController> searchController = TextEditingController().obs;

  RxInt index = 0.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;


  void changeIndex(int changeValue) {
    index.value = changeValue;
  }


  // Upcoming bookings data
  RxList<Map<String, dynamic>> upcomingBookings = [
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
  ].obs;

  // Recommended vendors (placeholder data)
  var recommendedVendors = List.generate(4, (index) => {
    'name': 'Here is a Client Profile',
    'rating': 4.7,
    'reviews': 320,
    'imageUrl': ImageUtils.recomendedImage
  }).obs;

  // Top vendors (placeholder data)
  var topVendors = List.generate(2, (index) => {
    'name': 'Here is a Client Profile',
    'rating': 4.7,
    'reviews': 320,
    'imageUrl': ImageUtils.recomendedImage,
  }).obs;

  // Planner services (placeholder data)
  var plannerServices = List.generate(2, (index) => {
    'name': 'Here is a Client Profile',
    'rating': 4.7,
    'reviews': 320,
    'imageUrl': ImageUtils.recomendedImage,
  }).obs;



}