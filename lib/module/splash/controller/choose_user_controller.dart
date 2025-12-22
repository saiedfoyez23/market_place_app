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
        Get.delete<ChooseUserController>(force: true);
        Get.off(()=>DashboardUserView(index: 0,),preventDuplicates: false);
      } else {
        Get.delete<ChooseUserController>(force: true);
        Get.off(()=>UserOnboardingView(),preventDuplicates: false);
      }
    } else {
      Get.delete<ChooseUserController>(force: true);
      Get.off(()=>UserOnboardingView(),preventDuplicates: false);
    }
  }

  Future<void> plannerLoginRedirection() async {
    if(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse) != null) {
      userLoginResponseModel.value = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!));
      if(userLoginResponseModel.value.data != null) {
        if(userLoginResponseModel.value.data?.user?.isKYCSubmit == true) {
          Get.delete<ChooseUserController>(force: true);
          Get.off(()=>DashboardPlannerView(index: 0,),preventDuplicates: false);
        } else {
          Get.delete<ChooseUserController>(force: true);
          Get.off(()=>PlannerCreateAccountSetUpProfileView(),preventDuplicates: false);
        }
      } else {
        Get.delete<ChooseUserController>(force: true);
        Get.off(()=>PlanerOnboardingView(),preventDuplicates: false);
      }
    } else {
      Get.delete<ChooseUserController>(force: true);
      Get.off(()=>PlanerOnboardingView(),preventDuplicates: false);
    }
  }


  Future<void> vendorLoginRedirection() async {
    if(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse) != null) {
      userLoginResponseModel.value = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.vendorLoginResponse)!));
      if(userLoginResponseModel.value.data != null) {
        if(userLoginResponseModel.value.data?.user?.isKYCSubmit == true) {
          Get.delete<ChooseUserController>(force: true);
          Get.off(()=>DashboardVendorView(index: 0,),preventDuplicates: false);
        } else {
          Get.delete<ChooseUserController>(force: true);
          Get.off(()=>VendorCreateAccountSetUpProfileView(),preventDuplicates: false);
        }
      } else {
        Get.delete<ChooseUserController>(force: true);
        Get.off(()=>VendorOnboardingView(),preventDuplicates: false);
      }
    } else {
      Get.off(()=>VendorOnboardingView(),preventDuplicates: false);
    }
  }


}