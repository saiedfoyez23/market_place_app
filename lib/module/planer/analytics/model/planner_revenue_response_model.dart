class PlannerRevenueResponseModel {
  var success;
  var statusCode;
  var message;
  PlannerRevenueResponse? data;

  PlannerRevenueResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  PlannerRevenueResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null
        ? PlannerRevenueResponse.fromJson(json['data'])
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

class PlannerRevenueResponse {
  var eventManaged;
  var activeClient;
  var vendorPartnership;
  var totalEarning;
  PlannerRevenueResponseReview? review;
  List<PlannerRevenueResponseEventManagedOverview>? eventManagedOverview;
  List<PlannerRevenueResponseVendorCategoryOverview>? vendorCategoryOverview;
  List<PlannerRevenueResponseRevenueGrowthOverview>? revenueGrowthOverview;

  PlannerRevenueResponse({
    this.eventManaged,
    this.activeClient,
    this.vendorPartnership,
    this.totalEarning,
    this.review,
    this.eventManagedOverview,
    this.vendorCategoryOverview,
    this.revenueGrowthOverview,
  });

  PlannerRevenueResponse.fromJson(Map<String, dynamic> json) {
    eventManaged = json['eventManaged'];
    activeClient = json['activeClient'];
    vendorPartnership = json['vendorPartnership'];
    totalEarning = json['totalEarning'];
    review = json['review'] != null
        ? PlannerRevenueResponseReview.fromJson(json['review'])
        : null;

    if (json['eventManagedOverview'] != null) {
      eventManagedOverview = <PlannerRevenueResponseEventManagedOverview>[];
      json['eventManagedOverview'].forEach((v) {
        eventManagedOverview!
            .add(PlannerRevenueResponseEventManagedOverview.fromJson(v));
      });
    }

    if (json['vendorCategoryOverview'] != null) {
      vendorCategoryOverview = <PlannerRevenueResponseVendorCategoryOverview>[];
      json['vendorCategoryOverview'].forEach((v) {
        vendorCategoryOverview!
            .add(PlannerRevenueResponseVendorCategoryOverview.fromJson(v));
      });
    }

    if (json['revenueGrowthOverview'] != null) {
      revenueGrowthOverview = <PlannerRevenueResponseRevenueGrowthOverview>[];
      json['revenueGrowthOverview'].forEach((v) {
        revenueGrowthOverview!
            .add(PlannerRevenueResponseRevenueGrowthOverview.fromJson(v));
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

    if (eventManagedOverview != null) {
      data['eventManagedOverview'] =
          eventManagedOverview!.map((v) => v.toJson()).toList();
    }

    if (vendorCategoryOverview != null) {
      data['vendorCategoryOverview'] =
          vendorCategoryOverview!.map((v) => v.toJson()).toList();
    }

    if (revenueGrowthOverview != null) {
      data['revenueGrowthOverview'] =
          revenueGrowthOverview!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class PlannerRevenueResponseReview {
  var avgRating;
  var ratingCount;

  PlannerRevenueResponseReview({
    this.avgRating,
    this.ratingCount,
  });

  PlannerRevenueResponseReview.fromJson(Map<String, dynamic> json) {
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

class PlannerRevenueResponseEventManagedOverview {
  var month;
  var count;

  PlannerRevenueResponseEventManagedOverview({
    this.month,
    this.count,
  });

  PlannerRevenueResponseEventManagedOverview.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['count'] = count;
    return data;
  }
}

class PlannerRevenueResponseVendorCategoryOverview {
  var type;
  var percentage;

  PlannerRevenueResponseVendorCategoryOverview({
    this.type,
    this.percentage,
  });

  PlannerRevenueResponseVendorCategoryOverview.fromJson(
      Map<String, dynamic> json) {
    type = json['type'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['percentage'] = percentage;
    return data;
  }
}

class PlannerRevenueResponseRevenueGrowthOverview {
  var month;
  var amount;

  PlannerRevenueResponseRevenueGrowthOverview({
    this.month,
    this.amount,
  });

  PlannerRevenueResponseRevenueGrowthOverview.fromJson(
      Map<String, dynamic> json) {
    month = json['month'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['amount'] = amount;
    return data;
  }
}