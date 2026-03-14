class GetAllFileResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllFileResponseMeta? meta;
  List<GetAllFileResponse>? data;

  GetAllFileResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllFileResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllFileResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GetAllFileResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllFileResponse.fromJson(v));
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

class GetAllFileResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllFileResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllFileResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllFileResponse {
  var sId;
  var project;
  var url;
  var fileSize;
  var createdAt;
  var updatedAt;

  GetAllFileResponse({
    this.sId,
    this.project,
    this.url,
    this.fileSize,
    this.createdAt,
    this.updatedAt,
  });

  GetAllFileResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    project = json['project'];
    url = json['url'];
    fileSize = json['fileSize'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['project'] = this.project;
    data['url'] = this.url;
    data['fileSize'] = this.fileSize;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
