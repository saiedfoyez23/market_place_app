class GetAllRecommendedServiceResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllRecommendedServiceResponseMeta? meta;
  List<GetAllRecommendedServiceResponse>? data;

  GetAllRecommendedServiceResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllRecommendedServiceResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllRecommendedServiceResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GetAllRecommendedServiceResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllRecommendedServiceResponse.fromJson(v));
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

class GetAllRecommendedServiceResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllRecommendedServiceResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllRecommendedServiceResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllRecommendedServiceResponse {
  GetAllRecommendedServiceResponseLocation? location;
  var sId;
  GetAllRecommendedServiceResponseAuthor? author;
  GetAllRecommendedServiceResponseCategory? category;
  var title;
  var subtitle;
  List<String>? images;
  var address;
  var locationUrl;
  var isFavorite;

  GetAllRecommendedServiceResponse({
    this.location,
    this.sId,
    this.author,
    this.category,
    this.title,
    this.subtitle,
    this.images,
    this.address,
    this.locationUrl,
    this.isFavorite,
  });

  GetAllRecommendedServiceResponse.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new GetAllRecommendedServiceResponseLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    author =
    json['author'] != null ? new GetAllRecommendedServiceResponseAuthor.fromJson(json['author']) : null;
    category = json['category'] != null
        ? new GetAllRecommendedServiceResponseCategory.fromJson(json['category'])
        : null;
    title = json['title'];
    subtitle = json['subtitle'];
    images = json['images'].cast<String>();
    address = json['address'];
    locationUrl = json['locationUrl'];
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
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}

class GetAllRecommendedServiceResponseLocation {
  String? type;
  List<double>? coordinates;

  GetAllRecommendedServiceResponseLocation({this.type, this.coordinates});

  GetAllRecommendedServiceResponseLocation.fromJson(Map<String, dynamic> json) {
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

class GetAllRecommendedServiceResponseAuthor {
  var sId;
  var name;
  var photoUrl;
  List<String>? categories;
  var avgRating;
  var ratingCount;
  var isKycVerified;

  GetAllRecommendedServiceResponseAuthor({
    this.sId,
    this.name,
    this.photoUrl,
    this.categories,
    this.avgRating,
    this.ratingCount,
    this.isKycVerified,
  });

  GetAllRecommendedServiceResponseAuthor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    categories = json['categories'].cast<String>();
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
    isKycVerified = json['isKycVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photoUrl'] = this.photoUrl;
    data['categories'] = this.categories;
    data['avgRating'] = this.avgRating;
    data['ratingCount'] = this.ratingCount;
    data['isKycVerified'] = this.isKycVerified;
    return data;
  }
}

class GetAllRecommendedServiceResponseCategory {
  var sId;
  var title;

  GetAllRecommendedServiceResponseCategory({this.sId, this.title});

  GetAllRecommendedServiceResponseCategory.fromJson(Map<String, dynamic> json) {
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
