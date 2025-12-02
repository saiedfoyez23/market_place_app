import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class PlannerProjectDetailsController extends GetxController {


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

  final RxList<PlannerTaskModel> tasks = [
    PlannerTaskModel(
      title: "Venue booking",
      date: DateTime(2025, 10, 20),
      isCompleted: true,
    ),
    PlannerTaskModel(
      title: "Confirm venue booking",
      date: DateTime(2025, 10, 20),
      isCompleted: true,
    ),
    PlannerTaskModel(
      title: "Confirm venue booking",
      date: DateTime(2025, 10, 20),
      isCompleted: true,
    ),
    PlannerTaskModel(
      title: "Confirm venue booking",
      date: DateTime(2025, 10, 20),
      isCompleted: true,
    ),
    PlannerTaskModel(
      title: "Confirm venue booking",
      date: DateTime(2025, 10, 20),
      isCompleted: true,
    ),
    PlannerTaskModel(
      title: "Confirm venue booking",
      date: DateTime(2025, 10, 20),
      isCompleted: true,
    ),
    PlannerTaskModel(
      title: "Menu finalization with caterer",
      date: DateTime(2025, 10, 20),
      isCompleted: false,
    ),
  ].obs;

  final RxList<PlannerFileItemModel> files = [
    PlannerFileItemModel(
      name: "venue-floorplan.pdf",
      uploadDate: DateTime(2025, 10, 15),
      size: "12 MB",
    ),
    PlannerFileItemModel(
      name: "venue-floorplan.pdf",
      uploadDate: DateTime(2025, 10, 15),
      size: "12 MB",
    ),
    PlannerFileItemModel(
      name: "venue-floorplan.pdf",
      uploadDate: DateTime(2025, 10, 15),
      size: "12 MB",
    ),
    PlannerFileItemModel(
      name: "venue-floorplan.pdf",
      uploadDate: DateTime(2025, 10, 15),
      size: "12 MB",
    ),
    PlannerFileItemModel(
      name: "venue-floorplan.pdf",
      uploadDate: DateTime(2025, 10, 15),
      size: "12 MB",
    ),
    PlannerFileItemModel(
      name: "venue-floorplan.pdf",
      uploadDate: DateTime(2025, 10, 15),
      size: "12 MB",
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

  Rx<File> selectedFile = File("").obs;


  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'svg', 'tiff', 'bmp', 'heic'],
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      selectedFile.value = File(result.files.single.path!);
    }
  }

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

class PlannerTaskModel {
  final String title;
  final DateTime date;
  final bool isCompleted;

  PlannerTaskModel({
    required this.title,
    required this.date,
    required this.isCompleted,
  });
}

class PlannerFileItemModel {
  final String name;
  final DateTime uploadDate;
  final String size;

  PlannerFileItemModel({
    required this.name,
    required this.uploadDate,
    required this.size,
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