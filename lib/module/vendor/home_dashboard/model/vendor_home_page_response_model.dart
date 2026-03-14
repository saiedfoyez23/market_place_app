class VendorHomePageResponseModel {
  var success;
  var statusCode;
  var message;
  VendorHomePageResponse? data;

  VendorHomePageResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  VendorHomePageResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new VendorHomePageResponse.fromJson(json['data']) : null;
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

class VendorHomePageResponse {
  var activeBookingCount;
  var totalBookingCount;
  var monthlyRevenue;
  var totalEarnings;
  List<VendorHomePageResponseUpcomingBooking>? upcomingBooking;
  List<VendorHomePageResponseTopPartnerships>? topPartnerships;

  VendorHomePageResponse({
    this.activeBookingCount,
    this.totalBookingCount,
    this.monthlyRevenue,
    this.totalEarnings,
    this.upcomingBooking,
    this.topPartnerships,
  });

  VendorHomePageResponse.fromJson(Map<String, dynamic> json) {
    activeBookingCount = json['activeBookingCount'];
    totalBookingCount = json['totalBookingCount'];
    monthlyRevenue = json['monthlyRevenue'];
    totalEarnings = json['totalEarnings'];
    if (json['upcomingBooking'] != null) {
      upcomingBooking = <VendorHomePageResponseUpcomingBooking>[];
      json['upcomingBooking'].forEach((v) {
        upcomingBooking!.add(new VendorHomePageResponseUpcomingBooking.fromJson(v));
      });
    }
    if (json['topPartnerships'] != null) {
      topPartnerships = <VendorHomePageResponseTopPartnerships>[];
      json['topPartnerships'].forEach((v) {
        topPartnerships!.add(new VendorHomePageResponseTopPartnerships.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activeBookingCount'] = this.activeBookingCount;
    data['totalBookingCount'] = this.totalBookingCount;
    data['monthlyRevenue'] = this.monthlyRevenue;
    data['totalEarnings'] = this.totalEarnings;
    if (this.upcomingBooking != null) {
      data['upcomingBooking'] =
          this.upcomingBooking!.map((v) => v.toJson()).toList();
    }
    if (this.topPartnerships != null) {
      data['topPartnerships'] =
          this.topPartnerships!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VendorHomePageResponseUpcomingBooking {
  var sId;
  var title;
  var type;
  var startDate;
  var endDate;
  var status;

  VendorHomePageResponseUpcomingBooking({
    this.sId,
    this.title,
    this.type,
    this.startDate,
    this.endDate,
    this.status,
  });

  VendorHomePageResponseUpcomingBooking.fromJson(Map<String, dynamic> json) {
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

class VendorHomePageResponseTopPartnerships {
  var orderCount;
  var plannerName;
  var plannerEmail;
  var plannerPhoto;
  var rating;

  VendorHomePageResponseTopPartnerships({
    this.orderCount,
    this.plannerName,
    this.plannerEmail,
    this.plannerPhoto,
    this.rating,
  });

  VendorHomePageResponseTopPartnerships.fromJson(Map<String, dynamic> json) {
    orderCount = json['orderCount'];
    plannerName = json['plannerName'];
    plannerEmail = json['plannerEmail'];
    plannerPhoto = json['plannerPhoto'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderCount'] = this.orderCount;
    data['plannerName'] = this.plannerName;
    data['plannerEmail'] = this.plannerEmail;
    data['plannerPhoto'] = this.plannerPhoto;
    data['rating'] = this.rating;
    return data;
  }
}
