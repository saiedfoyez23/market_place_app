class GetAllUserReviewResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllUserReviewResponseMeta? meta;
  GetAllUserReviewResponse? data;

  GetAllUserReviewResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllUserReviewResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllUserReviewResponseMeta.fromJson(json['meta']) : null;
    data = json['data'] != null ? new GetAllUserReviewResponse.fromJson(json['data']) : null;
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
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetAllUserReviewResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllUserReviewResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllUserReviewResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllUserReviewResponse {
  GetAllUserReviewResponseRatingBreakdown? ratingBreakdown;
  var avgRating;
  var ratingCount;
  List<GetAllUserReviewResponseReviews>? reviews;

  GetAllUserReviewResponse({this.ratingBreakdown, this.avgRating, this.ratingCount, this.reviews});

  GetAllUserReviewResponse.fromJson(Map<String, dynamic> json) {
    ratingBreakdown = json['ratingBreakdown'] != null
        ? new GetAllUserReviewResponseRatingBreakdown.fromJson(json['ratingBreakdown'])
        : null;
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
    if (json['reviews'] != null) {
      reviews = <GetAllUserReviewResponseReviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new GetAllUserReviewResponseReviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ratingBreakdown != null) {
      data['ratingBreakdown'] = this.ratingBreakdown!.toJson();
    }
    data['avgRating'] = this.avgRating;
    data['ratingCount'] = this.ratingCount;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllUserReviewResponseRatingBreakdown {
  var excellent;
  var veryGood;
  var good;
  var fair;
  var poor;

  GetAllUserReviewResponseRatingBreakdown(
      {this.excellent, this.veryGood, this.good, this.fair, this.poor});

  GetAllUserReviewResponseRatingBreakdown.fromJson(Map<String, dynamic> json) {
    excellent = json['excellent'];
    veryGood = json['veryGood'];
    good = json['good'];
    fair = json['fair'];
    poor = json['poor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['excellent'] = this.excellent;
    data['veryGood'] = this.veryGood;
    data['good'] = this.good;
    data['fair'] = this.fair;
    data['poor'] = this.poor;
    return data;
  }
}

class GetAllUserReviewResponseReviews {
  var sId;
  GetAllUserReviewResponseUser? user;
  var author;
  var review;
  var overallRating;
  var createdAt;

  GetAllUserReviewResponseReviews({
    this.sId,
    this.user,
    this.author,
    this.review,
    this.overallRating,
    this.createdAt,
  });

  GetAllUserReviewResponseReviews.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new GetAllUserReviewResponseUser.fromJson(json['user']) : null;
    author = json['author'];
    review = json['review'];
    overallRating = json['overallRating'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['author'] = this.author;
    data['review'] = this.review;
    data['overallRating'] = this.overallRating;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class GetAllUserReviewResponseUser {
  var sId;
  var name;
  var photoUrl;

  GetAllUserReviewResponseUser({this.sId, this.name, this.photoUrl});

  GetAllUserReviewResponseUser.fromJson(Map<String, dynamic> json) {
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
