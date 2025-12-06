class UserProfileResponseModel {
  var success;
  var statusCode;
  var message;
  UserProfileResponse? data;

  UserProfileResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  UserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new UserProfileResponse.fromJson(json['data']) : null;
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

class UserProfileResponse {
  var sId;
  var name;
  var email;
  var photoUrl;
  var contractNumber;
  var address;
  var locationUrl;
  UserProfileResponseSocialProfiles? socialProfiles;
  var role;
  var status;
  var avgRating;
  var ratingCount;
  var isKycVerified;
  var id;
  var createdAt;

  UserProfileResponse({
    this.sId,
    this.name,
    this.email,
    this.photoUrl,
    this.contractNumber,
    this.address,
    this.locationUrl,
    this.socialProfiles,
    this.role,
    this.status,
    this.avgRating,
    this.ratingCount,
    this.isKycVerified,
    this.id,
    this.createdAt,
  });

  UserProfileResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    contractNumber = json['contractNumber'];
    address = json['address'];
    locationUrl = json['locationUrl'];
    socialProfiles = json['socialProfiles'] != null
        ? new UserProfileResponseSocialProfiles.fromJson(json['socialProfiles'])
        : null;
    role = json['role'];
    status = json['status'];
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
    isKycVerified = json['isKycVerified'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['contractNumber'] = this.contractNumber;
    data['address'] = this.address;
    data['locationUrl'] = this.locationUrl;
    if (this.socialProfiles != null) {
      data['socialProfiles'] = this.socialProfiles!.toJson();
    }
    data['role'] = this.role;
    data['status'] = this.status;
    data['avgRating'] = this.avgRating;
    data['ratingCount'] = this.ratingCount;
    data['isKycVerified'] = this.isKycVerified;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class UserProfileResponseSocialProfiles {
  var instagram;
  var linkedin;
  var website;

  UserProfileResponseSocialProfiles({this.instagram, this.linkedin, this.website});

  UserProfileResponseSocialProfiles.fromJson(Map<String, dynamic> json) {
    instagram = json['instagram'];
    linkedin = json['linkedin'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instagram'] = this.instagram;
    data['linkedin'] = this.linkedin;
    data['website'] = this.website;
    return data;
  }
}
