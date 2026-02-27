import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:marketplaceapp/module/module.dart';


class UserPlannerProfileController extends GetxController {
  BuildContext context;
  String userId;
  RxBool isLoading = false.obs;
  UserPlannerProfileController({required this.context,required this.userId});
  Rx<GetPlannerAllPortfolioResponseModel> getPlannerAllPortfolioResponseModel = GetPlannerAllPortfolioResponseModel().obs;
  Rx<GetAllPlannerWiseServiceResponseModel> getAllPlannerWiseServiceResponseModel = GetAllPlannerWiseServiceResponseModel().obs;
  Rx<GetAllUserReviewResponseModel> getAllUserReviewResponseModel = GetAllUserReviewResponseModel().obs;
  Rx<GetPlannerProfileDetailsResponseModel> getPlannerProfileDetailsResponseModel = GetPlannerProfileDetailsResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!)).obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getPlannerProfileDetailsController(
        context: context,
        userId: userId,
        onComplete: (userId) async {
          await getAllUserReviewController(context: context, userId: userId);
          await getAllPlannerWiseServiceDetailsController(context: context, userId: userId);
          await getPlannerAllPortfolioController(context: context, userId: userId);
        },
      );
    });
  }

  Future<void> getPlannerProfileDetailsController({
    required BuildContext context,
    required String userId,
    required Function onComplete,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getPlannerProfileResponse(userId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        getPlannerProfileDetailsResponseModel.value = GetPlannerProfileDetailsResponseModel.fromJson(data);
        onComplete(getPlannerProfileDetailsResponseModel.value.data?.sId);
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

  Future<void> getAllPlannerWiseServiceDetailsController({
    required BuildContext context,
    required String userId,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getUserWisePlannerService(userId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        getAllPlannerWiseServiceResponseModel.value = GetAllPlannerWiseServiceResponseModel.fromJson(data);
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

  Future<void> getPlannerAllPortfolioController({
    required BuildContext context,
    required String userId,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getPlannerAllPortfolio(userId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getPlannerAllPortfolioResponseModel.value = GetPlannerAllPortfolioResponseModel.fromJson(data);
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


  Future<void> getAllUserReviewController({
    required BuildContext context,
    required String userId,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllUserReview(userId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        getAllUserReviewResponseModel.value = GetAllUserReviewResponseModel.fromJson(data);
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


  RxDouble rating = 4.7.obs;

  RxInt totalReviews = 5200.obs;

  RxMap<int, int> ratingCounts = {
    5: 3200,
    4: 1300,
    3: 800,
    2: 120,
    1: 80,
  }.obs;

  var plannerServices = List.generate(2, (index) => {
    'name': 'Here is a Client Profile',
    'rating': 4.7,
    'reviews': 320,
    'imageUrl': ImageUtils.recomendedImage,
  }).obs;

  RxList<UserReviewVendorModel> reviews = <UserReviewVendorModel>[
    UserReviewVendorModel(
      userName: "SRP–Polash",
      userImage: "https://i.pravatar.cc/100?img=1",
      rating: 5.0,
      review: "Sunghee was a great sitter and Dallas thoroughly enjoyed his stay.",
    ),
    UserReviewVendorModel(
      userName: "SRP–Polash",
      userImage: "https://i.pravatar.cc/100?img=5",
      rating: 4.0,
      review: "Sunghee was a great sitter and Dallas thoroughly enjoyed his stay.",
    ),
    UserReviewVendorModel(
      userName: "SRP–Polash",
      userImage: "https://i.pravatar.cc/100?img=5",
      rating: 3.5,
      review: "Sunghee was a great sitter and Dallas thoroughly enjoyed his stay.",
    ),
    UserReviewVendorModel(
      userName: "SRP–Polash",
      userImage: "https://i.pravatar.cc/100?img=5",
      rating: 5.0,
      review: "Sunghee was a great sitter and Dallas thoroughly enjoyed his stay.",
    ),
  ].obs;

  Rx<UserVendorProfileTab> selectedTab = UserVendorProfileTab.overview.obs;

  void changeTab(UserVendorProfileTab selectTab) {
    selectedTab.value = selectTab;
  }


}


enum UserVendorProfileTab { overview, reviews }


class UserReviewVendorModel {
  final String userName;
  final String userImage;
  final double rating;
  final String review;

  UserReviewVendorModel({
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.review,
  });
}