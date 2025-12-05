class UserForgotPasswordResponseModel {
  var success;
  var statusCode;
  var message;
  UserForgotPasswordResponse? data;

  UserForgotPasswordResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  UserForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new UserForgotPasswordResponse.fromJson(json['data']) : null;
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

class UserForgotPasswordResponse {
  var verifyToken;

  UserForgotPasswordResponse({this.verifyToken});

  UserForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    verifyToken = json['verifyToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verifyToken'] = this.verifyToken;
    return data;
  }
}
