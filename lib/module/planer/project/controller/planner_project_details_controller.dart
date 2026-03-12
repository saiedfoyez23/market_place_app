import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
class PlannerProjectDetailsController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isTaskDelete = false.obs;
  RxBool isFileDelete = false.obs;
  RxBool isFileSubmit = false.obs;
  String projectId;
  BuildContext context;
  RxList<File> selectedFile = <File>[].obs;
  RxList<dio.MultipartFile> filesList = <dio.MultipartFile>[].obs;
  Rx<PlannerMyProfileDetailsResponseModel> plannerMyProfileDetailsResponseModel = PlannerMyProfileDetailsResponseModel().obs;
  PlannerProjectDetailsController({required this.projectId,required this.context});
  Rx<PlannerGetProjectDetailsResponseModel> plannerGetProjectDetailsResponseModel = PlannerGetProjectDetailsResponseModel().obs;
  Rx<GetAllProjectTaskResponseModel> getAllProjectTaskResponseModel = GetAllProjectTaskResponseModel().obs;
  Rx<GetAllFileResponseModel> getAllFileResponseModel = GetAllFileResponseModel().obs;
  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!)).obs;

  Rx<TextEditingController> taskNameController = TextEditingController().obs;
  Rx<TextEditingController> taskDateController = TextEditingController().obs;
  Rx<DateTime> taskDate = DateTime.now().obs;

  Future<void> taskDatePicker({required BuildContext context}) async {
    // Pick Date
    final DateTime? pick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pick != null) {
      taskDate.value = pick;
      taskDateController.value.text = DateFormat("yyyy-MM-dd").format(taskDate.value.toLocal());
    } // user canceled
  }

  RxBool isTaskCreate = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getPlannerProfileDetailsController(context: context);
      await getPlannerProjectDetailsController(
        context: context,
        projectId: projectId,
        onComplete: (sid) async {
          await getAllTaskController(context: context, projectId: sid);
          await getAllFillController(context: context,projectId: sid);
          await plannerGetCategoryController(context: context);
          await getAllVendorOrderSearchController(context: context);
          await getAllProjectVendorQuotesController(context: context,projectId: sid);
          await getAllProjectVendorController(context: context,projectId: sid);
          await getAllProjectPaymentController(context: context,projectId: sid);
        },
      );
    });
  }

  //Task Api

  Future<void> createTaskController({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    BaseApiUtils.post(
      url: ApiUtils.createTasksResponse,
      authorization: userLoginResponseModel.value.data?.accessToken,
      data: data,
      onSuccess: (e,data) async {
        taskDateController.value.clear();
        taskNameController.value.clear();
        isTaskCreate.value = false;
        Get.back();
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        await getAllTaskController(context: context, projectId: plannerGetProjectDetailsResponseModel.value.data?.sId);
      },
      onFail: (e,data) {
        taskDateController.value.clear();
        taskNameController.value.clear();
        Get.back();
        isTaskCreate.value = false;
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
      onExceptionFail: (e,data) {
        taskDateController.value.clear();
        taskNameController.value.clear();
        Get.back();
        isTaskCreate.value = false;
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
    );
  }

  Future<void> getAllTaskController({
    required BuildContext context,
    required String projectId,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllTaskResponse(projectId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) {
        print(data);
        getAllProjectTaskResponseModel.value = GetAllProjectTaskResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }

  Future<void> isCompleteTaskController({
    required BuildContext context,
    required String taskId,
  }) async {
    BaseApiUtils.patch(
      url: ApiUtils.changeTaskStatusResponse(taskId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        await getAllTaskController(context: context, projectId: plannerGetProjectDetailsResponseModel.value.data?.sId);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
    );
  }

  Future<void> deleteTaskController({
    required BuildContext context,
    required String taskId,
  }) async {
    BaseApiUtils.delete(
      url: ApiUtils.deleteTaskResponse(taskId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isTaskDelete.value = false;
        Get.back();
        await getAllTaskController(context: context, projectId: plannerGetProjectDetailsResponseModel.value.data?.sId);
      },
      onFail: (e,data) {
        isTaskDelete.value = false;
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
      onExceptionFail: (e,data) {
        isTaskDelete.value = false;
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
    );
  }

  // overview


  Future<void> getPlannerProjectDetailsController({
    required BuildContext context,
    required String projectId,
    required Function onComplete,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.projectDetailsResponse(projectId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) {
        print(data);
        plannerGetProjectDetailsResponseModel.value = PlannerGetProjectDetailsResponseModel.fromJson(data);
        onComplete(plannerGetProjectDetailsResponseModel.value.data?.sId);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }


  Future<void> getPlannerProfileDetailsController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.userProfileDetails,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        plannerMyProfileDetailsResponseModel.value = PlannerMyProfileDetailsResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }

  //file


  Future<void> pickFile({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any, // allow all files
      withData: false,
      allowMultiple: true,
    );

    if (result != null) {
      result.files.forEach((value) {
        selectedFile.add(File(value.path!));
      });
      selectedFile.refresh();
      print(selectedFile.length);
      isFileSubmit.value = true;
      Future.delayed(Duration(seconds: 1),() async {
        await createProjectFileController(context: context,data: data);
      });
    }
  }

  Future<void> createProjectFileController({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    // Clear old files
    filesList.clear();

    // Convert selected files to MultipartFile list
    for (final file in selectedFile) {
      final mimeType = MimeTypeUtils.getMimeType(file.path);

      filesList.add(
        await dio.MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: dio.DioMediaType(
            mimeType.split('/')[0],
            mimeType.split('/')[1],
          ),
        ),
      );
    }

    // Create FormData exactly like Postman
    final formData = dio.FormData.fromMap({
      "files": filesList, // multiple files under same key
      "data": jsonEncode(data),
    });


    await BaseApiUtils.post(
      url: ApiUtils.createFileResponse,
      formData: formData,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isFileSubmit.value = false;
        selectedFile.clear();
        await getAllFillController(context: context, projectId: plannerGetProjectDetailsResponseModel.value.data?.sId);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isFileSubmit.value = false;
        selectedFile.clear();
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isFileSubmit.value = false;
        selectedFile.clear();
      },
    );
  }

  Future<void> getAllFillController({
    required BuildContext context,
    required String projectId,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllFileResponse(projectId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) {
        print(data);
        getAllFileResponseModel.value = GetAllFileResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }

  Future<void> downloadAndOpenFile(String url) async {
    try {
      // dynamic extension from url
      String extension = url.split('.').last;
      // local directory
      final dir = await getApplicationDocumentsDirectory();

      final filePath =
          "${dir.path}/file_${DateTime.now().millisecondsSinceEpoch}.$extension";
      await dio.Dio().download(
        url,
        filePath,
        onReceiveProgress: (received, total) {},
      );
      // open file
      await OpenFile.open(filePath);
    } catch (e) {
      print("Download error: $e");
    } finally {
      print("Download Complete");
    }
  }


  Future<void> deleteFileController({
    required BuildContext context,
    required String fileId,
  }) async {
    BaseApiUtils.delete(
      url: ApiUtils.deleteFileResponse(fileId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isFileDelete.value = false;
        Get.back();
        await getAllFillController(context: context, projectId: plannerGetProjectDetailsResponseModel.value.data?.sId);
      },
      onFail: (e,data) {
        isFileDelete.value = false;
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
      onExceptionFail: (e,data) {
        isFileDelete.value = false;
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
    );
  }

  // vendor

  Rx<CategoryResponseModel> categoryResponseModel = CategoryResponseModel().obs;
  RxList<CategoryResponseData> selectCategory = <CategoryResponseData>[].obs;
  RxList<String> selectCategoryString = <String>[].obs;
  RxBool isVendorAdd = false.obs;
  RxBool isPayment = false.obs;
  Rx<TextEditingController> noteController = TextEditingController().obs;
  Rx<PlannerGetAllVendorOrderResponseModel> plannerGetAllVendorOrderResponseModel = PlannerGetAllVendorOrderResponseModel().obs;
  Rx<PlannerGetAllVendorOrderResponse> plannerGetAllVendorOrderResponse = PlannerGetAllVendorOrderResponse().obs;
  Rx<GetAllProjectVendorQuotesResponseModel> getAllProjectVendorQuotesResponseModel = GetAllProjectVendorQuotesResponseModel().obs;
  Rx<GetAllProjectVendorResponseModel> getAllProjectVendorResponseModel = GetAllProjectVendorResponseModel().obs;
  Rx<GetAllProjectPaymentResponseModel> getAllProjectPaymentResponseModel = GetAllProjectPaymentResponseModel().obs;

  Future<void> plannerGetCategoryController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.categoryResponse,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        print(data);
        categoryResponseModel.value = CategoryResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }


  Future<void> getAllVendorOrderSearchController({
    required BuildContext context,
  }) async {

    BaseApiUtils.get(
      url: ApiUtils.getAllVendorOrder,
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        plannerGetAllVendorOrderResponseModel.value = PlannerGetAllVendorOrderResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }


  Future<void> createAddVendorController({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    BaseApiUtils.post(
      url: ApiUtils.createAssignVendors,
      authorization: userLoginResponseModel.value.data?.accessToken,
      data: data,
      onSuccess: (e,data) async {
        selectCategory.value = <CategoryResponseData>[].obs;
        selectCategoryString.value = <String>[].obs;
        plannerGetAllVendorOrderResponse.value = PlannerGetAllVendorOrderResponse();
        noteController.value.clear();
        isVendorAdd.value = false;
        Get.back();
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        await getAllVendorOrderSearchController(context: context);
        await getAllProjectVendorQuotesController(context: context, projectId: plannerGetProjectDetailsResponseModel.value.data?.sId);
        await getAllProjectVendorController(context: context, projectId: plannerGetProjectDetailsResponseModel.value.data?.sId);
        await getAllProjectPaymentController(context: context, projectId: plannerGetProjectDetailsResponseModel.value.data?.sId);
      },
      onFail: (e,data) {
        selectCategory.value = <CategoryResponseData>[].obs;
        selectCategoryString.value = <String>[].obs;
        plannerGetAllVendorOrderResponse.value = PlannerGetAllVendorOrderResponse();
        noteController.value.clear();
        isVendorAdd.value = false;
        Get.back();
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
      onExceptionFail: (e,data) {
        selectCategory.value = <CategoryResponseData>[].obs;
        selectCategoryString.value = <String>[].obs;
        plannerGetAllVendorOrderResponse.value = PlannerGetAllVendorOrderResponse();
        noteController.value.clear();
        isVendorAdd.value = false;
        Get.back();
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
    );
  }


  Future<void> getAllProjectVendorQuotesController({
    required BuildContext context,
    required String projectId,
  }) async {

    BaseApiUtils.get(
      url: ApiUtils.getAllCompareQuotes(projectId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        getAllProjectVendorQuotesResponseModel.value = GetAllProjectVendorQuotesResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }

  Future<void> getAllProjectVendorController({
    required BuildContext context,
    required String projectId,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllProjectVendor(projectId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllProjectVendorResponseModel.value = GetAllProjectVendorResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }

  //payment


  Future<void> getAllProjectPaymentController({
    required BuildContext context,
    required String projectId,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getAllVendorPayment(projectId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getAllProjectPaymentResponseModel.value = GetAllProjectPaymentResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }


  Future<void> makePaymentController({
    required BuildContext context,
    required String paymentId,
  }) async {
    BaseApiUtils.patch(
      url: ApiUtils.getVendorMakePayment(paymentId),
      authorization: userLoginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isPayment.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        await getAllProjectPaymentController(context: context, projectId: plannerGetProjectDetailsResponseModel.value.data?.sId);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isPayment.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isPayment.value = false;
      },
    );
  }




  final Rx<PlannerEventInfoModel> eventInfo = PlannerEventInfoModel(
    name: "Kids Birthday Party Extravaganza",
    startDate: DateTime(2025, 10, 28),
    endDate: DateTime(2025, 11, 3),
    location: "Malibu Beach Resort, CA",
  ).obs;

  final Rx<PlannerClientInfoModel> clientInfo = PlannerClientInfoModel(
    name: "Shafiq Hasnain",
    email: "shafiqhasnain@gmail.com",
    phone: "+1 (626) 456-7890",
    location: "Malibu Beach Resort, CA",
  ).obs;

  final Rx<PlannerProgressInfoModel> progressInfo = PlannerProgressInfoModel(
    percentage: 70,
    totalVendors: 4,
    budget: 1500.0,
  ).obs;

  final RxList<PlannerAboutItemModel> aboutItems = [
    PlannerAboutItemModel(
      title: "Entrance & Welcome",
      details: ["Welcome board with birthday name & age"],
    ),
    PlannerAboutItemModel(
      title: "Balloon arch / LED frame",
      details: ["Flower arch / LED frame"],
    ),
    PlannerAboutItemModel(
      title: "Red carpet or LED walkway",
      details: ["Red carpet or LED walkway"],
    ),
    PlannerAboutItemModel(
      title: "Photo booth backdrop",
      details: ["Cake & dessert trays", "LED candles or sparklers on cake"],
    ),
    PlannerAboutItemModel(
      title: "Customized cake topper",
      details: ["Customized cake topper"],
    ),
    PlannerAboutItemModel(
      title: "Photo zone photo with props",
      details: ["Neon lights ('Let's Party' / 'Cheers')", "Happy Birthday (Let's Party / Cheers)"],
    ),
    PlannerAboutItemModel(
      title: "Polaroid corner for instant photos",
      details: ["Birthday corner", "Happy Birthday"],
    ),
  ].obs;

  final RxList<PlannerProjectVendorModel> vendors = [
    PlannerProjectVendorModel(
      name: "Elegant Catering Limited",
      category: "Catering Service",
      status: "Confirmed",
      email: "shafiqhasnain@gmail.com",
      phone: "+1 (626) 456-7890",
      quote: 20.00,
      location: "Malibu Beach Resort, CA",
    ),
    PlannerProjectVendorModel(
      name: "Bella Photography",
      category: "Photography",
      status: "Confirmed",
      email: "shafiqhasnain@gmail.com",
      phone: "+1 (626) 456-7890",
      quote: 150.00,
      location: "Malibu Beach Resort, CA",
    ),
    PlannerProjectVendorModel(
      name: "Decor Dreams",
      category: "Photography",
      status: "Pending",
      email: "shafiqhasnain@gmail.com",
      phone: "+1 (626) 456-7890",
      quote: 20.00,
      location: "Malibu Beach Resort, CA",
    ),
    PlannerProjectVendorModel(
      name: "Beauty Parlors",
      category: "Makeup Artis",
      status: "Confirmed",
      email: "shafiqhasnain@gmail.com",
      phone: "+1 (626) 456-7890",
      quote: 20.00,
      location: "Malibu Beach Resort, CA",
    ),
  ].obs;


  final RxList<PlannerPaymentModel> payments = [
    PlannerPaymentModel(
      source: "Client",
      description: "First payment",
      date: DateTime(2025, 10, 10),
      status: "Paid",
      amount: 150.00,
    ),
    PlannerPaymentModel(
      source: "Vendor",
      description: "Decor Dreams",
      date: DateTime(2025, 10, 10),
      status: "Pending",
      amount: 150.00,
    ),
    PlannerPaymentModel(
      source: "Vendor",
      description: "Bella Photography",
      date: DateTime(2025, 10, 10),
      status: "Pending",
      amount: 150.00,
    ),
    PlannerPaymentModel(
      source: "Vendor",
      description: "Beauty Parlors",
      date: DateTime(2025, 10, 10),
      status: "Pending",
      amount: 150.00,
    ),
  ].obs;

  // Total received and pending calculations (dynamic)
  double get totalReceived => payments.where((p) => p.status == 'Paid').fold(0.0, (sum, p) => sum + p.amount);
  double get totalPending => payments.where((p) => p.status == 'Pending').fold(0.0, (sum, p) => sum + p.amount);

  Rx<PlannerOrderDetailsPage> selectedPage = PlannerOrderDetailsPage.overview.obs;

  void changeTab(PlannerOrderDetailsPage page) {
    selectedPage.value = page;
  }

}


enum PlannerOrderDetailsPage { overview, vendors, tasks, files, payments }


// Data models for dynamic content
class PlannerEventInfoModel {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String location;

  PlannerEventInfoModel({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.location,
  });
}

class PlannerClientInfoModel {
  final String name;
  final String email;
  final String phone;
  final String location;

  PlannerClientInfoModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
  });
}

class PlannerProgressInfoModel {
  final int percentage;
  final int totalVendors;
  final double budget;

  PlannerProgressInfoModel({
    required this.percentage,
    required this.totalVendors,
    required this.budget,
  });
}

class PlannerAboutItemModel {
  final String title;
  final List<String> details;

  PlannerAboutItemModel({required this.title, required this.details});
}

class PlannerProjectVendorModel {
  final String name;
  final String category;
  final String status; // 'Confirmed', 'Pending'
  final String email;
  final String phone;
  final double quote;
  final String location;

  PlannerProjectVendorModel({
    required this.name,
    required this.category,
    required this.status,
    required this.email,
    required this.phone,
    required this.quote,
    required this.location,
  });
}

class PlannerPaymentModel {
  final String source;
  final String description;
  final DateTime date;
  final String status; // 'Paid', 'Pending'
  final double amount;

  PlannerPaymentModel({
    required this.source,
    required this.description,
    required this.date,
    required this.status,
    required this.amount,
  });
}