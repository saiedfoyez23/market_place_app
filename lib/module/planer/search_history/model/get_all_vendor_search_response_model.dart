class GetAllVendorSearchResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllVendorSearchResponse? data;

  GetAllVendorSearchResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  GetAllVendorSearchResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new GetAllVendorSearchResponse.fromJson(json['data']) : null;
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

class GetAllVendorSearchResponse {
  List<GetAllVendorSearchResponsePlanner>? user;
  List<GetAllVendorSearchResponseService>? service;
  List<GetAllVendorSearchResponseCategories>? categories;

  GetAllVendorSearchResponse({this.user, this.service, this.categories});

  GetAllVendorSearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <GetAllVendorSearchResponsePlanner>[];
      json['user'].forEach((v) {
        user!.add(new GetAllVendorSearchResponsePlanner.fromJson(v));
      });
    }
    if (json['service'] != null) {
      service = <GetAllVendorSearchResponseService>[];
      json['service'].forEach((v) {
        service!.add(new GetAllVendorSearchResponseService.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <GetAllVendorSearchResponseCategories>[];
      json['categories'].forEach((v) {
        categories!.add(new GetAllVendorSearchResponseCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['planner'] = this.user!.map((v) => v.toJson()).toList();
    }
    if (this.service != null) {
      data['service'] = this.service!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllVendorSearchResponsePlanner {
  String? sId;
  String? name;
  String? photoUrl;

  GetAllVendorSearchResponsePlanner({this.sId, this.name, this.photoUrl});

  GetAllVendorSearchResponsePlanner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photoUrl'] = this.photoUrl;
    return data;
  }
}

class GetAllVendorSearchResponseService {
  String? sId;
  String? title;
  List<String>? images;

  GetAllVendorSearchResponseService({this.sId, this.title, this.images});

  GetAllVendorSearchResponseService.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['images'] = this.images;
    return data;
  }
}

class GetAllVendorSearchResponseCategories {
  String? sId;
  String? title;
  String? logo;

  GetAllVendorSearchResponseCategories({this.sId, this.title, this.logo});

  GetAllVendorSearchResponseCategories.fromJson(Map<String, dynamic> json) {
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
