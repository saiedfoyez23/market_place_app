class GetAllPlannerResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllPlannerResponseMeta? meta;
  List<GetAllPlannerResponse>? data;

  GetAllPlannerResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllPlannerResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllPlannerResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GetAllPlannerResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllPlannerResponse.fromJson(v));
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

class GetAllPlannerResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllPlannerResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllPlannerResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllPlannerResponse {
  var sId;
  var name;
  var email;
  var photoUrl;
  var address;
  var role;
  var status;
  var id;
  var createdAt;

  GetAllPlannerResponse({
    this.sId,
    this.name,
    this.email,
    this.photoUrl,
    this.address,
    this.role,
    this.status,
    this.id,
    this.createdAt,
  });

  GetAllPlannerResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    address = json['address'];
    role = json['role'];
    status = json['status'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['address'] = this.address;
    data['role'] = this.role;
    data['status'] = this.status;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
