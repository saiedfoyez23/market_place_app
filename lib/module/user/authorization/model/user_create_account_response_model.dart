class UserCreateAccountResponseModel {
  var success;
  var statusCode;
  var message;
  UserCreateAccountResponse? data;

  UserCreateAccountResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  UserCreateAccountResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new UserCreateAccountResponse.fromJson(json['data']) : null;
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

class UserCreateAccountResponse {
  CreateAccountUser? user;
  CreateAccountOtpToken? otpToken;

  UserCreateAccountResponse({this.user, this.otpToken});

  UserCreateAccountResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new CreateAccountUser.fromJson(json['user']) : null;
    otpToken = json['otpToken'] != null
        ? new CreateAccountOtpToken.fromJson(json['otpToken'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.otpToken != null) {
      data['otpToken'] = this.otpToken!.toJson();
    }
    return data;
  }
}

class CreateAccountUser {
  var sId;
  var id;
  var name;
  var email;
  var status;

  CreateAccountUser({this.sId, this.id, this.name, this.email, this.status});

  CreateAccountUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    return data;
  }
}

class CreateAccountOtpToken {
  var token;

  CreateAccountOtpToken({this.token});

  CreateAccountOtpToken.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
