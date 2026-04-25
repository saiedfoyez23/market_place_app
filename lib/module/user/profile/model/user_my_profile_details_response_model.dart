class UserMyProfileDetailsResponseModel {
  var success;
  var statusCode;
  var message;
  UserMyProfileDetailsResponse? data;

  UserMyProfileDetailsResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  UserMyProfileDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new UserMyProfileDetailsResponse.fromJson(json['data']) : null;
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

class UserMyProfileDetailsResponse {
  var sId;
  var name;
  var email;
  var photoUrl;
  var coverPhoto;
  var contractNumber;
  var address;
  var bio;
  var locationUrl;
  UserMyProfileDetailsResponseLocation? location;
  UserMyProfileDetailsResponseSocialProfiles? socialProfiles;
  var role;
  var status;
  var avgRating;
  var ratingCount;
  UserMyProfileDetailsResponseNotifySettings? notifySettings;
  var isKycVerified;
  var id;
  var createdAt;
  var isActiveSubscription;
  var type;
  var isPaystackRecipient;
  var isUnreadMessage;
  var unreadMessageCount;

  UserMyProfileDetailsResponse({
    this.sId,
    this.name,
    this.email,
    this.photoUrl,
    this.coverPhoto,
    this.contractNumber,
    this.address,
    this.bio,
    this.locationUrl,
    this.location,
    this.socialProfiles,
    this.role,
    this.status,
    this.avgRating,
    this.ratingCount,
    this.notifySettings,
    this.isKycVerified,
    this.id,
    this.createdAt,
    this.isActiveSubscription,
    this.type,
    this.isPaystackRecipient,
    this.isUnreadMessage,
    this.unreadMessageCount,
  });

  UserMyProfileDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    coverPhoto = json['coverPhoto'];
    contractNumber = json['contractNumber'];
    address = json['address'];
    bio = json['bio'];
    locationUrl = json['locationUrl'];
    location = json['location'] != null
        ? new UserMyProfileDetailsResponseLocation.fromJson(json['location'])
        : null;
    socialProfiles = json['socialProfiles'] != null
        ? new UserMyProfileDetailsResponseSocialProfiles.fromJson(json['socialProfiles'])
        : null;
    role = json['role'];
    status = json['status'];
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
    notifySettings = json['notifySettings'] != null
        ? new UserMyProfileDetailsResponseNotifySettings.fromJson(json['notifySettings'])
        : null;
    isKycVerified = json['isKycVerified'];
    id = json['id'];
    createdAt = json['createdAt'];
    isActiveSubscription = json['isActiveSubscription'];
    type = json['type'];
    isPaystackRecipient = json['isPaystackRecipient'];
    isUnreadMessage = json['isUnreadMessage'];
    unreadMessageCount = json['unreadMessageCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['coverPhoto'] = this.coverPhoto;
    data['contractNumber'] = this.contractNumber;
    data['address'] = this.address;
    data['bio'] = this.bio;
    data['locationUrl'] = this.locationUrl;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.socialProfiles != null) {
      data['socialProfiles'] = this.socialProfiles!.toJson();
    }
    data['role'] = this.role;
    data['status'] = this.status;
    data['avgRating'] = this.avgRating;
    data['ratingCount'] = this.ratingCount;
    if (this.notifySettings != null) {
      data['notifySettings'] = this.notifySettings!.toJson();
    }
    data['isKycVerified'] = this.isKycVerified;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['isActiveSubscription'] = this.isActiveSubscription;
    data['type'] = this.type;
    data['isPaystackRecipient'] = this.isPaystackRecipient;
    data['isUnreadMessage'] = this.isUnreadMessage;
    data['unreadMessageCount'] = this.unreadMessageCount;
    return data;
  }
}

class UserMyProfileDetailsResponseLocation {
  var type;
  List<dynamic>? coordinates;

  UserMyProfileDetailsResponseLocation({this.type, this.coordinates});

  UserMyProfileDetailsResponseLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class UserMyProfileDetailsResponseSocialProfiles {
  var instagram;
  var linkedin;
  var website;

  UserMyProfileDetailsResponseSocialProfiles({this.instagram, this.linkedin, this.website});

  UserMyProfileDetailsResponseSocialProfiles.fromJson(Map<String, dynamic> json) {
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

class UserMyProfileDetailsResponseNotifySettings {
  var all;
  var profile;
  var service;
  var bookings;
  var subscription;
  var payment;

  UserMyProfileDetailsResponseNotifySettings({
    this.all,
    this.profile,
    this.service,
    this.bookings,
    this.subscription,
    this.payment,
  });

  UserMyProfileDetailsResponseNotifySettings.fromJson(Map<String, dynamic> json) {
    all = json['all'];
    profile = json['profile'];
    service = json['service'];
    bookings = json['bookings'];
    subscription = json['subscription'];
    payment = json['payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    data['profile'] = this.profile;
    data['service'] = this.service;
    data['bookings'] = this.bookings;
    data['subscription'] = this.subscription;
    data['payment'] = this.payment;
    return data;
  }
}
