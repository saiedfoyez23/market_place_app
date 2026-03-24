class PlannerLeadsResponseModel {
  var success;
  var statusCode;
  var message;
  PlannerLeadsResponseMeta? meta;
  PlannerLeadsResponse? data;

  PlannerLeadsResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  PlannerLeadsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new PlannerLeadsResponseMeta.fromJson(json['meta']) : null;
    data = json['data'] != null ? new PlannerLeadsResponse.fromJson(json['data']) : null;
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

class PlannerLeadsResponseMeta {
  var page;
  var limit;
  var total;
  var totalPages;

  PlannerLeadsResponseMeta({this.page, this.limit, this.total, this.totalPages});

  PlannerLeadsResponseMeta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class PlannerLeadsResponse {
  var newLeads;
  var contracted;
  var qualified;
  var left;
  List<PlannerLeadsResponseLeadList>? leadList;

  PlannerLeadsResponse({
    this.newLeads,
    this.contracted,
    this.qualified,
    this.left,
    this.leadList,
  });

  PlannerLeadsResponse.fromJson(Map<String, dynamic> json) {
    newLeads = json['newLeads'];
    contracted = json['contracted'];
    qualified = json['qualified'];
    left = json['left'];
    if (json['leadList'] != null) {
      leadList = <PlannerLeadsResponseLeadList>[];
      json['leadList'].forEach((v) {
        leadList!.add(new PlannerLeadsResponseLeadList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newLeads'] = this.newLeads;
    data['contracted'] = this.contracted;
    data['qualified'] = this.qualified;
    data['left'] = this.left;
    if (this.leadList != null) {
      data['leadList'] = this.leadList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlannerLeadsResponseLeadList {
  var sId;
  var sender;
  PlannerLeadsResponseReceiver? receiver;
  var title;
  var type;
  var shortDescription;
  var startDate;
  var address;
  var locationUrl;
  PlannerLeadsResponseLocation? location;

  PlannerLeadsResponseLeadList({
    this.sId,
    this.sender,
    this.receiver,
    this.title,
    this.type,
    this.shortDescription,
    this.startDate,
    this.address,
    this.locationUrl,
    this.location,
  });

  PlannerLeadsResponseLeadList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sender = json['sender'];
    receiver = json['receiver'] != null
        ? new PlannerLeadsResponseReceiver.fromJson(json['receiver'])
        : null;
    title = json['title'];
    type = json['type'];
    shortDescription = json['shortDescription'];
    startDate = json['startDate'];
    address = json['address'];
    locationUrl = json['locationUrl'];
    location = json['location'] != null
        ? new PlannerLeadsResponseLocation.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sender'] = this.sender;
    if (this.receiver != null) {
      data['receiver'] = this.receiver!.toJson();
    }
    data['title'] = this.title;
    data['type'] = this.type;
    data['shortDescription'] = this.shortDescription;
    data['startDate'] = this.startDate;
    data['address'] = this.address;
    data['locationUrl'] = this.locationUrl;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class PlannerLeadsResponseReceiver {
  var sId;
  var name;
  var photoUrl;

  PlannerLeadsResponseReceiver({this.sId, this.name, this.photoUrl});

  PlannerLeadsResponseReceiver.fromJson(Map<String, dynamic> json) {
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

class PlannerLeadsResponseLocation {
  var type;
  List<dynamic>? coordinates;

  PlannerLeadsResponseLocation({this.type, this.coordinates});

  PlannerLeadsResponseLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}
