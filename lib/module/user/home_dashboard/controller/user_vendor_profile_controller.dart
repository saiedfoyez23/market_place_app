import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserVendorProfileController extends GetxController {

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