import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';

class SplashController extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 3),() async {
      Get.off(()=>ChooseUserView(),preventDuplicates: false);
    });
  }

}