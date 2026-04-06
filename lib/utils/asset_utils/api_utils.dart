class ApiUtils {


  //static const baseUrl = "http://206.162.244.133:5020/api/v1";
  static const baseUrl = "http://72.244.153.29:5020/api/v1";
  static const socketUrl = "http://72.244.153.29:4020/";
  //static const socketUrl = "http://206.162.244.133:4020/";
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
  static const String getAllPlannerServiceResponse = "$baseUrl/services/active?authority=planer&limit=10000000000"; //done
  static const String getAllVendorServiceResponse = "$baseUrl/services/active?authority=vendor&limit=10000000000"; //done
  static const String createFavoriteResponse = "$baseUrl/favorites"; //done
  static const String getAllRecommendedServiceResponse = "$baseUrl/services/recommend?limit=1000000000"; //done
  static const String getAllCategoryServiceResponse = "$baseUrl/services/active?authority=planer&category="; //done
  static const String getAllVendorCategoryServiceResponse = "$baseUrl/services/active?authority=vendor&category="; //done
  static const String getAllFavoritesResponse = "$baseUrl/favorites?limit=1000000000"; //done
  static const String getUserSearchResponse = "$baseUrl/search-histories?limit=100000000"; //done
  static const String deleteFavoritesResponse = "$baseUrl/favorites"; //done
  static const String serviceDetailsResponse = "$baseUrl/services"; //done
  static const String getAllUserOrder = "$baseUrl/orders/author/my-client-orders?limit=10000000000"; //done
  static const String createReview = "$baseUrl/reviews"; //done
  static const String createPayments = "$baseUrl/payments/checkout"; //done
  static const String createSubscriptions = "$baseUrl/subscriptions"; //done
  static const String clearHistories = "$baseUrl/search-histories/clear-histories"; //done
  static const String createHistories = "$baseUrl/search-histories"; //done
  static const String getAllPackageResponse = "$baseUrl/packages?audience=planer&limit=100000000"; //done
  static const String getAllVendorPackageResponse = "$baseUrl/packages?audience=vendor&limit=100000000"; //done
  static const String userMySubscription = "$baseUrl/subscriptions/my-subscription"; //done
  static const String createTasksResponse = "$baseUrl/tasks"; //done
  static const String createFileResponse = "$baseUrl/files"; //done
  static const String createAssignVendors = "$baseUrl/assign-vendors"; //done
  static const String getVendorHomePage = "$baseUrl/meta/vendor"; //done
  static const String getPlannerEventResponse = "$baseUrl/analysis/planer-event"; //done
  static const String getPlannerVendorResponse = "$baseUrl/analysis/planer-vendor"; //done
  static const String getAllMessageResponseList = "$baseUrl/chats/my-chats?limit=1000000000"; //done
  static const String createMessageResponseList = "$baseUrl/chats"; //done
  static const String getAllNotification = "$baseUrl/notifications?limit=10000000000"; //done
  static const String markAllAsRead = "$baseUrl/notifications?limit=10000000000"; //done
  static const String planerMeta = "$baseUrl/meta/planer"; //done
  static const String createSupport = "$baseUrl/supports"; //done
  static const String getWithdraw = "$baseUrl/withdraw/my-withdraw"; //done
  static const String createPaystack = "$baseUrl/paystack-recipients/connect"; //done
  static const String getAllPaystack = "$baseUrl/paystack-recipients/my-recipients"; //done
  static const String uploadFile = "$baseUrl/uploads/multiple";
  static String getUserOrderDetails(String orderId) {
    return "$baseUrl/orders/${orderId}";
  }
  static String getAllUserReview(String userId) {
    return "$baseUrl/reviews/user/${userId}?limit=100000000000";
  }
  static String getPlannerProfileResponse(String userId) {
    return "$baseUrl/users/${userId}";
  }
  static String getUserWisePlannerService(String userId) {
    return "$baseUrl/services/user/${userId}?limit=10000000000";
  }
  static String getUserFeaturedService(String userId) {
    return "$baseUrl/services/featured/${userId}?limit=10000000000";
  }
  static String getPlannerAllPortfolio(String userId) {
    return "$baseUrl/portfolio/user/${userId}?limit=100000000000";
  }
  static String userOrderCancel(String orderId) {
    return "$baseUrl/orders/canceled/${orderId}";
  }
  static String userOrderDenied(String orderId) {
    return "$baseUrl/orders/status/${orderId}";
  }
  static String getSearchResponse(String searchTerm) {
    return "$baseUrl/search-histories/search-data?searchTerm=${searchTerm}";
  }
  static String deleteSingleResponse(String searchId) {
    return "$baseUrl/search-histories/${searchId}";
  }
  static String cancelSubscriptionResponse(String plainId) {
    return "$baseUrl/subscriptions/cancel/${plainId}";
  }
  static String projectDetailsResponse(String projectId) {
    return "$baseUrl/projects/${projectId}";
  }
  static String getAllTaskResponse(String projectId) {
    return "$baseUrl/tasks/project/${projectId}?limit=1000000000";
  }
  static String changeTaskStatusResponse(String taskId) {
    return "$baseUrl/tasks/status/${taskId}";
  }
  static String deleteTaskResponse(String taskId) {
    return "$baseUrl/tasks/${taskId}";
  }
  static String getAllFileResponse(String projectId) {
    return "$baseUrl/files/project/${projectId}?limit=1000000000";
  }
  static String deleteFileResponse(String fileId) {
    return "$baseUrl/files/${fileId}";
  }
  static String getAllCompareQuotes(String projectId) {
    return "$baseUrl/assign-vendors/compare-quotes/${projectId}?limit=1000000000";
  }
  static String getAllProjectVendor(String projectId) {
    return "$baseUrl/assign-vendors/project/${projectId}?limit=10000000000";
  }
  static String getAllVendorPayment(String projectId) {
    return "$baseUrl/projects/payment-overview/${projectId}?limit=10000000000";
  }
  static String getVendorMakePayment(String paymentId) {
    return "$baseUrl/assign-vendors/make-payment/${paymentId}";
  }
  static String addFeatureController(String serviceId) {
    return "$baseUrl/services/featured/${serviceId}";
  }
  static String getVendorAnalyticResponse(String orderYear,String subscriptionYear,String bookingYear) {
    return "$baseUrl/analysis/vendor?order_year=${orderYear}&subscription_year=${subscriptionYear}&booking_year=${bookingYear}";
  }
  static String getPlannerAnalyticResponse(String eventYear,String categoryYear,String revenueYear) {
    return "$baseUrl/analysis/planer-revenue?event_year=${eventYear}&category_year=${categoryYear}&revenue_year=${revenueYear}";
  }
  static String getAllMessageResponseModelType(String modelType) {
    return "$baseUrl/chats/my-chats?limit=1000000000&modelType=${modelType}";
  }
  static String getAllMessageResponseSearch(String modelType,String searchTerm) {
    return "$baseUrl/chats/my-chats?searchTerm=${searchTerm}&limit=1000000000&modelType=${modelType}";
  }
  static String getChatDetails(String chatId) {
    return "$baseUrl/chats/${chatId}";
  }
  static String getAllMessage(String chatId) {
    return "$baseUrl/messages/chat/${chatId}?limit=10000000000";
  }
  static String seenAllMessage(String chatId) {
    return "$baseUrl/messages/seen/${chatId}";
  }
  static String deleteNotification(String notificationId) {
    return "$baseUrl/notifications/${notificationId}";
  }
  static String getAllPlannerLeads(String tab) {
    return "$baseUrl/analysis/planer-leads?tab=${tab}&limit=1000000000";
  }
  static String getAllVendorLeads(String tab) {
    return "$baseUrl/analysis/vendor-leads?tab=${tab}&limit=1000000000";
  }
  static String deletePaystack(String bankInformationId) {
    return "$baseUrl/paystack-recipients/${bankInformationId}";
  }
  static String deleteMessage(String messageId) {
    return "$baseUrl/messages/${messageId}";
  }
  static String deleteChatIdMessage(String chatId) {
    return "$baseUrl/messages/chat/${chatId}";
  }

}