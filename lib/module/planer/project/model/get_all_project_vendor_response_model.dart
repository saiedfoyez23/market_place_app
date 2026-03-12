class GetAllProjectVendorResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllProjectVendorResponseMeta? meta;
  List<GetAllProjectVendorResponse>? data;

  GetAllProjectVendorResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllProjectVendorResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllProjectVendorResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GetAllProjectVendorResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllProjectVendorResponse.fromJson(v));
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

class GetAllProjectVendorResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllProjectVendorResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllProjectVendorResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllProjectVendorResponse {
  var sId;
  var project;
  GetAllProjectVendorResponseVendorOrder? vendorOrder;
  GetAllProjectVendorResponseVendor? vendor;
  var assignedBy;
  List<String>? serviceType;
  var agreedAmount;
  var paidAmount;
  var notes;
  var paymentStatus;
  var status;
  var createdAt;
  var updatedAt;

  GetAllProjectVendorResponse({
    this.sId,
    this.project,
    this.vendorOrder,
    this.vendor,
    this.assignedBy,
    this.serviceType,
    this.agreedAmount,
    this.paidAmount,
    this.notes,
    this.paymentStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  GetAllProjectVendorResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    project = json['project'];
    vendorOrder = json['vendorOrder'] != null
        ? new GetAllProjectVendorResponseVendorOrder.fromJson(json['vendorOrder'])
        : null;
    vendor =
    json['vendor'] != null ? new GetAllProjectVendorResponseVendor.fromJson(json['vendor']) : null;
    assignedBy = json['assignedBy'];
    serviceType = json['serviceType'].cast<String>();
    agreedAmount = json['agreedAmount'];
    paidAmount = json['paidAmount'];
    notes = json['notes'];
    paymentStatus = json['paymentStatus'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['project'] = this.project;
    if (this.vendorOrder != null) {
      data['vendorOrder'] = this.vendorOrder!.toJson();
    }
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    data['assignedBy'] = this.assignedBy;
    data['serviceType'] = this.serviceType;
    data['agreedAmount'] = this.agreedAmount;
    data['paidAmount'] = this.paidAmount;
    data['notes'] = this.notes;
    data['paymentStatus'] = this.paymentStatus;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class GetAllProjectVendorResponseVendorOrder {
  var sId;
  var title;
  var shortDescription;
  var address;
  var locationUrl;

  GetAllProjectVendorResponseVendorOrder({
    this.sId,
    this.title,
    this.shortDescription,
    this.address,
    this.locationUrl,
  });

  GetAllProjectVendorResponseVendorOrder.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    shortDescription = json['shortDescription'];
    address = json['address'];
    locationUrl = json['locationUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['shortDescription'] = this.shortDescription;
    data['address'] = this.address;
    data['locationUrl'] = this.locationUrl;
    return data;
  }
}

class GetAllProjectVendorResponseVendor {
  var sId;
  var name;
  var email;
  var photoUrl;
  var contractNumber;
  var address;
  var locationUrl;

  GetAllProjectVendorResponseVendor({
    this.sId,
    this.name,
    this.email,
    this.photoUrl,
    this.contractNumber,
    this.address,
    this.locationUrl,
  });

  GetAllProjectVendorResponseVendor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    contractNumber = json['contractNumber'];
    address = json['address'];
    locationUrl = json['locationUrl'];
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
    return data;
  }
}
