class GetAllWithdrawResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllWithdrawResponseMeta? meta;
  GetAllWithdrawResponse? data;

  GetAllWithdrawResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllWithdrawResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllWithdrawResponseMeta.fromJson(json['meta']) : null;
    data = json['data'] != null ? new GetAllWithdrawResponse.fromJson(json['data']) : null;
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

class GetAllWithdrawResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllWithdrawResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllWithdrawResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllWithdrawResponse {
  var totalWithdraw;
  List<GetAllWithdrawResponseWithdrawList>? withdrawList;

  GetAllWithdrawResponse({this.totalWithdraw, this.withdrawList});

  GetAllWithdrawResponse.fromJson(Map<String, dynamic> json) {
    totalWithdraw = json['totalWithdraw'];
    if (json['withdrawList'] != null) {
      withdrawList = <GetAllWithdrawResponseWithdrawList>[];
      json['withdrawList'].forEach((v) {
        withdrawList!.add(new GetAllWithdrawResponseWithdrawList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalWithdraw'] = this.totalWithdraw;
    if (this.withdrawList != null) {
      data['withdrawList'] = this.withdrawList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllWithdrawResponseWithdrawList {
  var sId;
  GetAllWithdrawResponseUser? user;
  GetAllWithdrawResponseOrder? order;
  var reference;
  var authority;
  var method;
  var amount;
  var paystackTransferId;
  var recipientCode;
  var proceedAt;
  var status;
  var createdAt;
  var updatedAt;

  GetAllWithdrawResponseWithdrawList({
    this.sId,
    this.user,
    this.order,
    this.reference,
    this.authority,
    this.method,
    this.amount,
    this.paystackTransferId,
    this.recipientCode,
    this.proceedAt,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  GetAllWithdrawResponseWithdrawList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new GetAllWithdrawResponseUser.fromJson(json['user']) : null;
    order = json['order'] != null ? new GetAllWithdrawResponseOrder.fromJson(json['order']) : null;
    reference = json['reference'];
    authority = json['authority'];
    method = json['method'];
    amount = json['amount'];
    paystackTransferId = json['paystackTransferId'];
    recipientCode = json['recipientCode'];
    proceedAt = json['proceedAt'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    data['reference'] = this.reference;
    data['authority'] = this.authority;
    data['method'] = this.method;
    data['amount'] = this.amount;
    data['paystackTransferId'] = this.paystackTransferId;
    data['recipientCode'] = this.recipientCode;
    data['proceedAt'] = this.proceedAt;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class GetAllWithdrawResponseUser {
  var sId;
  var name;
  var email;
  var photoUrl;

  GetAllWithdrawResponseUser({this.sId, this.name, this.email, this.photoUrl});

  GetAllWithdrawResponseUser.fromJson(Map<String, dynamic> json) {
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

class GetAllWithdrawResponseOrder {
  var sId;
  var title;

  GetAllWithdrawResponseOrder({this.sId, this.title});

  GetAllWithdrawResponseOrder.fromJson(Map<String, dynamic> json) {
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
