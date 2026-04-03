class GetAllMessageFileResponseModel {
  var success;
  var statusCode;
  var message;
  List<GetAllMessageFileResponse>? data;

  GetAllMessageFileResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  GetAllMessageFileResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllMessageFileResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllMessageFileResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllMessageFileResponse {
  var url;
  var size;

  GetAllMessageFileResponse({this.url, this.size});

  GetAllMessageFileResponse.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['size'] = this.size;
    return data;
  }
}
