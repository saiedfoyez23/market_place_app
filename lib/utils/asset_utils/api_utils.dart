class ApiUtils {


  //static const baseUrl = "http://206.162.244.133:5020/api/v1";
  static const baseUrl = "http://74.118.168.203:5020/api/v1";


  //user
  static const String userRegistration = "$baseUrl/users/register"; //done
  static const String userRegistrationResendOtp = "$baseUrl/otp/resend-otp"; //done
  static const String userRegistrationVerifyOtp = "$baseUrl/otp/verify-otp"; //done
  static const String userForgetPassword = "$baseUrl/auth/forget-password"; //done
  static const String userResetPassword = "$baseUrl/auth/reset-password"; //done
  static const String userLogin = "$baseUrl/auth/login"; //done
  static const String userProfileDetails = "$baseUrl/users/my-profile"; //done

}