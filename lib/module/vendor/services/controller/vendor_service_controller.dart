import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';


class VendorServiceController extends GetxController {

  RxList<Map<String, dynamic>> serviceList = <Map<String, dynamic>>[
    {
      "image": ImageUtils.wishlistImage,
      "title": "Kids Birthday Party Extravaganza",
      "description":
      "Colorful themed decorations with games, entertainment, and birthday cake arrangement.",
      "location": "Mohakhali, gulsan 01",
    },
    {
      "image": ImageUtils.wishlistImage,
      "title": "Kids Birthday Party Extravaganza",
      "description":
      "Colorful themed decorations with games, entertainment, and birthday cake arrangement.",
      "location": "Mohakhali, gulsan 01",
    },
    {
      "image": ImageUtils.wishlistImage,
      "title": "Kids Birthday Party Extravaganza",
      "description":
      "Colorful themed decorations with games, entertainment, and birthday cake arrangement.",
      "location": "Mohakhali, gulsan 01",
    },
  ].obs;



}