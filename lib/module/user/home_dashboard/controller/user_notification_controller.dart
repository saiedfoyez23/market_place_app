import 'package:get/get.dart';

class UserNotificationController extends GetxController {

  RxList<UserNotificationItem> notifications = <UserNotificationItem>[
    UserNotificationItem(
      id: '1',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: false,
    ),
    UserNotificationItem(
      id: '2',
      title: 'New Discount near you',
      time: '1h',
      body: 'Lorem Ipsum is not simply random text.',
      isRead: false,
    ),
    UserNotificationItem(
      id: '3',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: true,
    ),
    UserNotificationItem(
      id: '4',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: true,
    ),
    UserNotificationItem(
      id: '5',
      title: 'New Discount near you',
      time: '1h',
      body: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.',
      isRead: true,
    ),
    UserNotificationItem(
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

class UserNotificationItem {
  final String id;
  final String title;
  final String time;
  final String body;
  final bool isRead;

  UserNotificationItem({
    required this.id,
    required this.title,
    required this.time,
    required this.body,
    required this.isRead
  });
}