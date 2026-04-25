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
  var sId;
  VendorGetServiceDetailsResponseAuthor? author;
  var authority;
  VendorGetServiceDetailsResponseCategory? category;
  var title;
  var subtitle;
  var description;
  List<String>? images;
  List<VendorGetServiceDetailsResponseServiceAreas>? serviceAreas;
  var price;
  var priceType;
  var isFeatured;
  var status;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;
  var isFavorite;

  VendorGetServiceDetailsResponse({
    this.sId,
    this.author,
    this.authority,
    this.category,
    this.title,
    this.subtitle,
    this.description,
    this.images,
    this.serviceAreas,
    this.price,
    this.priceType,
    this.isFeatured,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.isFavorite,
  });

  VendorGetServiceDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    author =
    json['author'] != null ? new VendorGetServiceDetailsResponseAuthor.fromJson(json['author']) : null;
    authority = json['authority'];
    category = json['category'] != null
        ? new VendorGetServiceDetailsResponseCategory.fromJson(json['category'])
        : null;
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    images = json['images'].cast<String>();
    if (json['serviceAreas'] != null) {
      serviceAreas = <VendorGetServiceDetailsResponseServiceAreas>[];
      json['serviceAreas'].forEach((v) {
        serviceAreas!.add(new VendorGetServiceDetailsResponseServiceAreas.fromJson(v));
      });
    }
    price = json['price'];
    priceType = json['priceType'];
    isFeatured = json['isFeatured'];
    status = json['status'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['authority'] = this.authority;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    data['images'] = this.images;
    if (this.serviceAreas != null) {
      data['serviceAreas'] = this.serviceAreas!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['priceType'] = this.priceType;
    data['isFeatured'] = this.isFeatured;
    data['status'] = this.status;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}

class VendorGetServiceDetailsResponseAuthor {
  var sId;
  var name;
  var photoUrl;
  var address;
  var bio;
  List<String>? categories;
  var locationUrl;
  var avgRating;
  var ratingCount;
  var isKycVerified;

  VendorGetServiceDetailsResponseAuthor({
    this.sId,
    this.name,
    this.photoUrl,
    this.address,
    this.bio,
    this.categories,
    this.locationUrl,
    this.avgRating,
    this.ratingCount,
    this.isKycVerified,
  });

  VendorGetServiceDetailsResponseAuthor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    address = json['address'];
    bio = json['bio'];
    categories = json['categories'].cast<String>();
    locationUrl = json['locationUrl'];
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
    isKycVerified = json['isKycVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photoUrl'] = this.photoUrl;
    data['address'] = this.address;
    data['bio'] = this.bio;
    data['categories'] = this.categories;
    data['locationUrl'] = this.locationUrl;
    data['avgRating'] = this.avgRating;
    data['ratingCount'] = this.ratingCount;
    data['isKycVerified'] = this.isKycVerified;
    return data;
  }
}

class VendorGetServiceDetailsResponseCategory {
  var sId;
  var title;

  VendorGetServiceDetailsResponseCategory({this.sId, this.title});

  VendorGetServiceDetailsResponseCategory.fromJson(Map<String, dynamic> json) {
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

class VendorGetServiceDetailsResponseServiceAreas {
  VendorGetServiceDetailsResponseLocation? location;
  var name;
  var locationUrl;
  var sId;

  VendorGetServiceDetailsResponseServiceAreas({this.location, this.name, this.locationUrl, this.sId});

  VendorGetServiceDetailsResponseServiceAreas.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new VendorGetServiceDetailsResponseLocation.fromJson(json['location'])
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

class VendorGetServiceDetailsResponseLocation {
  var type;
  List<dynamic>? coordinates;

  VendorGetServiceDetailsResponseLocation({this.type, this.coordinates});

  VendorGetServiceDetailsResponseLocation.fromJson(Map<String, dynamic> json) {
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
