class VendorGetAllServiceModelResponse {
  var success;
  var statusCode;
  var message;
  VendorGetAllServiceModelMeta? meta;
  List<VendorGetAllServiceModel>? data;

  VendorGetAllServiceModelResponse(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  VendorGetAllServiceModelResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new VendorGetAllServiceModelMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <VendorGetAllServiceModel>[];
      json['data'].forEach((v) {
        data!.add(new VendorGetAllServiceModel.fromJson(v));
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

class VendorGetAllServiceModelMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  VendorGetAllServiceModelMeta({this.page, this.limit, this.total, this.totalPage});

  VendorGetAllServiceModelMeta.fromJson(Map<String, dynamic> json) {
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

class VendorGetAllServiceModel {
  var sId;
  VendorGetAllServiceModelAuthor? author;
  VendorGetAllServiceModelCategory? category;
  var title;
  var subtitle;
  List<String>? images;
  List<VendorGetAllServiceModelServiceAreas>? serviceAreas;
  var isFeatured;
  var status;
  var isFavorite;

  VendorGetAllServiceModel({
    this.sId,
    this.author,
    this.category,
    this.title,
    this.subtitle,
    this.images,
    this.serviceAreas,
    this.isFeatured,
    this.status,
    this.isFavorite,
  });

  VendorGetAllServiceModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    author =
    json['author'] != null ? new VendorGetAllServiceModelAuthor.fromJson(json['author']) : null;
    category = json['category'] != null
        ? new VendorGetAllServiceModelCategory.fromJson(json['category'])
        : null;
    title = json['title'];
    subtitle = json['subtitle'];
    images = json['images'].cast<String>();
    if (json['serviceAreas'] != null) {
      serviceAreas = <VendorGetAllServiceModelServiceAreas>[];
      json['serviceAreas'].forEach((v) {
        serviceAreas!.add(new VendorGetAllServiceModelServiceAreas.fromJson(v));
      });
    }
    isFeatured = json['isFeatured'];
    status = json['status'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.serviceAreas != null) {
      data['serviceAreas'] = this.serviceAreas!.map((v) => v.toJson()).toList();
    }
    data['isFeatured'] = this.isFeatured;
    data['status'] = this.status;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}

class VendorGetAllServiceModelAuthor {
  var sId;
  var name;
  var email;
  var photoUrl;
  List<String>? categories;
  var role;
  var avgRating;
  var ratingCount;
  var isKycVerified;

  VendorGetAllServiceModelAuthor({
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

  VendorGetAllServiceModelAuthor.fromJson(Map<String, dynamic> json) {
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

class VendorGetAllServiceModelCategory {
  var sId;
  var title;

  VendorGetAllServiceModelCategory({this.sId, this.title});

  VendorGetAllServiceModelCategory.fromJson(Map<String, dynamic> json) {
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

class VendorGetAllServiceModelServiceAreas {
  VendorGetAllServiceModelLocation? location;
  var name;
  var locationUrl;
  var sId;

  VendorGetAllServiceModelServiceAreas({this.location, this.name, this.locationUrl, this.sId});

  VendorGetAllServiceModelServiceAreas.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new VendorGetAllServiceModelLocation.fromJson(json['location'])
        : null;
    name = json['name'];
    locationUrl = json['locationUrl'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['name'] = this.name;
    data['locationUrl'] = this.locationUrl;
    data['_id'] = this.sId;
    return data;
  }
}

class VendorGetAllServiceModelLocation {
  var type;
  List<dynamic>? coordinates;

  VendorGetAllServiceModelLocation({this.type, this.coordinates});

  VendorGetAllServiceModelLocation.fromJson(Map<String, dynamic> json) {
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
