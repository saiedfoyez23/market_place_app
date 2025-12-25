class UserFAQResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  UserFAQMeta? meta;
  List<UserFAQResponse>? data;

  UserFAQResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  UserFAQResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new UserFAQMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <UserFAQResponse>[];
      json['data'].forEach((v) {
        data!.add(new UserFAQResponse.fromJson(v));
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

class UserFAQMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  UserFAQMeta({this.page, this.limit, this.total, this.totalPage});

  UserFAQMeta.fromJson(Map<String, dynamic> json) {
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

class UserFAQResponse {
  var sId;
  var audience;
  var question;
  var answer;
  var createdAt;
  var updatedAt;

  UserFAQResponse({
    this.sId,
    this.audience,
    this.question,
    this.answer,
    this.createdAt,
    this.updatedAt,
  });

  UserFAQResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    audience = json['audience'];
    question = json['question'];
    answer = json['answer'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['audience'] = this.audience;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
