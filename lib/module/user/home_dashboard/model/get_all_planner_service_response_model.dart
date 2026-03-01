class GetAllPlannerServiceResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllPlannerServiceResponseMeta? meta;
  List<GetAllPlannerServiceResponse>? data;

  GetAllPlannerServiceResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllPlannerServiceResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllPlannerServiceResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GetAllPlannerServiceResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllPlannerServiceResponse.fromJson(v));
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

class GetAllPlannerServiceResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllPlannerServiceResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllPlannerServiceResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllPlannerServiceResponse {
  GetAllPlannerServiceResponseLocation? location;
  var isFeatured;
  var sId;
  GetAllPlannerServiceResponseAuthor? author;
  GetAllPlannerServiceResponseCategory? category;
  var title;
  var subtitle;
  List<String>? images;
  var address;
  var locationUrl;
  var status;
  var isFavorite;

  GetAllPlannerServiceResponse({
    this.location,
    this.isFeatured,
    this.sId,
    this.author,
    this.category,
    this.title,
    this.subtitle,
    this.images,
    this.address,
    this.locationUrl,
    this.status,
    this.isFavorite,
  });

  GetAllPlannerServiceResponse.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new GetAllPlannerServiceResponseLocation.fromJson(json['location'])
        : null;
    isFeatured = json['isFeatured'];
    sId = json['_id'];
    author =
    json['author'] != null ? new GetAllPlannerServiceResponseAuthor.fromJson(json['author']) : null;
    category = json['category'] != null
        ? new GetAllPlannerServiceResponseCategory.fromJson(json['category'])
        : null;
    title = json['title'];
    subtitle = json['subtitle'];
    images = json['images'].cast<String>();
    address = json['address'];
    locationUrl = json['locationUrl'];
    status = json['status'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['isFeatured'] = this.isFeatured;
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
    data['status'] = this.status;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}

class GetAllPlannerServiceResponseLocation {
  var type;
  List<dynamic>? coordinates;

  GetAllPlannerServiceResponseLocation({this.type, this.coordinates});

  GetAllPlannerServiceResponseLocation.fromJson(Map<String, dynamic> json) {
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

class GetAllPlannerServiceResponseAuthor {
  var sId;
  var name;
  var email;
  var photoUrl;
  List<String>? categories;
  var role;
  var avgRating;
  var ratingCount;
  var isKycVerified;

  GetAllPlannerServiceResponseAuthor({
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

  GetAllPlannerServiceResponseAuthor.fromJson(Map<String, dynamic> json) {
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

class GetAllPlannerServiceResponseCategory {
  var sId;
  var title;

  GetAllPlannerServiceResponseCategory({this.sId, this.title});

  GetAllPlannerServiceResponseCategory.fromJson(Map<String, dynamic> json) {
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
