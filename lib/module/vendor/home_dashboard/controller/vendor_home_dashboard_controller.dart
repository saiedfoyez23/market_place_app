import 'package:get/get.dart';

class VendorHomeDashboardController extends GetxController {

  final RxInt activeBookings = 12.obs;
  final RxString monthlyRevenue = '\$241'.obs;
  final RxInt totalBookings = 220.obs;
  final RxString totalEarnings = '\$24,350'.obs;

  // Upcoming bookings data
  RxList<Map<String, dynamic>> upcomingBookings = [
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
  ].obs;

  // Top partnerships data
  RxList<Map<String, dynamic>> topPartnerships = [
    {'name': 'Elegant Catering Co.', 'projects': '8 projects together', 'rating': 4.8},
    {'name': 'Elegant Catering Co.', 'projects': '8 projects together', 'rating': 4.8},
    {'name': 'Elegant Catering Co.', 'projects': '8 projects together', 'rating': 4.8},
    {'name': 'Elegant Catering Co.', 'projects': '8 projects together', 'rating': 4.8},
  ].obs;

}