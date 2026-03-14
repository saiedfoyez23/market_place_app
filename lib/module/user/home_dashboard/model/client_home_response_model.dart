class ClientHomeResponseModel {
  var success;
  var statusCode;
  var message;
  ClientHomeResponse? data;

  ClientHomeResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  ClientHomeResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new ClientHomeResponse.fromJson(json['data']) : null;
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

class ClientHomeResponse {
  List<ClientHomeResponseBanners>? banners;
  List<ClientHomeResponseCategories>? categories;
  List<ClientHomeResponseUpcomingBooking>? upcomingBooking;
  List<ClientHomeResponseRecommendServices>? recommendServices;
  List<ClientHomeResponsePlanerService>? planerService;

  ClientHomeResponse({
    this.banners,
    this.categories,
    this.upcomingBooking,
    this.recommendServices,
    this.planerService,
  });

  ClientHomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <ClientHomeResponseBanners>[];
      json['banners'].forEach((v) {
        banners!.add(new ClientHomeResponseBanners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <ClientHomeResponseCategories>[];
      json['categories'].forEach((v) {
        categories!.add(new ClientHomeResponseCategories.fromJson(v));
      });
    }
    if (json['upcomingBooking'] != null) {
      upcomingBooking = <ClientHomeResponseUpcomingBooking>[];
      json['upcomingBooking'].forEach((v) {
        upcomingBooking!.add(new ClientHomeResponseUpcomingBooking.fromJson(v));
      });
    }
    if (json['recommendServices'] != null) {
      recommendServices = <ClientHomeResponseRecommendServices>[];
      json['recommendServices'].forEach((v) {
        recommendServices!.add(new ClientHomeResponseRecommendServices.fromJson(v));
      });
    }
    if (json['planerService'] != null) {
      planerService = <ClientHomeResponsePlanerService>[];
      json['planerService'].forEach((v) {
        planerService!.add(new ClientHomeResponsePlanerService.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.upcomingBooking != null) {
      data['upcomingBooking'] =
          this.upcomingBooking!.map((v) => v.toJson()).toList();
    }
    if (this.recommendServices != null) {
      data['recommendServices'] =
          this.recommendServices!.map((v) => v.toJson()).toList();
    }
    if (this.planerService != null) {
      data['planerService'] =
          this.planerService!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientHomeResponseBanners {
  var sId;
  var url;

  ClientHomeResponseBanners({this.sId, this.url});

  ClientHomeResponseBanners.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['url'] = this.url;
    return data;
  }
}

class ClientHomeResponseCategories {
  var sId;
  var title;
  var logo;

  ClientHomeResponseCategories({this.sId, this.title, this.logo});

  ClientHomeResponseCategories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['logo'] = this.logo;
    return data;
  }
}

class ClientHomeResponseUpcomingBooking {
  var sId;
  var title;
  var type;
  var startDate;
  var endDate;
  var status;

  ClientHomeResponseUpcomingBooking({
    this.sId,
    this.title,
    this.type,
    this.startDate,
    this.endDate,
    this.status,
  });

  ClientHomeResponseUpcomingBooking.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    type = json['type'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['type'] = this.type;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['status'] = this.status;
    return data;
  }
}

class ClientHomeResponseRecommendServices {
  ClientHomeResponseLocation? location;
  var sId;
  ClientHomeResponseAuthor? author;
  var title;
  var subtitle;
  List<String>? images;
  var address;
  var locationUrl;
  var isFavorite;

  ClientHomeResponseRecommendServices({
    this.location,
    this.sId,
    this.author,
    this.title,
    this.subtitle,
    this.images,
    this.address,
    this.locationUrl,
    this.isFavorite,
  });

  ClientHomeResponseRecommendServices.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new ClientHomeResponseLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    author =
    json['author'] != null ? new ClientHomeResponseAuthor.fromJson(json['author']) : null;
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
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['images'] = this.images;
    data['address'] = this.address;
    data['locationUrl'] = this.locationUrl;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}


class ClientHomeResponsePlanerService {
  ClientHomeResponseLocation? location;
  var sId;
  ClientHomeResponseAuthor? author;
  var title;
  var subtitle;
  List<String>? images;
  var address;
  var locationUrl;
  var isFavorite;

  ClientHomeResponsePlanerService({
    this.location,
    this.sId,
    this.author,
    this.title,
    this.subtitle,
    this.images,
    this.address,
    this.locationUrl,
    this.isFavorite,
  });

  ClientHomeResponsePlanerService.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new ClientHomeResponseLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    author =
    json['author'] != null ? new ClientHomeResponseAuthor.fromJson(json['author']) : null;
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
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['images'] = this.images;
    data['address'] = this.address;
    data['locationUrl'] = this.locationUrl;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}

class ClientHomeResponseLocation {
  var type;
  List<double>? coordinates;

  ClientHomeResponseLocation({this.type, this.coordinates});

  ClientHomeResponseLocation.fromJson(Map<String, dynamic> json) {
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

class ClientHomeResponseAuthor {
  var sId;
  var name;
  var photoUrl;
  List<String>? categories;
  var avgRating;
  var ratingCount;
  var isKycVerified;

  ClientHomeResponseAuthor({
    this.sId,
    this.name,
    this.photoUrl,
    this.categories,
    this.avgRating,
    this.ratingCount,
    this.isKycVerified,
  });

  ClientHomeResponseAuthor.fromJson(Map<String, dynamic> json) {
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
