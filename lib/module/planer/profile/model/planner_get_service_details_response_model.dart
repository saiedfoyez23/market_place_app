class PlannerGetServiceDetailsResponseModel {
  var success;
  var statusCode;
  var message;
  PlannerGetServiceDetailsResponse? data;

  PlannerGetServiceDetailsResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  PlannerGetServiceDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new PlannerGetServiceDetailsResponse.fromJson(json['data']) : null;
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

class PlannerGetServiceDetailsResponse {
  var sId;
  PlannerGetServiceDetailsResponseAuthor? author;
  var authority;
  PlannerGetServiceDetailsResponseCategory? category;
  var title;
  var subtitle;
  var description;
  List<String>? images;
  List<PlannerGetServiceDetailsResponseServiceAreas>? serviceAreas;
  var price;
  var priceType;
  var isFeatured;
  var status;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;
  var isFavorite;

  PlannerGetServiceDetailsResponse({
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

  PlannerGetServiceDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    author =
    json['author'] != null ? new PlannerGetServiceDetailsResponseAuthor.fromJson(json['author']) : null;
    authority = json['authority'];
    category = json['category'] != null
        ? new PlannerGetServiceDetailsResponseCategory.fromJson(json['category'])
        : null;
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    images = json['images'].cast<String>();
    if (json['serviceAreas'] != null) {
      serviceAreas = <PlannerGetServiceDetailsResponseServiceAreas>[];
      json['serviceAreas'].forEach((v) {
        serviceAreas!.add(new PlannerGetServiceDetailsResponseServiceAreas.fromJson(v));
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

class PlannerGetServiceDetailsResponseAuthor {
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

  PlannerGetServiceDetailsResponseAuthor({
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

  PlannerGetServiceDetailsResponseAuthor.fromJson(Map<String, dynamic> json) {
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

class PlannerGetServiceDetailsResponseCategory {
  var sId;
  var title;

  PlannerGetServiceDetailsResponseCategory({this.sId, this.title});

  PlannerGetServiceDetailsResponseCategory.fromJson(Map<String, dynamic> json) {
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

class PlannerGetServiceDetailsResponseServiceAreas {
  PlannerGetServiceDetailsResponseLocation? location;
  var name;
  var locationUrl;
  var sId;

  PlannerGetServiceDetailsResponseServiceAreas({this.location, this.name, this.locationUrl, this.sId});

  PlannerGetServiceDetailsResponseServiceAreas.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new PlannerGetServiceDetailsResponseLocation.fromJson(json['location'])
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

class PlannerGetServiceDetailsResponseLocation {
  var type;
  List<dynamic>? coordinates;

  PlannerGetServiceDetailsResponseLocation({this.type, this.coordinates});

  PlannerGetServiceDetailsResponseLocation.fromJson(Map<String, dynamic> json) {
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
