import 'dart:convert';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import '../../../utils/utils.dart';

class ChooseUserController extends GetxController {

  RxString chooseUseRole = "".obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel().obs;

  void chooseUser({required String useRole}) {
    chooseUseRole.value = useRole;
  }


  Future<void> userLoginRedirection() async {
    if(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse) != null) {
      userLoginResponseModel.value = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!));
      if(userLoginResponseModel.value.data != null) {
        Get.off(()=>DashboardUserView(index: 0,),preventDuplicates: false);
      } else {
        Get.off(()=>UserOnboardingView(),preventDuplicates: false);
      }
    } else {
      Get.off(()=>UserOnboardingView(),preventDuplicates: false);
    }
  }


}