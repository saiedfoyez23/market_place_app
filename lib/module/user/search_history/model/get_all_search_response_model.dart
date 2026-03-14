class GetAllSearchResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllSearchResponse? data;

  GetAllSearchResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  GetAllSearchResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new GetAllSearchResponse.fromJson(json['data']) : null;
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

class GetAllSearchResponse {
  List<GetAllSearchResponsePlanner>? planner;
  List<GetAllSearchResponseService>? service;
  List<GetAllSearchResponseCategories>? categories;

  GetAllSearchResponse({this.planner, this.service, this.categories});

  GetAllSearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['planner'] != null) {
      planner = <GetAllSearchResponsePlanner>[];
      json['planner'].forEach((v) {
        planner!.add(new GetAllSearchResponsePlanner.fromJson(v));
      });
    }
    if (json['service'] != null) {
      service = <GetAllSearchResponseService>[];
      json['service'].forEach((v) {
        service!.add(new GetAllSearchResponseService.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <GetAllSearchResponseCategories>[];
      json['categories'].forEach((v) {
        categories!.add(new GetAllSearchResponseCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.planner != null) {
      data['planner'] = this.planner!.map((v) => v.toJson()).toList();
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

class GetAllSearchResponsePlanner {
  String? sId;
  String? name;
  String? photoUrl;

  GetAllSearchResponsePlanner({this.sId, this.name, this.photoUrl});

  GetAllSearchResponsePlanner.fromJson(Map<String, dynamic> json) {
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

class GetAllSearchResponseService {
  String? sId;
  String? title;
  List<String>? images;

  GetAllSearchResponseService({this.sId, this.title, this.images});

  GetAllSearchResponseService.fromJson(Map<String, dynamic> json) {
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

class GetAllSearchResponseCategories {
  String? sId;
  String? title;
  String? logo;

  GetAllSearchResponseCategories({this.sId, this.title, this.logo});

  GetAllSearchResponseCategories.fromJson(Map<String, dynamic> json) {
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
