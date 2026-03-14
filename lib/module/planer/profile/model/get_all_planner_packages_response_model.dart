class GetAllPlannerPackagesResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllPlannerPackagesResponseMeta? meta;
  List<GetAllPlannerPackagesResponse>? data;

  GetAllPlannerPackagesResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllPlannerPackagesResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllPlannerPackagesResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GetAllPlannerPackagesResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllPlannerPackagesResponse.fromJson(v));
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

class GetAllPlannerPackagesResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllPlannerPackagesResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllPlannerPackagesResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllPlannerPackagesResponse {
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

  GetAllPlannerPackagesResponse({
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
  });

  GetAllPlannerPackagesResponse.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
