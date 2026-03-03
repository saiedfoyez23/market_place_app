class UserSearchResponseModel {
  var success;
  var statusCode;
  var message;
  UserSearchResponseMeta? meta;
  UserSearchResponse? data;

  UserSearchResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  UserSearchResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? UserSearchResponseMeta.fromJson(json['meta']) : null;
    data = json['data'] != null ? UserSearchResponse.fromJson(json['data']) : null;
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

class UserSearchResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  UserSearchResponseMeta({this.page, this.limit, this.total, this.totalPage});

  UserSearchResponseMeta.fromJson(Map<String, dynamic> json) {
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

class UserSearchResponse {
  List<UserSearchResponseCategory>? popularCategories;
  List<UserSearchResponseCategory>? trendingCategories;
  List<UserSearchResponseSuggestPlanner>? suggestPlanner;
  List<UserSearchResponseSearchHistory>? searchHistory;

  UserSearchResponse({
    this.popularCategories,
    this.trendingCategories,
    this.suggestPlanner,
    this.searchHistory,
  });

  UserSearchResponse.fromJson(Map<String, dynamic> json) {
    popularCategories = (json['popularCategories'] as List?)
        ?.map((e) => UserSearchResponseCategory.fromJson(e))
        .toList();

    trendingCategories = (json['trendingCategories'] as List?)
        ?.map((e) => UserSearchResponseCategory.fromJson(e))
        .toList();

    suggestPlanner = (json['suggestPlanner'] as List?)
        ?.map((e) => UserSearchResponseSuggestPlanner.fromJson(e))
        .toList();

    searchHistory = (json['searchHistory'] as List?)
        ?.map((e) => UserSearchResponseSearchHistory.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'popularCategories':
      popularCategories?.map((e) => e.toJson()).toList(),
      'trendingCategories':
      trendingCategories?.map((e) => e.toJson()).toList(),
      'suggestPlanner':
      suggestPlanner?.map((e) => e.toJson()).toList(),
      'searchHistory':
      searchHistory?.map((e) => e.toJson()).toList(),
    };
  }
}

class UserSearchResponseCategory {
  var sId;
  var title;

  UserSearchResponseCategory({this.sId, this.title});

  UserSearchResponseCategory.fromJson(Map<String, dynamic> json) {
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

class UserSearchResponseSuggestPlanner {
  var sId;
  var name;

  UserSearchResponseSuggestPlanner({this.sId, this.name});

  UserSearchResponseSuggestPlanner.fromJson(Map<String, dynamic> json) {
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

class UserSearchResponseSearchHistory {
  var sId;
  var modelType;
  UserSearchResponseCategoryRef? category;
  UserSearchResponseServiceRef? service;
  UserSearchResponseUserRef? user;

  UserSearchResponseSearchHistory({this.sId, this.modelType, this.category, this.service, this.user});

  UserSearchResponseSearchHistory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    modelType = json['modelType'];

    if (modelType == "Category") {
      category = json['refId'] != null
          ? UserSearchResponseCategoryRef.fromJson(json['refId'])
          : null;
    } else if (modelType == "Service") {
      service = json['refId'] != null
          ? UserSearchResponseServiceRef.fromJson(json['refId'])
          : null;
    } else if (modelType == "User") {
      user = json['refId'] != null
          ? UserSearchResponseUserRef.fromJson(json['refId'])
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

class UserSearchResponseCategoryRef {
  var sId;
  var title;
  var logo;

  UserSearchResponseCategoryRef({this.sId, this.title, this.logo});

  UserSearchResponseCategoryRef.fromJson(Map<String, dynamic> json) {
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

class UserSearchResponseServiceRef {
  var sId;
  var title;
  List<String>? images;

  UserSearchResponseServiceRef({this.sId, this.title, this.images});

  UserSearchResponseServiceRef.fromJson(Map<String, dynamic> json) {
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

class UserSearchResponseUserRef {
  var sId;
  var name;
  var photoUrl;

  UserSearchResponseUserRef({this.sId, this.name, this.photoUrl});

  UserSearchResponseUserRef.fromJson(Map<String, dynamic> json) {
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