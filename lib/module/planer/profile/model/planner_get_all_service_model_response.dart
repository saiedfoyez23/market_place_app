class PlannerGetAllServiceModelResponse {
  var success;
  var statusCode;
  var message;
  PlannerGetAllServiceModelMeta? meta;
  List<PlannerGetAllServiceModel>? data;

  PlannerGetAllServiceModelResponse(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  PlannerGetAllServiceModelResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new PlannerGetAllServiceModelMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <PlannerGetAllServiceModel>[];
      json['data'].forEach((v) {
        data!.add(new PlannerGetAllServiceModel.fromJson(v));
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

class PlannerGetAllServiceModelMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  PlannerGetAllServiceModelMeta({this.page, this.limit, this.total, this.totalPage});

  PlannerGetAllServiceModelMeta.fromJson(Map<String, dynamic> json) {
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

class PlannerGetAllServiceModel {
  PlannerGetAllServiceModelLocation? location;
  var sId;
  var author;
  var category;
  var title;
  var subtitle;
  var description;
  List<String>? images;
  var address;
  var locationUrl;
  var price;
  var priceType;
  var status;
  var isDeleted;
  var createdAt;
  var updatedAt;

  PlannerGetAllServiceModel({
    this.location,
    this.sId,
    this.author,
    this.category,
    this.title,
    this.subtitle,
    this.description,
    this.images,
    this.address,
    this.locationUrl,
    this.price,
    this.priceType,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  PlannerGetAllServiceModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new PlannerGetAllServiceModelLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    author = json['author'];
    category = json['category'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    images = json['images'].cast<String>();
    address = json['address'];
    locationUrl = json['locationUrl'];
    price = json['price'];
    priceType = json['priceType'];
    status = json['status'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['_id'] = this.sId;
    data['author'] = this.author;
    data['category'] = this.category;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    data['images'] = this.images;
    data['address'] = this.address;
    data['locationUrl'] = this.locationUrl;
    data['price'] = this.price;
    data['priceType'] = this.priceType;
    data['status'] = this.status;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class PlannerGetAllServiceModelLocation {
  var type;
  List<double>? coordinates;

  PlannerGetAllServiceModelLocation({this.type, this.coordinates});

  PlannerGetAllServiceModelLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}
