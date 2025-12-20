class PlannerMyProfileDetailsResponseModel {
  var success;
  var statusCode;
  var message;
  PlannerMyProfileDetailsResponse? data;

  PlannerMyProfileDetailsResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  PlannerMyProfileDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new PlannerMyProfileDetailsResponse.fromJson(json['data']) : null;
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

class PlannerMyProfileDetailsResponse {
  PlannerMyProfileDetailsLocation? location;
  var sId;
  var name;
  var email;
  var photoUrl;
  var coverPhoto;
  var contractNumber;
  var address;
  var bio;
  var locationUrl;
  PlannerMyProfileDetailsSocialProfiles? socialProfiles;
  var role;
  var status;
  var avgRating;
  var ratingCount;
  var isKycVerified;
  var id;
  var createdAt;

  PlannerMyProfileDetailsResponse({
    this.location,
    this.sId,
    this.name,
    this.email,
    this.photoUrl,
    this.coverPhoto,
    this.contractNumber,
    this.address,
    this.bio,
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

  PlannerMyProfileDetailsResponse.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new PlannerMyProfileDetailsLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    coverPhoto = json['coverPhoto'];
    contractNumber = json['contractNumber'];
    address = json['address'];
    bio = json['bio'];
    locationUrl = json['locationUrl'];
    socialProfiles = json['socialProfiles'] != null
        ? new PlannerMyProfileDetailsSocialProfiles.fromJson(json['socialProfiles'])
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
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['coverPhoto'] = this.coverPhoto;
    data['contractNumber'] = this.contractNumber;
    data['address'] = this.address;
    data['bio'] = this.bio;
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

class PlannerMyProfileDetailsLocation {
  String? type;
  List<int>? coordinates;

  PlannerMyProfileDetailsLocation({this.type, this.coordinates});

  PlannerMyProfileDetailsLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class PlannerMyProfileDetailsSocialProfiles {
  var instagram;
  var linkedin;
  var website;

  PlannerMyProfileDetailsSocialProfiles({this.instagram, this.linkedin, this.website});

  PlannerMyProfileDetailsSocialProfiles.fromJson(Map<String, dynamic> json) {
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
