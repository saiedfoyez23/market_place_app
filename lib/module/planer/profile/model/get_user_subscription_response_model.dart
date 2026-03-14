class GetUserSubscriptionResponseModel {
  var success;
  var statusCode;
  var message;
  GetUserSubscriptionResponse? data;

  GetUserSubscriptionResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  GetUserSubscriptionResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new GetUserSubscriptionResponse.fromJson(json['data']) : null;
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

class GetUserSubscriptionResponse {
  var sId;
  GetUserSubscriptionResponseUser? user;
  GetUserSubscriptionResponsePackage? package;
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
  var createdAt;
  var updatedAt;

  GetUserSubscriptionResponse({
    this.sId,
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
    this.createdAt,
    this.updatedAt,
  });

  GetUserSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new GetUserSubscriptionResponseUser.fromJson(json['user']) : null;
    package =
    json['package'] != null ? new GetUserSubscriptionResponsePackage.fromJson(json['package']) : null;
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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.package != null) {
      data['package'] = this.package!.toJson();
    }
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
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class GetUserSubscriptionResponseUser {
  var sId;
  var name;
  var email;
  var photoUrl;

  GetUserSubscriptionResponseUser({this.sId, this.name, this.email, this.photoUrl});

  GetUserSubscriptionResponseUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    return data;
  }
}

class GetUserSubscriptionResponsePackage {
  var sId;
  var title;
  var type;
  List<String>? audience;
  var billingCycle;
  List<String>? description;
  var price;
  var popularity;
  var planCode;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;

  GetUserSubscriptionResponsePackage({
    this.sId,
    this.title,
    this.type,
    this.audience,
    this.billingCycle,
    this.description,
    this.price,
    this.popularity,
    this.planCode,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetUserSubscriptionResponsePackage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    type = json['type'];
    audience = json['audience'].cast<String>();
    billingCycle = json['billingCycle'];
    description = json['description'].cast<String>();
    price = json['price'];
    popularity = json['popularity'];
    planCode = json['planCode'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['type'] = this.type;
    data['audience'] = this.audience;
    data['billingCycle'] = this.billingCycle;
    data['description'] = this.description;
    data['price'] = this.price;
    data['popularity'] = this.popularity;
    data['planCode'] = this.planCode;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
