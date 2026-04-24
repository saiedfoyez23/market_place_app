import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/vendor/authorization/controller/jwt_validator_controller.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserLoginController extends GetxController {

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  RxBool isCheck = false.obs;
  RxBool isSubmit = false.obs;
  RxString fcmToken = "".obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await getRememberMe(role: "user");
      await initialFirebaseMessaging();
    });
  }

  Future<void> initialFirebaseMessaging() async {
    String? token = await FirebaseMessaging.instance.getToken();
    fcmToken.value = token!;
  }


  /// 🔑 Dynamic key based on role
  String _rememberMeKey(String role) {
    switch (role) {
      case 'user':
        return AppConstantUtils.rememberMeData;
      case 'vendor':
        return AppConstantUtils.vendorRememberMeData;
      case 'planer':
        return AppConstantUtils.plannerRememberMeData;
      default:
        throw Exception("Invalid role: $role");
    }
  }

  /// 💾 Save Remember Me
  Future<void> rememberMe({required String role}) async {
    try {
      final data = {
        "email": emailController.value.text.trim(),
        "password": passwordController.value.text.trim(),
      };
      await LocalStorageUtils.setString(
        _rememberMeKey(role),
        jsonEncode(data),
      );
      isCheck.value = true;
    } catch (e) {
      print("RememberMe Save Error: $e");
    }
  }

  /// 📥 Get Remember Me
  Future<void> getRememberMe({required String role}) async {
    try {
      final storedData =
      LocalStorageUtils.getString(_rememberMeKey(role));
      if (storedData != null && storedData.isNotEmpty) {
        final decoded = jsonDecode(storedData);
        emailController.value.text = decoded["email"] ?? "";
        passwordController.value.text = decoded["password"] ?? "";
        isCheck.value = true;
      } else {
        isCheck.value = false;
      }
    } catch (e) {
      print("RememberMe Get Error: $e");
      isCheck.value = false;
    }
  }

  /// ❌ Clear Remember Me (optional but useful)
  Future<void> clearRememberMe({required String role}) async {
    try {
      await LocalStorageUtils.remove(_rememberMeKey(role));
      emailController.value.clear();
      passwordController.value.clear();
      isCheck.value = false;
    } catch (e) {
      print("RememberMe Clear Error: $e");
    }
  }

  // Future<void> rememberMe() async {
  //   Map<String,dynamic> data = {
  //     "email" : emailController.value.text,
  //     "password" : passwordController.value.text,
  //   };
  //   await LocalStorageUtils.setString(AppConstantUtils.rememberMeData, jsonEncode(data));
  // }
  //
  // Future<void> getRememberMe() async {
  //   if(LocalStorageUtils.getString(AppConstantUtils.rememberMeData) != null) {
  //     isCheck.value = true;
  //     emailController.value.text = jsonDecode(LocalStorageUtils.getString(AppConstantUtils.rememberMeData)!)["email"];
  //     passwordController.value.text = jsonDecode(LocalStorageUtils.getString(AppConstantUtils.rememberMeData)!)["password"];
  //   }
  // }
  //
  // Future<void> removeRememberMe() async {
  //   isCheck.value = false;
  //   emailController.value.clear();
  //   passwordController.value.clear();
  //   await LocalStorageUtils.remove(AppConstantUtils.rememberMeData);
  // }



  Future<void> userLoginController({
    required BuildContext context,
    required bool isChecked,
    required String password,
    required String email,
    required String fcmToken,
  }) async {
    isSubmit.value = true;

    Map<String,dynamic> requestData = {
      "email": email,
      "password": password,
      "fcmToken": fcmToken,
    };

    print(requestData);

    BaseApiUtils.post(
      url: ApiUtils.userLogin,
      data: requestData,
      onSuccess: (e, data) async {
        final token = data["data"]["accessToken"];

        final result = JwtValidatorController.validateToken(
          token: token,
          // 👇 allow all roles here
          allowedRoles: ['user', 'vendor', 'planer'],
        );

        if (result['isValid'] == true) {
          final decoded = result['data'];
          final role = decoded['role'];
          final isKYCSubmit = data['data']['user']['isKYCSubmit'] ?? false;

          // ✅ Save based on role
          await _storeLoginData(role: role, data: data,isChecked: isChecked);

          MessageSnackBarWidget.successSnackBarWidget(
            context: context,
            message: e,
          );

          // ✅ Redirect based on role
          _redirectUser(
            role: role,
            isKYCSubmit: isKYCSubmit,
            requestData: requestData,
          );

          print("Login Role: $role | Email: ${decoded['email']}");
        } else {
          MessageSnackBarWidget.errorSnackBarWidget(
            context: context,
            message: result['message'],
          );
        }

        isSubmit.value = false;
      },
      onFail: (e, data) {
        isSubmit.value = false;
        MessageSnackBarWidget.errorSnackBarWidget(
          context: context,
          message: e,
        );
      },
      onExceptionFail: (e, data) {
        isSubmit.value = false;
        MessageSnackBarWidget.errorSnackBarWidget(
          context: context,
          message: e,
        );
      },
    );
  }


  Future<void> _storeLoginData({required String role, required dynamic data,required bool isChecked}) async {
    switch (role) {
      case 'user':
        if(isChecked == true) {
          await rememberMe(role: role);
          await LocalStorageUtils.setString(AppConstantUtils.userLoginResponse, jsonEncode(data),);
        } else {
          await LocalStorageUtils.setString(AppConstantUtils.userLoginResponse, jsonEncode(data),);
        }
        break;
      case 'vendor':
        if(isChecked == true) {
          await rememberMe(role: role);
          await LocalStorageUtils.setString(AppConstantUtils.vendorLoginResponse, jsonEncode(data),);
        } else {
          await LocalStorageUtils.setString(AppConstantUtils.vendorLoginResponse, jsonEncode(data),);
        }
        break;
      case 'planer':
        if(isChecked == true) {
          await rememberMe(role: role);
          await LocalStorageUtils.setString(AppConstantUtils.plannerLoginResponse, jsonEncode(data),);
        } else { await LocalStorageUtils.setString(AppConstantUtils.plannerLoginResponse, jsonEncode(data),);
        }
        break;
    }
  }


  Future<void> _redirectUser({
    required String role,
    required bool isKYCSubmit,
    required Map<String,dynamic> requestData,
  }) async {
    switch (role) {
      case 'user':
        Get.off(() => DashboardUserView(index: 0), preventDuplicates: false);
        break;

      case 'vendor':
        if (!isKYCSubmit) {
          await LocalStorageUtils.setString(AppConstantUtils.vendorLoginLocalData, jsonEncode(requestData));
          Get.off(() => VendorCreateAccountSetUpProfileView(), preventDuplicates: false);
        } else {
          Get.off(() => DashboardVendorView(index: 0), preventDuplicates: false);
        }
        break;

      case 'planer':
        if (!isKYCSubmit) {
          await LocalStorageUtils.setString(AppConstantUtils.plannerLoginLocalData, jsonEncode(requestData));
          Get.off(() => PlannerCreateAccountSetUpProfileView(), preventDuplicates: false);
        } else {
          Get.off(() => DashboardPlannerView(index: 0), preventDuplicates: false);
        }
        break;

      default:
        Get.snackbar("Error", "Unknown role: $role");
    }
  }


  // Future<void> userLoginController({
  //   required BuildContext context,
  //   required String password,
  //   required String email,
  //   required String fcmToken
  // }) async {
  //
  //   isSubmit.value = true;
  //
  //   Map<String,dynamic> data = {
  //     "email": email,
  //     "password": password,
  //     "fcmToken": fcmToken,
  //   };
  //
  //   print(data);
  //
  //   BaseApiUtils.post(
  //     url: ApiUtils.userLogin,
  //     data: data,
  //     onSuccess: (e,data) async {
  //       final result = JwtValidatorController.validateToken(
  //         token: data["data"]["accessToken"],
  //         allowedRoles: ['user'],
  //       );
  //       if (result['isValid'] == true) {
  //         await LocalStorageUtils.setString(AppConstantUtils.userLoginResponse, jsonEncode(data));
  //         MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
  //         isSubmit.value = false;
  //         Get.off(()=>DashboardUserView(index: 0,),preventDuplicates: false);
  //         print("User Email: ${result['data']['email']}");
  //       }  else {
  //         isSubmit.value = false;
  //         MessageSnackBarWidget.errorSnackBarWidget(context: context, message: result['message']);
  //       }
  //     },
  //     onFail: (e,data) {
  //       MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
  //       isSubmit.value = false;
  //     },
  //     onExceptionFail: (e,data) {
  //       MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
  //       isSubmit.value = false;
  //     },
  //   );
  //
  // }



}