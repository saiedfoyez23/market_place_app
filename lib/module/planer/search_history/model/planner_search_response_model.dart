class PlannerSearchResponseModel {
  var success;
  var statusCode;
  var message;
  PlannerSearchResponseMeta? meta;
  PlannerSearchResponse? data;

  PlannerSearchResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  PlannerSearchResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? PlannerSearchResponseMeta.fromJson(json['meta']) : null;
    data = json['data'] != null ? PlannerSearchResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (meta != null) data['meta'] = meta!.toJson();
    if (this.data != null) data['data'] = this.data!.toJson();
    return data;
  }
}

class PlannerSearchResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  PlannerSearchResponseMeta({this.page, this.limit, this.total, this.totalPage});

  PlannerSearchResponseMeta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': limit,
      'total': total,
      'totalPage': totalPage,
    };
  }
}

class PlannerSearchResponse {
  List<PlannerSearchResponseCategory>? popularCategories;
  List<PlannerSearchResponseCategory>? trendingCategories;
  List<PlannerSearchResponseSuggestVendor>? suggestVendor;
  List<PlannerSearchResponseSearchHistory>? searchHistory;

  PlannerSearchResponse({
    this.popularCategories,
    this.trendingCategories,
    this.suggestVendor,
    this.searchHistory,
  });

  PlannerSearchResponse.fromJson(Map<String, dynamic> json) {
    popularCategories = (json['popularCategories'] as List?)
        ?.map((e) => PlannerSearchResponseCategory.fromJson(e))
        .toList();

    trendingCategories = (json['trendingCategories'] as List?)
        ?.map((e) => PlannerSearchResponseCategory.fromJson(e))
        .toList();

    suggestVendor = (json['suggestVendor'] as List?)
        ?.map((e) => PlannerSearchResponseSuggestVendor.fromJson(e))
        .toList();

    searchHistory = (json['searchHistory'] as List?)
        ?.map((e) => PlannerSearchResponseSearchHistory.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'popularCategories':
      popularCategories?.map((e) => e.toJson()).toList(),
      'trendingCategories':
      trendingCategories?.map((e) => e.toJson()).toList(),
      'suggestVendor':
      suggestVendor?.map((e) => e.toJson()).toList(),
      'searchHistory':
      searchHistory?.map((e) => e.toJson()).toList(),
    };
  }
}

class PlannerSearchResponseCategory {
  var sId;
  var title;

  PlannerSearchResponseCategory({this.sId, this.title});

  PlannerSearchResponseCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'title': title,
    };
  }
}

class PlannerSearchResponseSuggestVendor {
  var sId;
  var name;

  PlannerSearchResponseSuggestVendor({this.sId, this.name});

  PlannerSearchResponseSuggestVendor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'name': name,
    };
  }
}

class PlannerSearchResponseSearchHistory {
  var sId;
  var modelType;
  PlannerSearchResponseCategoryRef? category;
  PlannerSearchResponseServiceRef? service;
  PlannerSearchResponseUserRef? user;

  PlannerSearchResponseSearchHistory({this.sId, this.modelType, this.category, this.service, this.user});

  PlannerSearchResponseSearchHistory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    modelType = json['modelType'];

    if (modelType == "Category") {
      category = json['refId'] != null
          ? PlannerSearchResponseCategoryRef.fromJson(json['refId'])
          : null;
    } else if (modelType == "Service") {
      service = json['refId'] != null
          ? PlannerSearchResponseServiceRef.fromJson(json['refId'])
          : null;
    } else if (modelType == "User") {
      user = json['refId'] != null
          ? PlannerSearchResponseUserRef.fromJson(json['refId'])
          : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['modelType'] = modelType;

    if (category != null) data['refId'] = category!.toJson();
    if (service != null) data['refId'] = service!.toJson();
    if (user != null) data['refId'] = user!.toJson();

    return data;
  }
}

class PlannerSearchResponseCategoryRef {
  var sId;
  var title;
  var logo;

  PlannerSearchResponseCategoryRef({this.sId, this.title, this.logo});

  PlannerSearchResponseCategoryRef.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'title': title,
      'logo': logo,
    };
  }
}

class PlannerSearchResponseServiceRef {
  var sId;
  var title;
  List<String>? images;

  PlannerSearchResponseServiceRef({this.sId, this.title, this.images});

  PlannerSearchResponseServiceRef.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    images =
    json['images'] != null ? List<String>.from(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'title': title,
      'images': images,
    };
  }
}

class PlannerSearchResponseUserRef {
  var sId;
  var name;
  var photoUrl;

  PlannerSearchResponseUserRef({this.sId, this.name, this.photoUrl});

  PlannerSearchResponseUserRef.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'name': name,
      'photoUrl': photoUrl,
    };
  }
}