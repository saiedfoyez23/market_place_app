class PlannerEventAnalysisResponseModel {
  var success;
  var statusCode;
  var message;
  PlannerEventAnalysisResponse? data;

  PlannerEventAnalysisResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  PlannerEventAnalysisResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null
        ? PlannerEventAnalysisResponse.fromJson(json['data'])
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

class PlannerEventAnalysisResponse {
  var eventManaged;
  var activeClient;
  var vendorPartnership;
  var totalEarning;
  PlannerEventAnalysisResponseReview? review;
  List<PlannerEventAnalysisItem>? eventAnalysis;

  PlannerEventAnalysisResponse({
    this.eventManaged,
    this.activeClient,
    this.vendorPartnership,
    this.totalEarning,
    this.review,
    this.eventAnalysis,
  });

  PlannerEventAnalysisResponse.fromJson(Map<String, dynamic> json) {
    eventManaged = json['eventManaged'];
    activeClient = json['activeClient'];
    vendorPartnership = json['vendorPartnership'];
    totalEarning = json['totalEarning'];
    review = json['review'] != null
        ? PlannerEventAnalysisResponseReview.fromJson(json['review'])
        : null;

    if (json['eventAnalysis'] != null) {
      eventAnalysis = <PlannerEventAnalysisItem>[];
      json['eventAnalysis'].forEach((v) {
        eventAnalysis!.add(PlannerEventAnalysisItem.fromJson(v));
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
    if (eventAnalysis != null) {
      data['eventAnalysis'] = eventAnalysis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlannerEventAnalysisResponseReview {
  var avgRating;
  var ratingCount;

  PlannerEventAnalysisResponseReview({
    this.avgRating,
    this.ratingCount,
  });

  PlannerEventAnalysisResponseReview.fromJson(Map<String, dynamic> json) {
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

class PlannerEventAnalysisItem {
  var type;
  var count;
  var percentage;

  PlannerEventAnalysisItem({
    this.type,
    this.count,
    this.percentage,
  });

  PlannerEventAnalysisItem.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    count = json['count'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['count'] = count;
    data['percentage'] = percentage;
    return data;
  }
}