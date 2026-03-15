class GetAllChatResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllChatResponseMeta? meta;
  List<GetAllChatResponse>? data;

  GetAllChatResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllChatResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllChatResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GetAllChatResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllChatResponse.fromJson(v));
      });
    }
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
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllChatResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllChatResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllChatResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllChatResponse {
  var sId;
  var modelType;
  var reference;
  var status;
  var isDeleted;
  var createdAt;
  var updatedAt;
  List<GetAllChatResponseParticipants>? participants;
  var lastMessage;
  var unreadCount;
  var name;

  GetAllChatResponse({
    this.sId,
    this.modelType,
    this.reference,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.participants,
    this.lastMessage,
    this.unreadCount,
    this.name,
  });

  GetAllChatResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    modelType = json['modelType'];
    reference = json['reference'];
    status = json['status'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['participants'] != null) {
      participants = <GetAllChatResponseParticipants>[];
      json['participants'].forEach((v) {
        participants!.add(new GetAllChatResponseParticipants.fromJson(v));
      });
    }
    lastMessage = json['lastMessage'];
    unreadCount = json['unreadCount'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['modelType'] = this.modelType;
    data['reference'] = this.reference;
    data['status'] = this.status;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.participants != null) {
      data['participants'] = this.participants!.map((v) => v.toJson()).toList();
    }
    data['lastMessage'] = this.lastMessage;
    data['unreadCount'] = this.unreadCount;
    data['name'] = this.name;
    return data;
  }
}

class GetAllChatResponseParticipants {
  var sId;
  GetAllChatResponseUser? user;

  GetAllChatResponseParticipants({this.sId, this.user});

  GetAllChatResponseParticipants.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new GetAllChatResponseUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class GetAllChatResponseUser {
  var sId;
  var name;
  var photoUrl;

  GetAllChatResponseUser({this.sId, this.name, this.photoUrl});

  GetAllChatResponseUser.fromJson(Map<String, dynamic> json) {
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
