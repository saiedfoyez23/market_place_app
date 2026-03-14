class GetAllClientOrderResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllClientOrderResponseMeta? meta;
  List<GetAllClientOrderResponse>? data;

  GetAllClientOrderResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllClientOrderResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllClientOrderResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GetAllClientOrderResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllClientOrderResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllClientOrderResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllClientOrderResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllClientOrderResponseMeta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['totalPage'] = this.totalPage;
    return data;
  }
}

class GetAllClientOrderResponse {
  GetAllClientOrderResponseLocation? location;
  var sId;
  GetAllClientOrderResponseSender? sender;
  GetAllClientOrderResponseSender? receiver;
  var authority;
  var title;
  var type;
  var shortDescription;
  var description;
  var duration;
  var totalAmount;
  var initialAmount;
  var pendingAmount;
  var finalAmount;
  var refundAmount;
  var startDate;
  var endDate;
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

  GetAllClientOrderResponse({
    this.location,
    this.sId,
    this.sender,
    this.receiver,
    this.authority,
    this.title,
    this.type,
    this.shortDescription,
    this.description,
    this.duration,
    this.totalAmount,
    this.initialAmount,
    this.pendingAmount,
    this.finalAmount,
    this.refundAmount,
    this.startDate,
    this.endDate,
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
  });

  GetAllClientOrderResponse.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new GetAllClientOrderResponseLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    sender =
    json['sender'] != null ? new GetAllClientOrderResponseSender.fromJson(json['sender']) : null;
    receiver =
    json['receiver'] != null ? new GetAllClientOrderResponseSender.fromJson(json['receiver']) : null;
    authority = json['authority'];
    title = json['title'];
    type = json['type'];
    shortDescription = json['shortDescription'];
    description = json['description'];
    duration = json['duration'];
    totalAmount = json['totalAmount'];
    initialAmount = json['initialAmount'];
    pendingAmount = json['pendingAmount'];
    finalAmount = json['finalAmount'];
    refundAmount = json['refundAmount'];
    startDate = json['startDate'];
    endDate = json['endDate'];
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
    data['duration'] = this.duration;
    data['totalAmount'] = this.totalAmount;
    data['initialAmount'] = this.initialAmount;
    data['pendingAmount'] = this.pendingAmount;
    data['finalAmount'] = this.finalAmount;
    data['refundAmount'] = this.refundAmount;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
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
    return data;
  }
}

class GetAllClientOrderResponseLocation {
  var type;
  List<dynamic>? coordinates;

  GetAllClientOrderResponseLocation({this.type, this.coordinates});

  GetAllClientOrderResponseLocation.fromJson(Map<String, dynamic> json) {
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

class GetAllClientOrderResponseSender {
  var sId;
  var name;
  var photoUrl;
  var isKycVerified;

  GetAllClientOrderResponseSender({this.sId, this.name, this.photoUrl, this.isKycVerified});

  GetAllClientOrderResponseSender.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    isKycVerified = json['isKycVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photoUrl'] = this.photoUrl;
    data['isKycVerified'] = this.isKycVerified;
    return data;
  }
}
