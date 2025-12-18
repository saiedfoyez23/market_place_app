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

  Future<void> plannerLoginRedirection() async {
    if(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse) != null) {
      userLoginResponseModel.value = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!));
      if(userLoginResponseModel.value.data != null) {
        if(userLoginResponseModel.value.data?.user?.isKYCSubmit == true) {
          Get.off(()=>DashboardPlannerView(index: 0,),preventDuplicates: false);
        } else {
          Get.off(()=>PlannerCreateAccountSetUpProfileView(),preventDuplicates: false);
        }
      } else {
        Get.off(()=>PlanerOnboardingView(),preventDuplicates: false);
      }
    } else {
      Get.off(()=>PlanerOnboardingView(),preventDuplicates: false);
    }
  }


}