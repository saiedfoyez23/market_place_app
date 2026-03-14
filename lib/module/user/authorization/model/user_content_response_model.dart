class UserContentResponseModel {
  var success;
  var statusCode;
  var message;
  UserContentResponse? data;

  UserContentResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  UserContentResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new UserContentResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserContentResponse {
  var sId;
  var aboutUs;
  var termsAndConditions;
  var privacyPolicy;
  var supports;
  var faq;
  var isDeleted;
  var createdAt;
  var updatedAt;

  UserContentResponse({
    this.sId,
    this.aboutUs,
    this.termsAndConditions,
    this.privacyPolicy,
    this.supports,
    this.faq,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  UserContentResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    aboutUs = json['aboutUs'];
    termsAndConditions = json['termsAndConditions'];
    privacyPolicy = json['privacyPolicy'];
    supports = json['supports'];
    faq = json['faq'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['aboutUs'] = this.aboutUs;
    data['termsAndConditions'] = this.termsAndConditions;
    data['privacyPolicy'] = this.privacyPolicy;
    data['supports'] = this.supports;
    data['faq'] = this.faq;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
