class VerifyOtpAccessTokenResponseModel {
  var success;
  var statusCode;
  var message;
  VerifyOtpAccessTokenResponse? data;

  VerifyOtpAccessTokenResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  VerifyOtpAccessTokenResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new VerifyOtpAccessTokenResponse.fromJson(json['data']) : null;
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

class VerifyOtpAccessTokenResponse {
  var accessToken;

  VerifyOtpAccessTokenResponse({this.accessToken});

  VerifyOtpAccessTokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    return data;
  }
}
