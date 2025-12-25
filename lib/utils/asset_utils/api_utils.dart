class ApiUtils {


  //static const baseUrl = "http://206.162.244.133:5020/api/v1";
  //static const baseUrl = "http://72.244.153.29:5020/api/v1";
  //static const socketUrl = "http://72.244.153.29:4020/";
  static const baseUrl = "http://10.10.10.16:5020/api/v1";


  //user
  static const String userRegistration = "$baseUrl/users/register"; //done
  static const String userRegistrationResendOtp = "$baseUrl/otp/resend-otp"; //done
  static const String userRegistrationVerifyOtp = "$baseUrl/otp/verify-otp"; //done
  static const String userForgetPassword = "$baseUrl/auth/forget-password"; //done
  static const String userResetPassword = "$baseUrl/auth/reset-password"; //done
  static const String userLogin = "$baseUrl/auth/login"; //done
  static const String userProfileDetails = "$baseUrl/users/my-profile"; //done
  static const String userContent = "$baseUrl/contents"; //done
  static const String userChangeNotify = "$baseUrl/users/change-notify"; //done
  static const String userChangePassword = "$baseUrl/auth/change-password"; //done
  static const String categoryResponse = "$baseUrl/categories?limit=1000000000"; //done
  static const String userUpdateMyProfile = "$baseUrl/users/update-my-profile"; //done
  static const String userKycVerification = "$baseUrl/verifications"; //done
  static const String userPlannerFAQ = "$baseUrl/faq?audience=planer&limit=10000000000"; //done
  static const String userVendorFAQ = "$baseUrl/faq?audience=vendor&limit=10000000000"; //done
  static const String userCustomerFAQ = "$baseUrl/faq?audience=user&limit=10000000000"; //done
  static const String createPortfolio = "$baseUrl/portfolio"; //done
  static const String userWisePortfolio = "$baseUrl/portfolio?limit=1000000000"; //done
  static const String deletePortfolio = "$baseUrl/portfolio/"; //done


}