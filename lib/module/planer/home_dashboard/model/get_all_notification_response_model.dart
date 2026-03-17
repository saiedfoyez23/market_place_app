class GetAllNotificationResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllNotificationResponseMeta? meta;
  List<GetAllNotificationResponse>? data;

  GetAllNotificationResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllNotificationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllNotificationResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GetAllNotificationResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllNotificationResponse.fromJson(v));
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

class GetAllNotificationResponseMeta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  GetAllNotificationResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllNotificationResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllNotificationResponse {
  String? sId;
  String? receiver;
  String? reference;
  String? modelType;
  String? message;
  String? description;
  bool? read;
  bool? isDeleted;
  String? date;
  String? createdAt;
  String? updatedAt;

  GetAllNotificationResponse({
    this.sId,
    this.receiver,
    this.reference,
    this.modelType,
    this.message,
    this.description,
    this.read,
    this.isDeleted,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  GetAllNotificationResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    receiver = json['receiver'];
    reference = json['reference'];
    modelType = json['model_type'];
    message = json['message'];
    description = json['description'];
    read = json['read'];
    isDeleted = json['isDeleted'];
    date = json['date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['receiver'] = this.receiver;
    data['reference'] = this.reference;
    data['model_type'] = this.modelType;
    data['message'] = this.message;
    data['description'] = this.description;
    data['read'] = this.read;
    data['isDeleted'] = this.isDeleted;
    data['date'] = this.date;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
