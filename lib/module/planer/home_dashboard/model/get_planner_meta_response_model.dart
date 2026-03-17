class GetPlannerMetaResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  GetPlannerMetaResponse? data;

  GetPlannerMetaResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  GetPlannerMetaResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new GetPlannerMetaResponse.fromJson(json['data']) : null;
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

class GetPlannerMetaResponse {
  int? activeProjectCount;
  int? upcomingEventCount;
  int? newLeadCount;
  int? totalEarnings;
  List<GetPlannerMetaResponseUpcomingEvents>? upcomingEvents;
  List<GetPlannerMetaResponseRecentNotification>? recentNotification;

  GetPlannerMetaResponse({
    this.activeProjectCount,
    this.upcomingEventCount,
    this.newLeadCount,
    this.totalEarnings,
    this.upcomingEvents,
    this.recentNotification,
  });

  GetPlannerMetaResponse.fromJson(Map<String, dynamic> json) {
    activeProjectCount = json['activeProjectCount'];
    upcomingEventCount = json['upcomingEventCount'];
    newLeadCount = json['newLeadCount'];
    totalEarnings = json['totalEarnings'];
    if (json['upcomingEvents'] != null) {
      upcomingEvents = <GetPlannerMetaResponseUpcomingEvents>[];
      json['upcomingEvents'].forEach((v) {
        upcomingEvents!.add(new GetPlannerMetaResponseUpcomingEvents.fromJson(v));
      });
    }
    if (json['recentNotification'] != null) {
      recentNotification = <GetPlannerMetaResponseRecentNotification>[];
      json['recentNotification'].forEach((v) {
        recentNotification!.add(new GetPlannerMetaResponseRecentNotification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activeProjectCount'] = this.activeProjectCount;
    data['upcomingEventCount'] = this.upcomingEventCount;
    data['newLeadCount'] = this.newLeadCount;
    data['totalEarnings'] = this.totalEarnings;
    if (this.upcomingEvents != null) {
      data['upcomingEvents'] =
          this.upcomingEvents!.map((v) => v.toJson()).toList();
    }
    if (this.recentNotification != null) {
      data['recentNotification'] =
          this.recentNotification!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetPlannerMetaResponseUpcomingEvents {
  var sId;
  var title;
  var type;
  var startDate;
  var endDate;
  var status;

  GetPlannerMetaResponseUpcomingEvents({
    this.sId,
    this.title,
    this.type,
    this.startDate,
    this.endDate,
    this.status,
  });

  GetPlannerMetaResponseUpcomingEvents.fromJson(Map<String, dynamic> json) {
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

class GetPlannerMetaResponseRecentNotification {
  var sId;
  var message;
  var description;
  var read;
  var createdAt;
  var modelType;

  GetPlannerMetaResponseRecentNotification(
      {this.sId, this.message, this.description, this.read, this.createdAt, this.modelType});

  GetPlannerMetaResponseRecentNotification.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    message = json['message'];
    description = json['description'];
    modelType = json['model_type'];
    read = json['read'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['message'] = this.message;
    data['description'] = this.description;
    data['read'] = this.read;
    data['model_type'] = this.modelType;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
