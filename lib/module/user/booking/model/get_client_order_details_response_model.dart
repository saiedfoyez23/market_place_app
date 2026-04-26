class GetClientOrderDetailsResponseModel {
  var success;
  var statusCode;
  var message;
  GetClientOrderDetailsRespons? data;

  GetClientOrderDetailsResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  GetClientOrderDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new GetClientOrderDetailsRespons.fromJson(json['data']) : null;
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

class GetClientOrderDetailsRespons {
  GetClientOrderDetailsResponsLocation? location;
  var sId;
  GetClientOrderDetailsResponsSender? sender;
  GetClientOrderDetailsResponsReceiver? receiver;
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
  GetClientOrderDetailsResponsInitialPayment? initialPayment;
  var actualEndDate;
  GetClientOrderDetailsResponsInitialPayment? finalPayment;

  GetClientOrderDetailsRespons({
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
    this.initialPayment,
    this.actualEndDate,
    this.finalPayment,
  });

  GetClientOrderDetailsRespons.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new GetClientOrderDetailsResponsLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    sender =
    json['sender'] != null ? new GetClientOrderDetailsResponsSender.fromJson(json['sender']) : null;
    receiver = json['receiver'] != null
        ? new GetClientOrderDetailsResponsReceiver.fromJson(json['receiver'])
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
    initialPayment = json['initialPayment'] != null
        ? new GetClientOrderDetailsResponsInitialPayment.fromJson(json['initialPayment'])
        : null;
    actualEndDate = json['actualEndDate'];
    finalPayment = json['finalPayment'] != null
        ? new GetClientOrderDetailsResponsInitialPayment.fromJson(json['finalPayment'])
        : null;
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
    if (this.initialPayment != null) {
      data['initialPayment'] = this.initialPayment!.toJson();
    }
    data['actualEndDate'] = this.actualEndDate;
    if (this.finalPayment != null) {
      data['finalPayment'] = this.finalPayment!.toJson();
    }
    return data;
  }
}

class GetClientOrderDetailsResponsLocation {
  String? type;
  List<double>? coordinates;

  GetClientOrderDetailsResponsLocation({this.type, this.coordinates});

  GetClientOrderDetailsResponsLocation.fromJson(Map<String, dynamic> json) {
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

class GetClientOrderDetailsResponsSender {
  GetClientOrderDetailsResponsLocation? location;
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

  GetClientOrderDetailsResponsSender({
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

  GetClientOrderDetailsResponsSender.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new GetClientOrderDetailsResponsLocation.fromJson(json['location'])
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

class GetClientOrderDetailsResponsReceiver {
  GetClientOrderDetailsResponsLocation? location;
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

  GetClientOrderDetailsResponsReceiver({
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

  GetClientOrderDetailsResponsReceiver.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new GetClientOrderDetailsResponsLocation.fromJson(json['location'])
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

class GetClientOrderDetailsResponsInitialPayment {
  var amountPaid;
  var paidAt;
  var transactionId;
  var status;

  GetClientOrderDetailsResponsInitialPayment(
      {this.amountPaid, this.paidAt, this.transactionId, this.status});

  GetClientOrderDetailsResponsInitialPayment.fromJson(Map<String, dynamic> json) {
    amountPaid = json['amountPaid'];
    paidAt = json['paidAt'];
    transactionId = json['transactionId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amountPaid'] = this.amountPaid;
    data['paidAt'] = this.paidAt;
    data['transactionId'] = this.transactionId;
    data['status'] = this.status;
    return data;
  }
}
