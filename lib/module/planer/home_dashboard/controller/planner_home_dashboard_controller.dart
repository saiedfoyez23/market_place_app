import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerHomeDashboardController extends GetxController {


  final RxInt activeProject = 12.obs;
  final RxInt upcomingEvent = 3.obs;
  final RxInt newLeads = 220.obs;
  final RxString totalEarnings = '\$24,350'.obs;

  // Upcoming bookings data
  RxList<Map<String, dynamic>> upcomingBookings = [
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
    {'title': 'Wedding Reception - Johnson Family', 'date': 'Nov 5, 2025', 'status': 'Confirmed'},
  ].obs;

  // Top partnerships data
  RxList<Map<String, dynamic>> topPartnerships = [
    {'name': 'Payment received from client XYZ.', 'time': '2 hours ago', 'image': ImageUtils.recentActivitiesImage1},
    {'name': 'Vendor ABC confirmed for event..', 'time': 'Nov 5, 2025', 'image': ImageUtils.recentActivitiesImage2},
    {'name': 'Congratulations! You earned a Ver..', 'time': '1 day Ago', 'image': ImageUtils.recentActivitiesImage3},
  ].obs;


}