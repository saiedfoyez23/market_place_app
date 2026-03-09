class CreateSubscriptionResponseModel {
  var success;
  var statusCode;
  var message;
  CreateSubscriptionResponse? data;

  CreateSubscriptionResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  CreateSubscriptionResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new CreateSubscriptionResponse.fromJson(json['data']) : null;
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

class CreateSubscriptionResponse {
  var user;
  var package;
  var type;
  var transactionId;
  var amount;
  var paymentStatus;
  var status;
  var autoRenew;
  var subscriptionCode;
  var expiredAt;
  var isExpired;
  var isDeleted;
  var sId;
  var createdAt;
  var updatedAt;
  var iV;

  CreateSubscriptionResponse({
    this.user,
    this.package,
    this.type,
    this.transactionId,
    this.amount,
    this.paymentStatus,
    this.status,
    this.autoRenew,
    this.subscriptionCode,
    this.expiredAt,
    this.isExpired,
    this.isDeleted,
    this.sId,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  CreateSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    package = json['package'];
    type = json['type'];
    transactionId = json['transactionId'];
    amount = json['amount'];
    paymentStatus = json['paymentStatus'];
    status = json['status'];
    autoRenew = json['autoRenew'];
    subscriptionCode = json['subscriptionCode'];
    expiredAt = json['expiredAt'];
    isExpired = json['isExpired'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['package'] = this.package;
    data['type'] = this.type;
    data['transactionId'] = this.transactionId;
    data['amount'] = this.amount;
    data['paymentStatus'] = this.paymentStatus;
    data['status'] = this.status;
    data['autoRenew'] = this.autoRenew;
    data['subscriptionCode'] = this.subscriptionCode;
    data['expiredAt'] = this.expiredAt;
    data['isExpired'] = this.isExpired;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
