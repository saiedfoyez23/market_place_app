import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerServiceDetailsController extends GetxController {

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

class ServiceDetailsModel {
  String title;
  String description;
  String imageUrl;
  List<ServiceSection> sections;
  VendorModel vendor;
  List<ReviewModel> reviews;

  ServiceDetailsModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.sections,
    required this.vendor,
    required this.reviews,
  });
}


class ServiceSection {
  String title;
  List<String> items;

  ServiceSection({required this.title, required this.items});
}

class VendorModel {
  final String name;
  final String image;
  final String category;
  final String location;
  final String about;
  final bool verified;

  VendorModel({
    required this.name,
    required this.image,
    required this.category,
    required this.location,
    required this.about,
    required this.verified,
  });
}

class ReviewModel {
  final String userName;
  final String image;
  final double rating;
  final String comment;

  ReviewModel({
    required this.userName,
    required this.image,
    required this.rating,
    required this.comment,
  });
}