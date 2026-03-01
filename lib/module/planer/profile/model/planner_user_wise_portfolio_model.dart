class PlannerUserWisePortfolioModel {
  var success;
  var statusCode;
  var message;
  PlannerUserWisePortfolioMeta? meta;
  List<PlannerUserWisePortfolio>? data;

  PlannerUserWisePortfolioModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  PlannerUserWisePortfolioModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new PlannerUserWisePortfolioMeta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <PlannerUserWisePortfolio>[];
      json['data'].forEach((v) {
        data!.add(new PlannerUserWisePortfolio.fromJson(v));
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

class PlannerUserWisePortfolioMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  PlannerUserWisePortfolioMeta({this.page, this.limit, this.total, this.totalPage});

  PlannerUserWisePortfolioMeta.fromJson(Map<String, dynamic> json) {
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

class PlannerUserWisePortfolio {
  var sId;
  var author;
  var url;

  PlannerUserWisePortfolio({this.sId, this.author, this.url});

  PlannerUserWisePortfolio.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    author = json['author'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['author'] = this.author;
    data['url'] = this.url;
    return data;
  }
}
