class GetAllProjectVendorQuotesResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllProjectVendorQuotesResponseMeta? meta;
  GetAllProjectVendorQuotesResponse? data;

  GetAllProjectVendorQuotesResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllProjectVendorQuotesResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllProjectVendorQuotesResponseMeta.fromJson(json['meta']) : null;
    data = json['data'] != null ? new GetAllProjectVendorQuotesResponse.fromJson(json['data']) : null;
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

class GetAllProjectVendorQuotesResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllProjectVendorQuotesResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllProjectVendorQuotesResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllProjectVendorQuotesResponse {
  var projectBudget;
  var projectExpense;
  var budgetProgress;
  List<GetAllProjectVendorQuotesResponseVendorList>? vendorList;

  GetAllProjectVendorQuotesResponse({
    this.projectBudget,
    this.projectExpense,
    this.budgetProgress,
    this.vendorList,
  });

  GetAllProjectVendorQuotesResponse.fromJson(Map<String, dynamic> json) {
    projectBudget = json['projectBudget'];
    projectExpense = json['projectExpense'];
    budgetProgress = json['budgetProgress'];
    if (json['vendorList'] != null) {
      vendorList = <GetAllProjectVendorQuotesResponseVendorList>[];
      json['vendorList'].forEach((v) {
        vendorList!.add(new GetAllProjectVendorQuotesResponseVendorList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectBudget'] = this.projectBudget;
    data['projectExpense'] = this.projectExpense;
    data['budgetProgress'] = this.budgetProgress;
    if (this.vendorList != null) {
      data['vendorList'] = this.vendorList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllProjectVendorQuotesResponseVendorList {
  var sId;
  GetAllProjectVendorQuotesResponseVendor? vendor;
  List<String>? serviceType;
  var agreedAmount;
  var createdAt;

  GetAllProjectVendorQuotesResponseVendorList({
    this.sId,
    this.vendor,
    this.serviceType,
    this.agreedAmount,
    this.createdAt,
  });

  GetAllProjectVendorQuotesResponseVendorList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    vendor =
    json['vendor'] != null ? new GetAllProjectVendorQuotesResponseVendor.fromJson(json['vendor']) : null;
    serviceType = json['serviceType'].cast<String>();
    agreedAmount = json['agreedAmount'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    data['serviceType'] = this.serviceType;
    data['agreedAmount'] = this.agreedAmount;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class GetAllProjectVendorQuotesResponseVendor {
  var sId;
  var name;
  var photoUrl;

  GetAllProjectVendorQuotesResponseVendor({this.sId, this.name, this.photoUrl});

  GetAllProjectVendorQuotesResponseVendor.fromJson(Map<String, dynamic> json) {
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
