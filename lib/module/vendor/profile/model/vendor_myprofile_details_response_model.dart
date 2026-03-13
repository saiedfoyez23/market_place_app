class VendorMyProfileDetailsResponseModel {
  var success;
  var statusCode;
  var message;
  VendorMyProfileDetailsResponse? data;

  VendorMyProfileDetailsResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  VendorMyProfileDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new VendorMyProfileDetailsResponse.fromJson(json['data']) : null;
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

class VendorMyProfileDetailsResponse {
  var sId;
  var name;
  var email;
  var photoUrl;
  var coverPhoto;
  var contractNumber;
  var address;
  var bio;
  List<String>? categories;
  var locationUrl;
  VendorMyProfileDetailsResponseLocation? location;
  VendorMyProfileDetailsResponseSocialProfiles? socialProfiles;
  var role;
  var status;
  var avgRating;
  var ratingCount;
  VendorMyProfileDetailsResponseNotifySettings? notifySettings;
  var isKycVerified;
  var id;
  var createdAt;
  var isActiveSubscription;
  var type;
  var isPaystackRecipient;

  VendorMyProfileDetailsResponse({
    this.sId,
    this.name,
    this.email,
    this.photoUrl,
    this.coverPhoto,
    this.contractNumber,
    this.address,
    this.bio,
    this.categories,
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
  });

  VendorMyProfileDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    coverPhoto = json['coverPhoto'];
    contractNumber = json['contractNumber'];
    address = json['address'];
    bio = json['bio'];
    categories = json['categories'].cast<String>();
    locationUrl = json['locationUrl'];
    location = json['location'] != null
        ? new VendorMyProfileDetailsResponseLocation.fromJson(json['location'])
        : null;
    socialProfiles = json['socialProfiles'] != null
        ? new VendorMyProfileDetailsResponseSocialProfiles.fromJson(json['socialProfiles'])
        : null;
    role = json['role'];
    status = json['status'];
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
    notifySettings = json['notifySettings'] != null
        ? new VendorMyProfileDetailsResponseNotifySettings.fromJson(json['notifySettings'])
        : null;
    isKycVerified = json['isKycVerified'];
    id = json['id'];
    createdAt = json['createdAt'];
    isActiveSubscription = json['isActiveSubscription'];
    type = json['type'];
    isPaystackRecipient = json['isPaystackRecipient'];
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
    data['categories'] = this.categories;
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
    return data;
  }
}

class VendorMyProfileDetailsResponseLocation {
  var type;
  List<dynamic>? coordinates;

  VendorMyProfileDetailsResponseLocation({this.type, this.coordinates});

  VendorMyProfileDetailsResponseLocation.fromJson(Map<String, dynamic> json) {
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

class VendorMyProfileDetailsResponseSocialProfiles {
  var instagram;
  var linkedin;
  var website;

  VendorMyProfileDetailsResponseSocialProfiles({this.instagram, this.linkedin, this.website});

  VendorMyProfileDetailsResponseSocialProfiles.fromJson(Map<String, dynamic> json) {
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

class VendorMyProfileDetailsResponseNotifySettings {
  var all;
  var profile;
  var service;
  var bookings;
  var subscription;
  var payment;

  VendorMyProfileDetailsResponseNotifySettings({
    this.all,
    this.profile,
    this.service,
    this.bookings,
    this.subscription,
    this.payment,
  });

  VendorMyProfileDetailsResponseNotifySettings.fromJson(Map<String, dynamic> json) {
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
