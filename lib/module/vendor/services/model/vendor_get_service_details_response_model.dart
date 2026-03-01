class VendorGetServiceDetailsResponseModel {
  var success;
  var statusCode;
  var message;
  VendorGetServiceDetailsResponse? data;

  VendorGetServiceDetailsResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  VendorGetServiceDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new VendorGetServiceDetailsResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class VendorGetServiceDetailsResponse {
  VendorGetServiceDetailsLocation? location;
  var sId;
  VendorGetServiceDetailsAuthor? author;
  VendorGetServiceDetailsCategory? category;
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
  var iV;

  VendorGetServiceDetailsResponse({
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
    this.iV,
  });

  VendorGetServiceDetailsResponse.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new VendorGetServiceDetailsLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    author =
    json['author'] != null ? new VendorGetServiceDetailsAuthor.fromJson(json['author']) : null;
    category = json['category'] != null
        ? new VendorGetServiceDetailsCategory.fromJson(json['category'])
        : null;
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
    iV = json['__v'];
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
    data['__v'] = this.iV;
    return data;
  }
}

class VendorGetServiceDetailsLocation {
  var type;
  List<double>? coordinates;

  VendorGetServiceDetailsLocation({this.type, this.coordinates});

  VendorGetServiceDetailsLocation.fromJson(Map<String, dynamic> json) {
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

class VendorGetServiceDetailsAuthor {
  var sId;
  var name;
  var photoUrl;
  var address;
  var bio;
  var locationUrl;
  var avgRating;
  var ratingCount;

  VendorGetServiceDetailsAuthor({
    this.sId,
    this.name,
    this.photoUrl,
    this.address,
    this.bio,
    this.locationUrl,
    this.avgRating,
    this.ratingCount,
  });

  VendorGetServiceDetailsAuthor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    address = json['address'];
    bio = json['bio'];
    locationUrl = json['locationUrl'];
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photoUrl'] = this.photoUrl;
    data['address'] = this.address;
    data['bio'] = this.bio;
    data['locationUrl'] = this.locationUrl;
    data['avgRating'] = this.avgRating;
    data['ratingCount'] = this.ratingCount;
    return data;
  }
}

class VendorGetServiceDetailsCategory {
  var sId;
  var title;

  VendorGetServiceDetailsCategory({this.sId, this.title});

  VendorGetServiceDetailsCategory.fromJson(Map<String, dynamic> json) {
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
