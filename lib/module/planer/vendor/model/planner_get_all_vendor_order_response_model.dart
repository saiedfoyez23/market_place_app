class PlannerGetAllVendorOrderResponseModel {
  var success;
  var statusCode;
  var message;
  PlannerGetAllVendorOrderResponseMeta? meta;
  List<PlannerGetAllVendorOrderResponse>? data;

  PlannerGetAllVendorOrderResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  PlannerGetAllVendorOrderResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new PlannerGetAllVendorOrderResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <PlannerGetAllVendorOrderResponse>[];
      json['data'].forEach((v) {
        data!.add(new PlannerGetAllVendorOrderResponse.fromJson(v));
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

class PlannerGetAllVendorOrderResponseMeta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  PlannerGetAllVendorOrderResponseMeta({this.page, this.limit, this.total, this.totalPage});

  PlannerGetAllVendorOrderResponseMeta.fromJson(Map<String, dynamic> json) {
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

class PlannerGetAllVendorOrderResponse {
  var sId;
  PlannerGetAllVendorOrderResponseSender? sender;
  PlannerGetAllVendorOrderResponseSender? receiver;
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
  PlannerGetAllVendorOrderResponseLocation? location;
  var status;
  var initialPayCompleted;
  var finalPayCompleted;
  var isFullyPaid;
  var isCompleted;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var isAssigned;

  PlannerGetAllVendorOrderResponse({
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
    this.location,
    this.status,
    this.initialPayCompleted,
    this.finalPayCompleted,
    this.isFullyPaid,
    this.isCompleted,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.isAssigned,
  });

  PlannerGetAllVendorOrderResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sender =
    json['sender'] != null ? new PlannerGetAllVendorOrderResponseSender.fromJson(json['sender']) : null;
    receiver =
    json['receiver'] != null ? new PlannerGetAllVendorOrderResponseSender.fromJson(json['receiver']) : null;
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
    location = json['location'] != null
        ? new PlannerGetAllVendorOrderResponseLocation.fromJson(json['location'])
        : null;
    status = json['status'];
    initialPayCompleted = json['initialPayCompleted'];
    finalPayCompleted = json['finalPayCompleted'];
    isFullyPaid = json['isFullyPaid'];
    isCompleted = json['isCompleted'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isAssigned = json['isAssigned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['status'] = this.status;
    data['initialPayCompleted'] = this.initialPayCompleted;
    data['finalPayCompleted'] = this.finalPayCompleted;
    data['isFullyPaid'] = this.isFullyPaid;
    data['isCompleted'] = this.isCompleted;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isAssigned'] = this.isAssigned;
    return data;
  }
}

class PlannerGetAllVendorOrderResponseSender {
  var sId;
  var name;
  var photoUrl;
  var isKycVerified;

  PlannerGetAllVendorOrderResponseSender({this.sId, this.name, this.photoUrl, this.isKycVerified});

  PlannerGetAllVendorOrderResponseSender.fromJson(Map<String, dynamic> json) {
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

class PlannerGetAllVendorOrderResponseLocation {
  var type;
  List<dynamic>? coordinates;

  PlannerGetAllVendorOrderResponseLocation({this.type, this.coordinates});

  PlannerGetAllVendorOrderResponseLocation.fromJson(Map<String, dynamic> json) {
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
