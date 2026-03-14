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
  PlannerGetAllServiceModelAuthor? author;
  PlannerGetAllServiceModelCategory? category;
  var title;
  var subtitle;
  List<String>? images;
  var address;
  var locationUrl;
  var isFeatured;
  var status;
  var isFavorite;

  PlannerGetAllServiceModel({
    this.location,
    this.sId,
    this.author,
    this.category,
    this.title,
    this.subtitle,
    this.images,
    this.address,
    this.locationUrl,
    this.isFeatured,
    this.status,
    this.isFavorite,
  });

  PlannerGetAllServiceModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new PlannerGetAllServiceModelLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    author =
    json['author'] != null ? new PlannerGetAllServiceModelAuthor.fromJson(json['author']) : null;
    category = json['category'] != null
        ? new PlannerGetAllServiceModelCategory.fromJson(json['category'])
        : null;
    title = json['title'];
    subtitle = json['subtitle'];
    images = json['images'].cast<String>();
    address = json['address'];
    locationUrl = json['locationUrl'];
    isFeatured = json['isFeatured'];
    status = json['status'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['_id'] = this.sId;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['images'] = this.images;
    data['address'] = this.address;
    data['locationUrl'] = this.locationUrl;
    data['isFeatured'] = this.isFeatured;
    data['status'] = this.status;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}

class PlannerGetAllServiceModelLocation {
  var type;
  List<dynamic>? coordinates;

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

class PlannerGetAllServiceModelAuthor {
  var sId;
  var name;
  var email;
  var photoUrl;
  List<String>? categories;
  var role;
  var avgRating;
  var ratingCount;
  var isKycVerified;

  PlannerGetAllServiceModelAuthor({
    this.sId,
    this.name,
    this.email,
    this.photoUrl,
    this.categories,
    this.role,
    this.avgRating,
    this.ratingCount,
    this.isKycVerified,
  });

  PlannerGetAllServiceModelAuthor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    categories = json['categories'].cast<String>();
    role = json['role'];
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
    isKycVerified = json['isKycVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['categories'] = this.categories;
    data['role'] = this.role;
    data['avgRating'] = this.avgRating;
    data['ratingCount'] = this.ratingCount;
    data['isKycVerified'] = this.isKycVerified;
    return data;
  }
}

class PlannerGetAllServiceModelCategory {
  var sId;
  var title;

  PlannerGetAllServiceModelCategory({this.sId, this.title});

  PlannerGetAllServiceModelCategory.fromJson(Map<String, dynamic> json) {
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
