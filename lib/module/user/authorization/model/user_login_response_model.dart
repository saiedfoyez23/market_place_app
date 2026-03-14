class UserLoginResponseModel {
  var success;
  var statusCode;
  var message;
  UserLoginResponse? data;

  UserLoginResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  UserLoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new UserLoginResponse.fromJson(json['data']) : null;
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

class UserLoginResponse {
  var accessToken;
  UserResponse? user;

  UserLoginResponse({this.accessToken, this.user});

  UserLoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    user = json['user'] != null ? new UserResponse.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserResponse {
  var sId;
  var name;
  var email;
  var status;
  var isKYCSubmit;
  var kycStatus;

  UserResponse({
    this.sId,
    this.name,
    this.email,
    this.status,
    this.isKYCSubmit,
    this.kycStatus,
  });

  UserResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    isKYCSubmit = json['isKYCSubmit'];
    kycStatus = json['kycStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['isKYCSubmit'] = this.isKYCSubmit;
    data['kycStatus'] = this.kycStatus;
    return data;
  }
}
