class GetAllMessageResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllMessageResponseMeta? meta;
  List<GetAllMessageResponse>? data;

  GetAllMessageResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllMessageResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllMessageResponseMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GetAllMessageResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllMessageResponse.fromJson(v));
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

class GetAllMessageResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllMessageResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllMessageResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllMessageResponse {
  var sId;
  var text;
  List<String>? imageUrl;
  var seen;
  GetAllMessageResponseSender? sender;
  var createdAt;

  GetAllMessageResponse({
    this.sId,
    this.text,
    this.imageUrl,
    this.seen,
    this.sender,
    this.createdAt,
  });

  GetAllMessageResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    text = json['text'];
    imageUrl = json['imageUrl'].cast<String>();
    seen = json['seen'];
    sender =
    json['sender'] != null ? new GetAllMessageResponseSender.fromJson(json['sender']) : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['text'] = this.text;
    data['imageUrl'] = this.imageUrl;
    data['seen'] = this.seen;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class GetAllMessageResponseSender {
  var sId;
  var name;
  var photoUrl;

  GetAllMessageResponseSender({this.sId, this.name, this.photoUrl});

  GetAllMessageResponseSender.fromJson(Map<String, dynamic> json) {
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
