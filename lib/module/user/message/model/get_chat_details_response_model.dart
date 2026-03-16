class GetChatDetailsResponseModel {
  var success;
  var statusCode;
  var message;
  GetChatDetailsResponse? data;

  GetChatDetailsResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  GetChatDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new GetChatDetailsResponse.fromJson(json['data']) : null;
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

class GetChatDetailsResponse {
  var sId;
  var reference;
  var modelType;
  var name;
  var status;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;
  List<GetChatDetailsResponseParticipants>? participants;

  GetChatDetailsResponse({
    this.sId,
    this.reference,
    this.modelType,
    this.name,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.participants,
  });

  GetChatDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    reference = json['reference'];
    modelType = json['modelType'];
    name = json['name'];
    status = json['status'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['participants'] != null) {
      participants = <GetChatDetailsResponseParticipants>[];
      json['participants'].forEach((v) {
        participants!.add(new GetChatDetailsResponseParticipants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['reference'] = this.reference;
    data['modelType'] = this.modelType;
    data['name'] = this.name;
    data['status'] = this.status;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.participants != null) {
      data['participants'] = this.participants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetChatDetailsResponseParticipants {
  var sId;
  GetChatDetailsResponseUser? user;
  var role;
  var status;

  GetChatDetailsResponseParticipants({this.sId, this.user, this.role, this.status});

  GetChatDetailsResponseParticipants.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new GetChatDetailsResponseUser.fromJson(json['user']) : null;
    role = json['role'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['role'] = this.role;
    data['status'] = this.status;
    return data;
  }
}

class GetChatDetailsResponseUser {
  var sId;
  var name;
  var photoUrl;

  GetChatDetailsResponseUser({this.sId, this.name, this.photoUrl});

  GetChatDetailsResponseUser.fromJson(Map<String, dynamic> json) {
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
