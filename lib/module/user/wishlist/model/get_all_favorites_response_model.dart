class GetAllFavoritesResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllFavoritesResponseMeta? meta;
  List<GetAllFavoritesResponse>? data;

  GetAllFavoritesResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllFavoritesResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllFavoritesResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GetAllFavoritesResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllFavoritesResponse.fromJson(v));
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

class GetAllFavoritesResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllFavoritesResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllFavoritesResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllFavoritesResponse {
  var sId;
  var user;
  GetAllFavoritesResponseService? service;
  var createdAt;
  var updatedAt;

  GetAllFavoritesResponse({this.sId, this.user, this.service, this.createdAt, this.updatedAt});

  GetAllFavoritesResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    service =
    json['service'] != null ? new GetAllFavoritesResponseService.fromJson(json['service']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class GetAllFavoritesResponseService {
  var sId;
  GetAllFavoritesResponseAuthor? author;
  var title;
  var subtitle;
  List<String>? images;
  var price;
  var priceType;

  GetAllFavoritesResponseService({
    this.sId,
    this.author,
    this.title,
    this.subtitle,
    this.images,
    this.price,
    this.priceType,
  });

  GetAllFavoritesResponseService.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    author =
    json['author'] != null ? new GetAllFavoritesResponseAuthor.fromJson(json['author']) : null;
    title = json['title'];
    subtitle = json['subtitle'];
    images = json['images'].cast<String>();
    price = json['price'];
    priceType = json['priceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['images'] = this.images;
    data['price'] = this.price;
    data['priceType'] = this.priceType;
    return data;
  }
}

class GetAllFavoritesResponseAuthor {
  var sId;
  var name;
  var photoUrl;
  var avgRating;
  var ratingCount;

  GetAllFavoritesResponseAuthor(
      {this.sId, this.name, this.photoUrl, this.avgRating, this.ratingCount});

  GetAllFavoritesResponseAuthor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photoUrl'] = this.photoUrl;
    data['avgRating'] = this.avgRating;
    data['ratingCount'] = this.ratingCount;
    return data;
  }
}
