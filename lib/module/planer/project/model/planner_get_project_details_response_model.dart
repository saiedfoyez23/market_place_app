class PlannerGetProjectDetailsResponseModel {
  var success;
  var statusCode;
  var message;
  PlannerGetProjectDetailsResponse? data;

  PlannerGetProjectDetailsResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  PlannerGetProjectDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new PlannerGetProjectDetailsResponse.fromJson(json['data']) : null;
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

class PlannerGetProjectDetailsResponse {
  var sId;
  var author;
  PlannerGetProjectDetailsResponseClient? client;
  PlannerGetProjectDetailsResponseOrder? order;
  var budget;
  var expense;
  var received;
  var status;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;
  var totalVendor;
  var budgetProgress;
  var taskProgress;

  PlannerGetProjectDetailsResponse({
    this.sId,
    this.author,
    this.client,
    this.order,
    this.budget,
    this.expense,
    this.received,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.totalVendor,
    this.budgetProgress,
    this.taskProgress,
  });

  PlannerGetProjectDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    author = json['author'];
    client =
    json['client'] != null ? new PlannerGetProjectDetailsResponseClient.fromJson(json['client']) : null;
    order = json['order'] != null ? new PlannerGetProjectDetailsResponseOrder.fromJson(json['order']) : null;
    budget = json['budget'];
    expense = json['expense'];
    received = json['received'];
    status = json['status'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalVendor = json['totalVendor'];
    budgetProgress = json['budgetProgress'];
    taskProgress = json['taskProgress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['author'] = this.author;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    data['budget'] = this.budget;
    data['expense'] = this.expense;
    data['received'] = this.received;
    data['status'] = this.status;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['totalVendor'] = this.totalVendor;
    data['budgetProgress'] = this.budgetProgress;
    data['taskProgress'] = this.taskProgress;
    return data;
  }
}

class PlannerGetProjectDetailsResponseClient {
  var sId;
  var name;
  var email;
  var photoUrl;
  var contractNumber;
  var address;
  var locationUrl;

  PlannerGetProjectDetailsResponseClient({
    this.sId,
    this.name,
    this.email,
    this.photoUrl,
    this.contractNumber,
    this.address,
    this.locationUrl,
  });

  PlannerGetProjectDetailsResponseClient.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    contractNumber = json['contractNumber'];
    address = json['address'];
    locationUrl = json['locationUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['contractNumber'] = this.contractNumber;
    data['address'] = this.address;
    data['locationUrl'] = this.locationUrl;
    return data;
  }
}

class PlannerGetProjectDetailsResponseOrder {
  var sId;
  var sender;
  var receiver;
  var authority;
  var title;
  var type;
  var shortDescription;
  var description;
  var duration;
  var totalAmount;
  var initialAmount;
  var pendingAmount;
  var finalAmount;
  var refundAmount;
  var startDate;
  var endDate;
  var address;
  var locationUrl;
  PlannerGetProjectDetailsResponseLocation? location;
  var status;
  var initialPayCompleted;
  var finalPayCompleted;
  var isFullyPaid;
  var isCompleted;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;
  PlannerGetProjectDetailsResponseInitialPayment? initialPayment;
  var actualEndDate;
  PlannerGetProjectDetailsResponseInitialPayment? finalPayment;

  PlannerGetProjectDetailsResponseOrder({
    this.sId,
    this.sender,
    this.receiver,
    this.authority,
    this.title,
    this.type,
    this.shortDescription,
    this.description,
    this.duration,
    this.totalAmount,
    this.initialAmount,
    this.pendingAmount,
    this.finalAmount,
    this.refundAmount,
    this.startDate,
    this.endDate,
    this.address,
    this.locationUrl,
    this.location,
    this.status,
    this.initialPayCompleted,
    this.finalPayCompleted,
    this.isFullyPaid,
    this.isCompleted,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.initialPayment,
    this.actualEndDate,
    this.finalPayment,
  });

  PlannerGetProjectDetailsResponseOrder.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sender = json['sender'];
    receiver = json['receiver'];
    authority = json['authority'];
    title = json['title'];
    type = json['type'];
    shortDescription = json['shortDescription'];
    description = json['description'];
    duration = json['duration'];
    totalAmount = json['totalAmount'];
    initialAmount = json['initialAmount'];
    pendingAmount = json['pendingAmount'];
    finalAmount = json['finalAmount'];
    refundAmount = json['refundAmount'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    address = json['address'];
    locationUrl = json['locationUrl'];
    location = json['location'] != null
        ? new PlannerGetProjectDetailsResponseLocation.fromJson(json['location'])
        : null;
    status = json['status'];
    initialPayCompleted = json['initialPayCompleted'];
    finalPayCompleted = json['finalPayCompleted'];
    isFullyPaid = json['isFullyPaid'];
    isCompleted = json['isCompleted'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    initialPayment = json['initialPayment'] != null
        ? new PlannerGetProjectDetailsResponseInitialPayment.fromJson(json['initialPayment'])
        : null;
    actualEndDate = json['actualEndDate'];
    finalPayment = json['finalPayment'] != null
        ? new PlannerGetProjectDetailsResponseInitialPayment.fromJson(json['finalPayment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sender'] = this.sender;
    data['receiver'] = this.receiver;
    data['authority'] = this.authority;
    data['title'] = this.title;
    data['type'] = this.type;
    data['shortDescription'] = this.shortDescription;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['totalAmount'] = this.totalAmount;
    data['initialAmount'] = this.initialAmount;
    data['pendingAmount'] = this.pendingAmount;
    data['finalAmount'] = this.finalAmount;
    data['refundAmount'] = this.refundAmount;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['address'] = this.address;
    data['locationUrl'] = this.locationUrl;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['status'] = this.status;
    data['initialPayCompleted'] = this.initialPayCompleted;
    data['finalPayCompleted'] = this.finalPayCompleted;
    data['isFullyPaid'] = this.isFullyPaid;
    data['isCompleted'] = this.isCompleted;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.initialPayment != null) {
      data['initialPayment'] = this.initialPayment!.toJson();
    }
    data['actualEndDate'] = this.actualEndDate;
    if (this.finalPayment != null) {
      data['finalPayment'] = this.finalPayment!.toJson();
    }
    return data;
  }
}

class PlannerGetProjectDetailsResponseLocation {
  var type;
  List<dynamic>? coordinates;

  PlannerGetProjectDetailsResponseLocation({this.type, this.coordinates});

  PlannerGetProjectDetailsResponseLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class PlannerGetProjectDetailsResponseInitialPayment {
  var amountPaid;
  var paidAt;
  var transactionId;
  var status;

  PlannerGetProjectDetailsResponseInitialPayment(
      {this.amountPaid, this.paidAt, this.transactionId, this.status});

  PlannerGetProjectDetailsResponseInitialPayment.fromJson(Map<String, dynamic> json) {
    amountPaid = json['amountPaid'];
    paidAt = json['paidAt'];
    transactionId = json['transactionId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amountPaid'] = this.amountPaid;
    data['paidAt'] = this.paidAt;
    data['transactionId'] = this.transactionId;
    data['status'] = this.status;
    return data;
  }
}
