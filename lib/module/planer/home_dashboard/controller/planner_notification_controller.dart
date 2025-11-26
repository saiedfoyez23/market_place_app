import 'package:get/get.dart';

class PlannerNotificationController extends GetxController {

  RxList<PlannerNotificationItem> notifications = <PlannerNotificationItem>[
    PlannerNotificationItem(
      id: '1',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: false,
    ),
    PlannerNotificationItem(
      id: '2',
      title: 'New Discount near you',
      time: '1h',
      body: 'Lorem Ipsum is not simply random text.',
      isRead: false,
    ),
    PlannerNotificationItem(
      id: '3',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: true,
    ),
    PlannerNotificationItem(
      id: '4',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: true,
    ),
    PlannerNotificationItem(
      id: '5',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: true,
    ),
    PlannerNotificationItem(
      id: '6',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: true,
    ),
  ].obs;

  void removeNotification(String id) {
    notifications.removeWhere((n) => n.id == id);
    notifications.refresh();
  }

}


class PlannerNotificationItem {
  final String id;
  final String title;
  final String time;
  final String body;
  final bool isRead;

  PlannerNotificationItem({
    required this.id,
    required this.title,
    required this.time,
    required this.body,
    required this.isRead
  });
}