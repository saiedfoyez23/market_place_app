import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:marketplaceapp/main.dart';

class PushNotificationUtils {

  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static String firebaseMessagingScope = "https://www.googleapis.com/auth/firebase.messaging";

  static Future<void> init() async {
    await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true
    );
  }

  static Future localNotificationInit() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@drawable/logo',);
    final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings();
    final LinuxInitializationSettings initializationSettingsLinux = LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsDarwin, linux: initializationSettingsLinux);
    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
    _flutterLocalNotificationsPlugin.initialize(onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap, settings: initializationSettings);
  }

  // on tap local notification in foreground
  static void onNotificationTap(NotificationResponse notificationResponse) {
    MyApp.navigatorKey.currentState!.pushNamed("/message", arguments: notificationResponse);
  }

  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'va', 'verifiedplugapp',
      importance: Importance.max,
      priority: Priority.high,
    );
    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(threadIdentifier: 'mlimobileapp');
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails,iOS: darwinNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(id: 0,title: title, body: body, notificationDetails: notificationDetails, payload: payload);
  }

// static Future<String> getAccessToken() async {
//   final client = await clientViaServiceAccount(
//       ServiceAccountCredentials.fromJson(
//           {
//             "type": "service_account",
//             "project_id": "marketplaceapp-529e0",
//             "private_key_id": "9ab9cce999dc9237545b4065abc3f25684065ea3",
//             "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDEL6mJ+gmph03k\nJhNBPBMEY4mNzqCBrY5yLd3iV+Lp8rqO0XEZq6CAcy+qw8XhnAaW7AlDCEXz7nDy\npJJ8ChfgN8YOPIbY9fn7LLGJFXsV4qgqEOD7qHMOjgnP8EOkcogLu/YqsN57rBxp\nVPvCvD2sUm/Nap1d6+tjbOM0ZFgF0kZnPpP0KgQMam63FALJ+kCruZ4v/B6Dl6Ui\nOuQWZ0eszBcTMTb3mp6DMhg9egr0B4KDwolm1mJNSoUPALswa/3cYsJ1j0Au8lU3\nFFOFkDdQwIeJ8/4t9uvkAWVIrOQvNo1+jXasoNnDUQhxJy873TdFSfILxxgUiVRo\ncawOkqeRAgMBAAECggEANPw6ac1h9qtYWhn+cUvsRu8rI2V+7AcXxbalio/59P1d\nbV0bkrdLreVuJkyhkQE2tmQhTD1bxznKv327Ik0HjcMCdq3aLZahYTj86e0nRQ3m\nJRZR7SXdjTzHYaWeXzefjqvBHF6QeA5PzhLpu/pjHbtV/sCgp9EjzcKGyoufSlK6\nNkMmze9QP2OUxGfZ0tWlfHQEckkLqLU9W5YiUl0gAcWtKDnoAa9p0yps+rNv4Mxy\nrcK8K7BT8sPpt9I/kfrtNbLxMF/MH/oFNj52/i+la74zunkWvBfGt8PtHwSZqgIn\nAJrs2YaSZ8PQDAKsuKGuIXS+gklCWvyqq0vPJ8XzUQKBgQD+Harengxjt3aa4e3n\noD2qidClAVurshgkkxDs9RqVFAyKmrsiVQhaYlWeJRxO3eOYuLxQb4dor88dROFr\nRsY/1nb1ZyI8piOJd+cou+f1piz3e4vZJMa2N5KhK56Zh0ele7JFKS/LUUdvuCAa\nG2g1hd6vI2JvwOKFX4FF1KOxMwKBgQDFpAoeRCaP3MtFKsMz8XQItYeJJSzUcvP9\nDBN9oaA0B6+nk34AzB5HGXPRjYM+e+YxCUD5LUc6XawNiuOspd2GPmIvPjK/nj2C\ncW0xUNJhFuIE6Of7icJr8kfvDkdEXsBvhWceeSbylZXHAf+5f1v5beuUfqQc9H9U\nNptvfSSMKwKBgQD5qCYOjtJ3SXDiG+PC8+CB4uI0qo/osJEdpcs0Ml5KZqcnqXr+\n8PHC8udQ9v7H0SHhEmYY1GoBhPCDvf+FiMQPReIbmZa+ZS92yHE3yNzMr9Vv01aD\nIKmFrjWF2Lf5+DmAsHVlk2BcbV80uH35iEGqi/pKsQXt61/hTwJPm+iylwKBgDOa\n2Wl9sfPuWsT8nWt6qCl9/J26rzHpsftoo84x3Xq4Zw0CXewnX+CArNUSdipif4Be\nQjDNucNrofkHQttZk7XxpAFh5C5USws8Qp6V09i1+N3/UlNDbRhycoXg3IrlkqmL\n05kJWToOBMWpp/PvZTyDjvd++ar1zClY+MzriBdxAoGBAOjjZmlUL+RP8+eA2GBm\nd8xDdks/YcWaQMcdNgdzWL+cdGbJw3AOxZ27AwZ0RDS9RQiLRI1jxi12qDWhsUNp\nZfzTfpvhg4HrqIEP1al3ya/KSOMToCXUsPynwFkILgJeihnhMWrgFq0qBvI5/jD8\ntv+a6ZLAoGijcmAHopIsHc06\n-----END PRIVATE KEY-----\n",
//             "client_email": "firebase-adminsdk-fbsvc@marketplaceapp-529e0.iam.gserviceaccount.com",
//             "client_id": "107847942238317125228",
//             "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//             "token_uri": "https://oauth2.googleapis.com/token",
//             "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//             "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40marketplaceapp-529e0.iam.gserviceaccount.com",
//             "universe_domain": "googleapis.com"
//           }
//       ),[firebaseMessagingScope]
//   );
//   final accessToken = client.credentials.accessToken.data;
//   return accessToken;
// }
  
}