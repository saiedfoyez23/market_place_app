class ApiUtils {


  //static const baseUrl = "http://206.162.244.133:5020/api/v1";
  static const baseUrl = "http://72.244.153.29:5020/api/v1";
  static const socketUrl = "http://72.244.153.29:4020/";
  //static const baseUrl = "http://10.10.10.16:5020/api/v1";


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
  static const String userDeleteProfile = "$baseUrl/users/delete-profile"; //done
  static const String categoryResponse = "$baseUrl/categories?limit=1000000000"; //done
  static const String userUpdateMyProfile = "$baseUrl/users/update-my-profile"; //done
  static const String userKycVerification = "$baseUrl/verifications"; //done
  static const String userPlannerFAQ = "$baseUrl/faq?audience=planer&limit=10000000000"; //done
  static const String userVendorFAQ = "$baseUrl/faq?audience=vendor&limit=10000000000"; //done
  static const String userCustomerFAQ = "$baseUrl/faq?audience=user&limit=10000000000"; //done
  static const String createPortfolio = "$baseUrl/portfolio"; //done
  static const String userWisePortfolio = "$baseUrl/portfolio?limit=1000000000"; //done
  static const String deletePortfolio = "$baseUrl/portfolio/"; //done
  static const String createService = "$baseUrl/services"; //done
  static const String myAllService = "$baseUrl/services/author/my-services?limit=100000000000"; //done
  static const String serviceDetails = "$baseUrl/services/"; //done
  static const String editService = "$baseUrl/services/"; //done
  static const String deleteService = "$baseUrl/services/"; //done
  static const String getAllPlanner = "$baseUrl/users?role=planer&limit=1000000000"; //done
  static const String getAllUsers = "$baseUrl/users?role=user&limit=1000000000"; //done
  static const String vendorCreateOrder = "$baseUrl/orders"; //done
  static const String getAllVendorOrder = "$baseUrl/orders/author/my-vendor-orders?limit=1000000000000"; //done
  static const String getVendorOrderDetails = "$baseUrl/orders"; //done
  static const String vendorOrderCancel = "$baseUrl/orders/canceled"; //done
  static const String plannerCreateOrder = "$baseUrl/orders"; //done
  static const String getPlannerAllClientOrder = "$baseUrl/orders/author/my-client-orders?limit=100000000000"; //done
  static const String getPlannerOrderDetails = "$baseUrl/orders"; //done
  static const String updatePlannerOrderStatus = "$baseUrl/orders/status"; //done
  static const String plannerOrderCancel = "$baseUrl/orders/canceled"; //done
  static const String getUserHomeResponse = "$baseUrl/meta/user"; //done
  static const String getAllPlannerServiceResponse = "$baseUrl/services/active?authority=planer&limit=1000000000"; //done
  static const String createFavoriteResponse = "$baseUrl/favorites"; //done
  static const String getAllRecommendedServiceResponse = "$baseUrl/services/recommend?limit=1000000000"; //done
  static const String getAllCategoryServiceResponse = "$baseUrl/services/active?authority=planer&category="; //done
  static const String getAllFavoritesResponse = "$baseUrl/favorites?limit=1000000000"; //done
  static const String deleteFavoritesResponse = "$baseUrl/favorites"; //done
  static const String serviceDetailsResponse = "$baseUrl/services"; //done
  static String getAllUserReview(String userId) {
    return "$baseUrl/reviews/user/${userId}?limit=100000000000";
  }
  static String getPlannerProfileResponse(String userId) {
    return "$baseUrl/users/${userId}";
  }
  static String getUserWisePlannerService(String userId) {
    return "$baseUrl/services/user/${userId}?limit=10000000000";
  }
  static String getPlannerAllPortfolio(String userId) {
    return "$baseUrl/portfolio/user/${userId}?limit=100000000000";
  }

}