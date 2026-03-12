class GetAllProjectTaskResponseModel {
  var success;
  var statusCode;
  var message;
  GetAllProjectTaskResponseMeta? meta;
  GetAllProjectTaskResponse? data;

  GetAllProjectTaskResponseModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  GetAllProjectTaskResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? new GetAllProjectTaskResponseMeta.fromJson(json['meta']) : null;
    data = json['data'] != null ? new GetAllProjectTaskResponse.fromJson(json['data']) : null;
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

class GetAllProjectTaskResponseMeta {
  var page;
  var limit;
  var total;
  var totalPage;

  GetAllProjectTaskResponseMeta({this.page, this.limit, this.total, this.totalPage});

  GetAllProjectTaskResponseMeta.fromJson(Map<String, dynamic> json) {
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

class GetAllProjectTaskResponse {
  var incompleteTask;
  var completedTask;
  var progress;
  List<GetAllProjectTaskResponseTaskList>? taskList;

  GetAllProjectTaskResponse({this.incompleteTask, this.completedTask, this.progress, this.taskList});

  GetAllProjectTaskResponse.fromJson(Map<String, dynamic> json) {
    incompleteTask = json['incompleteTask'];
    completedTask = json['completedTask'];
    progress = json['progress'];
    if (json['taskList'] != null) {
      taskList = <GetAllProjectTaskResponseTaskList>[];
      json['taskList'].forEach((v) {
        taskList!.add(new GetAllProjectTaskResponseTaskList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['incompleteTask'] = this.incompleteTask;
    data['completedTask'] = this.completedTask;
    data['progress'] = this.progress;
    if (this.taskList != null) {
      data['taskList'] = this.taskList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllProjectTaskResponseTaskList {
  var sId;
  var project;
  var title;
  var date;
  var isCompleted;
  var createdAt;
  var updatedAt;

  GetAllProjectTaskResponseTaskList({
    this.sId,
    this.project,
    this.title,
    this.date,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  GetAllProjectTaskResponseTaskList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    project = json['project'];
    title = json['title'];
    date = json['date'];
    isCompleted = json['isCompleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['project'] = this.project;
    data['title'] = this.title;
    data['date'] = this.date;
    data['isCompleted'] = this.isCompleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
