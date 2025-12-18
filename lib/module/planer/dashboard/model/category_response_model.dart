class CategoryResponseModel {
  var success;
  var statusCode;
  var message;
  CategoryResponseMeta? meta;
  List<CategoryResponseData>? data;

  CategoryResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new CategoryResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <CategoryResponseData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryResponseData.fromJson(v));
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

class CategoryResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  CategoryResponseMeta({this.page, this.limit, this.total, this.totalPage});

  CategoryResponseMeta.fromJson(Map<String, dynamic> json) {
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

class CategoryResponseData {
  var sId;
  var title;
  var logo;
  var listingCount;
  var createdAt;
  var updatedAt;

  CategoryResponseData({
    this.sId,
    this.title,
    this.logo,
    this.listingCount,
    this.createdAt,
    this.updatedAt,
  });

  CategoryResponseData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    logo = json['logo'];
    listingCount = json['listingCount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['logo'] = this.logo;
    data['listingCount'] = this.listingCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
