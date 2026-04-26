class PlannerAllVendorOrderDetailsResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  PlannerAllVendorOrderDetailsResponse? data;

  PlannerAllVendorOrderDetailsResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  PlannerAllVendorOrderDetailsResponseModel.fromJson(
      Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new PlannerAllVendorOrderDetailsResponse.fromJson(json['data']) : null;
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

class PlannerAllVendorOrderDetailsResponse {
  PlannerAllVendorOrderDetailsResponseLocation? location;
  var sId;
  PlannerAllVendorOrderDetailsResponseSender? sender;
  PlannerAllVendorOrderDetailsResponseReceiver? receiver;
  var authority;
  var title;
  var type;
  var shortDescription;
  var description;
  var date;
  var totalAmount;
  var initialAmount;
  var pendingAmount;
  var finalAmount;
  var refundAmount;
  var startTime;
  var endTime;
  var address;
  var locationUrl;
  var status;
  var initialPayCompleted;
  var finalPayCompleted;
  var isFullyPaid;
  var isCompleted;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;

  PlannerAllVendorOrderDetailsResponse({
    this.location,
    this.sId,
    this.sender,
    this.receiver,
    this.authority,
    this.title,
    this.type,
    this.shortDescription,
    this.description,
    this.date,
    this.totalAmount,
    this.initialAmount,
    this.pendingAmount,
    this.finalAmount,
    this.refundAmount,
    this.startTime,
    this.endTime,
    this.address,
    this.locationUrl,
    this.status,
    this.initialPayCompleted,
    this.finalPayCompleted,
    this.isFullyPaid,
    this.isCompleted,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  PlannerAllVendorOrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new PlannerAllVendorOrderDetailsResponseLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    sender =
    json['sender'] != null ? new PlannerAllVendorOrderDetailsResponseSender.fromJson(json['sender']) : null;
    receiver = json['receiver'] != null
        ? new PlannerAllVendorOrderDetailsResponseReceiver.fromJson(json['receiver'])
        : null;
    authority = json['authority'];
    title = json['title'];
    type = json['type'];
    shortDescription = json['shortDescription'];
    description = json['description'];
    date = json['date'];
    totalAmount = json['totalAmount'];
    initialAmount = json['initialAmount'];
    pendingAmount = json['pendingAmount'];
    finalAmount = json['finalAmount'];
    refundAmount = json['refundAmount'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    address = json['address'];
    locationUrl = json['locationUrl'];
    status = json['status'];
    initialPayCompleted = json['initialPayCompleted'];
    finalPayCompleted = json['finalPayCompleted'];
    isFullyPaid = json['isFullyPaid'];
    isCompleted = json['isCompleted'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['_id'] = this.sId;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver!.toJson();
    }
    data['authority'] = this.authority;
    data['title'] = this.title;
    data['type'] = this.type;
    data['shortDescription'] = this.shortDescription;
    data['description'] = this.description;
    data['date'] = this.date;
    data['totalAmount'] = this.totalAmount;
    data['initialAmount'] = this.initialAmount;
    data['pendingAmount'] = this.pendingAmount;
    data['finalAmount'] = this.finalAmount;
    data['refundAmount'] = this.refundAmount;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['address'] = this.address;
    data['locationUrl'] = this.locationUrl;
    data['status'] = this.status;
    data['initialPayCompleted'] = this.initialPayCompleted;
    data['finalPayCompleted'] = this.finalPayCompleted;
    data['isFullyPaid'] = this.isFullyPaid;
    data['isCompleted'] = this.isCompleted;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class PlannerAllVendorOrderDetailsResponseLocation {
  var type;
  List<dynamic>? coordinates;

  PlannerAllVendorOrderDetailsResponseLocation({this.type, this.coordinates});

  PlannerAllVendorOrderDetailsResponseLocation.fromJson(Map<String, dynamic> json) {
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

class PlannerAllVendorOrderDetailsResponseSender {
  PlannerAllVendorOrderDetailsResponseLocation? location;
  var sId;
  var name;
  var email;
  var photoUrl;
  var contractNumber;
  var address;
  List<String>? categories;
  var locationUrl;
  var avgRating;
  var ratingCount;
  var isKycVerified;

  PlannerAllVendorOrderDetailsResponseSender({
    this.location,
    this.sId,
    this.name,
    this.email,
    this.photoUrl,
    this.contractNumber,
    this.address,
    this.categories,
    this.locationUrl,
    this.avgRating,
    this.ratingCount,
    this.isKycVerified,
  });

  PlannerAllVendorOrderDetailsResponseSender.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new PlannerAllVendorOrderDetailsResponseLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    contractNumber = json['contractNumber'];
    address = json['address'];
    categories = json['categories'].cast<String>();
    locationUrl = json['locationUrl'];
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
    isKycVerified = json['isKycVerified'];
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
    data['contractNumber'] = this.contractNumber;
    data['address'] = this.address;
    data['categories'] = this.categories;
    data['locationUrl'] = this.locationUrl;
    data['avgRating'] = this.avgRating;
    data['ratingCount'] = this.ratingCount;
    data['isKycVerified'] = this.isKycVerified;
    return data;
  }
}

class PlannerAllVendorOrderDetailsResponseReceiver {
  PlannerAllVendorOrderDetailsResponseLocation? location;
  var sId;
  var name;
  var email;
  var photoUrl;
  var contractNumber;
  var address;
  List<String>? categories;
  var locationUrl;
  var avgRating;
  var ratingCount;
  var isKycVerified;

  PlannerAllVendorOrderDetailsResponseReceiver({
    this.location,
    this.sId,
    this.name,
    this.email,
    this.photoUrl,
    this.contractNumber,
    this.address,
    this.categories,
    this.locationUrl,
    this.avgRating,
    this.ratingCount,
    this.isKycVerified,
  });

  PlannerAllVendorOrderDetailsResponseReceiver.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new PlannerAllVendorOrderDetailsResponseLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    contractNumber = json['contractNumber'];
    address = json['address'];
    categories = json['categories'].cast<String>();
    locationUrl = json['locationUrl'];
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
    isKycVerified = json['isKycVerified'];
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
    data['contractNumber'] = this.contractNumber;
    data['address'] = this.address;
    data['categories'] = this.categories;
    data['locationUrl'] = this.locationUrl;
    data['avgRating'] = this.avgRating;
    data['ratingCount'] = this.ratingCount;
    data['isKycVerified'] = this.isKycVerified;
    return data;
  }
}
