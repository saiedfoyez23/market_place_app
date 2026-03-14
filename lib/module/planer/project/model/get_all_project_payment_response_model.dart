class GetAllProjectPaymentResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllProjectPaymentResponseMeta? meta;
  GetAllProjectPaymentResponse? data;

  GetAllProjectPaymentResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllProjectPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllProjectPaymentResponseMeta.fromJson(json['meta']) : null;
    data = json['data'] != null ? new GetAllProjectPaymentResponse.fromJson(json['data']) : null;
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
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetAllProjectPaymentResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllProjectPaymentResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllProjectPaymentResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllProjectPaymentResponse {
  var totalReceived;
  var pendingPayment;
  var vendorPayment;
  var totalSaved;
  List<GetAllProjectPaymentResponsePayments>? payments;

  GetAllProjectPaymentResponse({
    this.totalReceived,
    this.pendingPayment,
    this.vendorPayment,
    this.totalSaved,
    this.payments,
  });

  GetAllProjectPaymentResponse.fromJson(Map<String, dynamic> json) {
    totalReceived = json['totalReceived'];
    pendingPayment = json['pendingPayment'];
    vendorPayment = json['vendorPayment'];
    totalSaved = json['totalSaved'];
    if (json['payments'] != null) {
      payments = <GetAllProjectPaymentResponsePayments>[];
      json['payments'].forEach((v) {
        payments!.add(new GetAllProjectPaymentResponsePayments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalReceived'] = this.totalReceived;
    data['pendingPayment'] = this.pendingPayment;
    data['vendorPayment'] = this.vendorPayment;
    data['totalSaved'] = this.totalSaved;
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllProjectPaymentResponsePayments {
  var sId;
  var project;
  GetAllProjectPaymentResponseVendorOrder? vendorOrder;
  GetAllProjectPaymentResponseVendor? vendor;
  var assignedBy;
  List<String>? serviceType;
  var agreedAmount;
  var paidAmount;
  var notes;
  var paymentStatus;
  var status;
  var createdAt;
  var updatedAt;

  GetAllProjectPaymentResponsePayments({
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

  GetAllProjectPaymentResponsePayments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    project = json['project'];
    vendorOrder = json['vendorOrder'] != null
        ? new GetAllProjectPaymentResponseVendorOrder.fromJson(json['vendorOrder'])
        : null;
    vendor =
    json['vendor'] != null ? new GetAllProjectPaymentResponseVendor.fromJson(json['vendor']) : null;
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

class GetAllProjectPaymentResponseVendorOrder {
  var sId;
  var title;

  GetAllProjectPaymentResponseVendorOrder({this.sId, this.title});

  GetAllProjectPaymentResponseVendorOrder.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    return data;
  }
}

class GetAllProjectPaymentResponseVendor {
  var sId;
  var name;
  var email;
  var photoUrl;
  var contractNumber;

  GetAllProjectPaymentResponseVendor({this.sId, this.name, this.email, this.photoUrl, this.contractNumber});

  GetAllProjectPaymentResponseVendor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    contractNumber = json['contractNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['contractNumber'] = this.contractNumber;
    return data;
  }
}
