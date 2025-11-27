import 'package:get/get.dart';

class VendorAnalysisController extends GetxController {

  // Monthly Revenue Data
  RxList<double> monthlyRevenue = <double>[
    150, 130, 280, 180, 160, 310, 100, 100, 102, 103, 105, 110
  ].obs;

  // Client Satisfaction
  RxList<double> clientSatisfaction = <double>[
    240, 250, 260, 300, 220, 260, 280, 240, 300, 270, 260, 280
  ].obs;

  // Service Popularity Pie Chart
  Map<String, double> serviceData = {
    "Corporate": 35,
    "Weddings": 25,
    "Party": 15,
    "Other": 20,
    "Birthday": 5,
  };

  // Booking Trends (Line)
  RxList<double> bookingTrends = <double>[
    240, 260, 250, 300, 220, 260, 280, 240, 300, 290, 270, 260
  ].obs;

}