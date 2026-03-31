class GetAllPaystackResponseModel {
  var success;
  var statusCode;
  var message;
  List<GetAllPaystackResponse>? data;

  GetAllPaystackResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  GetAllPaystackResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllPaystackResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllPaystackResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllPaystackResponse {
  var sId;
  var user;
  var recipientCode;
  var accountName;
  var accountNumber;
  var bankCode;
  var bankName;
  var currency;
  var status;
  var isDefault;
  GetAllPaystackResponseMetadata? metadata;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;

  GetAllPaystackResponse({
    this.sId,
    this.user,
    this.recipientCode,
    this.accountName,
    this.accountNumber,
    this.bankCode,
    this.bankName,
    this.currency,
    this.status,
    this.isDefault,
    this.metadata,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetAllPaystackResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    recipientCode = json['recipientCode'];
    accountName = json['accountName'];
    accountNumber = json['accountNumber'];
    bankCode = json['bankCode'];
    bankName = json['bankName'];
    currency = json['currency'];
    status = json['status'];
    isDefault = json['isDefault'];
    metadata = json['metadata'] != null
        ? new GetAllPaystackResponseMetadata.fromJson(json['metadata'])
        : null;
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['recipientCode'] = this.recipientCode;
    data['accountName'] = this.accountName;
    data['accountNumber'] = this.accountNumber;
    data['bankCode'] = this.bankCode;
    data['bankName'] = this.bankName;
    data['currency'] = this.currency;
    data['status'] = this.status;
    data['isDefault'] = this.isDefault;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class GetAllPaystackResponseMetadata {
  var userId;

  GetAllPaystackResponseMetadata({this.userId});

  GetAllPaystackResponseMetadata.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    return data;
  }
}
