import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';


class DashboardUserController extends GetxController {

  RxInt selectedIndex = 0.obs;
  int index;
  Rx<UserMyProfileDetailsResponseModel> userMyProfileDetailsResponseModel = UserMyProfileDetailsResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;
  BuildContext context;
  DashboardUserController({required this.index,required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await changeIndex(index: index);
      await getProfileController(context: context);
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
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
    );

  }



  Future<void> changeIndex({required int index}) async {
    selectedIndex.value = index;
  }


  RxList<Map<String, dynamic>> items = [
    {'unselected': ImageUtils.unselectHomeImage, 'select': ImageUtils.selectHomeImage, 'label': 'Home', "isMessage": false},
    {'unselected': ImageUtils.unselectMyBookingImage, 'select': ImageUtils.selectMyBookingImage, 'label': 'My Bookings', "isMessage": false},
    {'unselected': ImageUtils.unselectMessageImage, 'select': ImageUtils.selectMessageImage, 'label': 'Messages', "isMessage": true},
    {'unselected': ImageUtils.unselectWishlistImage, 'select': ImageUtils.selectWishlistImage, 'label': 'wishlist', "isMessage": false},
    {'unselected': ImageUtils.unselectProfileImage, 'select': ImageUtils.selectProfileImage, 'label': 'Profile', "isMessage": false},
  ].obs;

  RxList<Widget> pages = [
    UserHomeDashboardView(),
    UserBookingView(),
    MessageView(),
    WishlistView(),
    ProfileView(),
  ].obs;

}