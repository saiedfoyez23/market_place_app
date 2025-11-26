import 'package:get/get.dart';

class VendorNotificationController extends GetxController {

  RxList<NotificationItem> notifications = <NotificationItem>[
    NotificationItem(
      id: '1',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: false,
    ),
    NotificationItem(
      id: '2',
      title: 'New Discount near you',
      time: '1h',
      body: 'Lorem Ipsum is not simply random text.',
      isRead: false,
    ),
    NotificationItem(
      id: '3',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: true,
    ),
    NotificationItem(
      id: '4',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: true,
    ),
    NotificationItem(
      id: '5',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: true,
    ),
    NotificationItem(
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


class NotificationItem {
  final String id;
  final String title;
  final String time;
  final String body;
  final bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.time,
    required this.body,
    required this.isRead
  });
}