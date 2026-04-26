class GetAllVendorServiceResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllVendorServiceResponseMeta? meta;
  List<GetAllVendorServiceResponse>? data;

  GetAllVendorServiceResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllVendorServiceResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllVendorServiceResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GetAllVendorServiceResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllVendorServiceResponse.fromJson(v));
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

class GetAllVendorServiceResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllVendorServiceResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllVendorServiceResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllVendorServiceResponse {
  var sId;
  GetAllVendorServiceResponseAuthor? author;
  GetAllVendorServiceResponseCategory? category;
  var title;
  var subtitle;
  List<String>? images;
  List<GetAllVendorServiceResponseServiceAreas>? serviceAreas;
  var isFeatured;
  var status;
  var isFavorite;
  var address;
  var locationUrl;
  GetAllVendorServiceResponseLocation? location;

  GetAllVendorServiceResponse({
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
    this.address,
    this.locationUrl,
    this.location
  });

  GetAllVendorServiceResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    author =
    json['author'] != null ? new GetAllVendorServiceResponseAuthor.fromJson(json['author']) : null;
    category = json['category'] != null
        ? new GetAllVendorServiceResponseCategory.fromJson(json['category'])
        : null;
    title = json['title'];
    subtitle = json['subtitle'];
    images = json['images'].cast<String>();
    if (json['serviceAreas'] != null) {
      serviceAreas = <GetAllVendorServiceResponseServiceAreas>[];
      json['serviceAreas'].forEach((v) {
        serviceAreas!.add(new GetAllVendorServiceResponseServiceAreas.fromJson(v));
      });
    }
    isFeatured = json['isFeatured'];
    status = json['status'];
    isFavorite = json['isFavorite'];
    address = json['address'];
    locationUrl = json['locationUrl'];
    location = json['location'] != null
        ? new GetAllVendorServiceResponseLocation.fromJson(json['location'])
        : null;
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
    data['address'] = this.address;
    data['locationUrl'] = this.locationUrl;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class GetAllVendorServiceResponseAuthor {
  var sId;
  var name;
  var email;
  var photoUrl;
  List<String>? categories;
  var role;
  var avgRating;
  var ratingCount;
  var isKycVerified;

  GetAllVendorServiceResponseAuthor({
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

  GetAllVendorServiceResponseAuthor.fromJson(Map<String, dynamic> json) {
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

class GetAllVendorServiceResponseCategory {
  var sId;
  var title;

  GetAllVendorServiceResponseCategory({this.sId, this.title});

  GetAllVendorServiceResponseCategory.fromJson(Map<String, dynamic> json) {
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

class GetAllVendorServiceResponseServiceAreas {
  var name;
  var locationUrl;
  GetAllVendorServiceResponseLocation? location;
  var sId;

  GetAllVendorServiceResponseServiceAreas({this.name, this.locationUrl, this.location, this.sId});

  GetAllVendorServiceResponseServiceAreas.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    locationUrl = json['locationUrl'];
    location = json['location'] != null
        ? new GetAllVendorServiceResponseLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['locationUrl'] = this.locationUrl;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class GetAllVendorServiceResponseLocation {
  var type;
  List<dynamic>? coordinates;

  GetAllVendorServiceResponseLocation({this.type, this.coordinates});

  GetAllVendorServiceResponseLocation.fromJson(Map<String, dynamic> json) {
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
