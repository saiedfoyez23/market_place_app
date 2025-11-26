import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';


class DashboardUserController extends GetxController {

  RxInt selectedIndex = 0.obs;
  int index;
  DashboardUserController({required this.index});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await changeIndex(index: index);
    });
  }



  Future<void> changeIndex({required int index}) async {
    selectedIndex.value = index;
  }


  RxList<Map<String, dynamic>> items = [
    {'unselected': ImageUtils.unselectHomeImage, 'select': ImageUtils.selectHomeImage, 'label': 'Home'},
    {'unselected': ImageUtils.unselectMyBookingImage, 'select': ImageUtils.selectMyBookingImage, 'label': 'My Booking'},
    {'unselected': ImageUtils.unselectMessageImage, 'select': ImageUtils.selectMessageImage, 'label': 'Message'},
    {'unselected': ImageUtils.unselectWishlistImage, 'select': ImageUtils.selectWishlistImage, 'label': 'wishlist'},
    {'unselected': ImageUtils.unselectProfileImage, 'select': ImageUtils.selectProfileImage, 'label': 'Profile'},
  ].obs;

  RxList<Widget> pages = [
    UserHomeDashboardView(),
    BookingPage(),
    MessageView(),
    WishlistView(),
    ProfileView(),
  ].obs;

}