class PlannerVendorAnalysisResponseModel {
  var success;
  var statusCode;
  var message;
  PlannerVendorAnalysisResponse? data;

  PlannerVendorAnalysisResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  PlannerVendorAnalysisResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null
        ? PlannerVendorAnalysisResponse.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PlannerVendorAnalysisResponse {
  var eventManaged;
  var activeClient;
  var vendorPartnership;
  var totalEarning;
  PlannerVendorAnalysisResponseReview? review;
  List<PlannerVendorAnalysisResponseVendor>? topVendors;

  PlannerVendorAnalysisResponse({
    this.eventManaged,
    this.activeClient,
    this.vendorPartnership,
    this.totalEarning,
    this.review,
    this.topVendors,
  });

  PlannerVendorAnalysisResponse.fromJson(Map<String, dynamic> json) {
    eventManaged = json['eventManaged'];
    activeClient = json['activeClient'];
    vendorPartnership = json['vendorPartnership'];
    totalEarning = json['totalEarning'];
    review = json['review'] != null
        ? PlannerVendorAnalysisResponseReview.fromJson(json['review'])
        : null;

    if (json['topVendors'] != null) {
      topVendors = <PlannerVendorAnalysisResponseVendor>[];
      json['topVendors'].forEach((v) {
        topVendors!.add(PlannerVendorAnalysisResponseVendor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventManaged'] = eventManaged;
    data['activeClient'] = activeClient;
    data['vendorPartnership'] = vendorPartnership;
    data['totalEarning'] = totalEarning;

    if (review != null) {
      data['review'] = review!.toJson();
    }

    if (topVendors != null) {
      data['topVendors'] = topVendors!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class PlannerVendorAnalysisResponseReview {
  var avgRating;
  var ratingCount;

  PlannerVendorAnalysisResponseReview({
    this.avgRating,
    this.ratingCount,
  });

  PlannerVendorAnalysisResponseReview.fromJson(Map<String, dynamic> json) {
    avgRating = json['avgRating'];
    ratingCount = json['ratingCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avgRating'] = avgRating;
    data['ratingCount'] = ratingCount;
    return data;
  }
}

class PlannerVendorAnalysisResponseVendor {
  var name;
  var orderCount;
  var avgRating;

  PlannerVendorAnalysisResponseVendor({
    this.name,
    this.orderCount,
    this.avgRating,
  });

  PlannerVendorAnalysisResponseVendor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    orderCount = json['orderCount'];
    avgRating = json['avgRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['orderCount'] = orderCount;
    data['avgRating'] = avgRating;
    return data;
  }
}