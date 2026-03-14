class VendorAnalysisResponseModel {
  var success;
  var statusCode;
  var message;
  VendorAnalysisResponse? data;

  VendorAnalysisResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  VendorAnalysisResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new VendorAnalysisResponse.fromJson(json['data']) : null;
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

class VendorAnalysisResponse {
  var totalBookingCount;
  var totalEarnings;
  List<VendorAnalysisResponseMonthlyRevenue>? monthlyRevenue;
  List<VendorAnalysisResponseClientSatisfaction>? clientSatisfaction;
  List<VendorAnalysisResponseServicePopularity>? servicePopularity;
  List<VendorAnalysisResponseBookingTrends>? bookingTrends;

  VendorAnalysisResponse({
    this.totalBookingCount,
    this.totalEarnings,
    this.monthlyRevenue,
    this.clientSatisfaction,
    this.servicePopularity,
    this.bookingTrends,
  });

  VendorAnalysisResponse.fromJson(Map<String, dynamic> json) {
    totalBookingCount = json['totalBookingCount'];
    totalEarnings = json['totalEarnings'];
    if (json['monthlyRevenue'] != null) {
      monthlyRevenue = <VendorAnalysisResponseMonthlyRevenue>[];
      json['monthlyRevenue'].forEach((v) {
        monthlyRevenue!.add(new VendorAnalysisResponseMonthlyRevenue.fromJson(v));
      });
    }
    if (json['clientSatisfaction'] != null) {
      clientSatisfaction = <VendorAnalysisResponseClientSatisfaction>[];
      json['clientSatisfaction'].forEach((v) {
        clientSatisfaction!.add(new VendorAnalysisResponseClientSatisfaction.fromJson(v));
      });
    }
    if (json['servicePopularity'] != null) {
      servicePopularity = <VendorAnalysisResponseServicePopularity>[];
      json['servicePopularity'].forEach((v) {
        servicePopularity!.add(new VendorAnalysisResponseServicePopularity.fromJson(v));
      });
    }
    if (json['bookingTrends'] != null) {
      bookingTrends = <VendorAnalysisResponseBookingTrends>[];
      json['bookingTrends'].forEach((v) {
        bookingTrends!.add(new VendorAnalysisResponseBookingTrends.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalBookingCount'] = this.totalBookingCount;
    data['totalEarnings'] = this.totalEarnings;
    if (this.monthlyRevenue != null) {
      data['monthlyRevenue'] =
          this.monthlyRevenue!.map((v) => v.toJson()).toList();
    }
    if (this.clientSatisfaction != null) {
      data['clientSatisfaction'] =
          this.clientSatisfaction!.map((v) => v.toJson()).toList();
    }
    if (this.servicePopularity != null) {
      data['servicePopularity'] =
          this.servicePopularity!.map((v) => v.toJson()).toList();
    }
    if (this.bookingTrends != null) {
      data['bookingTrends'] =
          this.bookingTrends!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VendorAnalysisResponseMonthlyRevenue {
  var month;
  var amount;

  VendorAnalysisResponseMonthlyRevenue({this.month, this.amount});

  VendorAnalysisResponseMonthlyRevenue.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['amount'] = this.amount;
    return data;
  }
}

class VendorAnalysisResponseClientSatisfaction {
  var month;
  var count;

  VendorAnalysisResponseClientSatisfaction({this.month, this.count});

  VendorAnalysisResponseClientSatisfaction.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['count'] = this.count;
    return data;
  }
}

class VendorAnalysisResponseServicePopularity {
  var type;
  var percentage;

  VendorAnalysisResponseServicePopularity({this.type, this.percentage});

  VendorAnalysisResponseServicePopularity.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['percentage'] = this.percentage;
    return data;
  }
}


class VendorAnalysisResponseBookingTrends {
  var month;
  var count;

  VendorAnalysisResponseBookingTrends({this.month, this.count});

  VendorAnalysisResponseBookingTrends.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['count'] = this.count;
    return data;
  }
}

