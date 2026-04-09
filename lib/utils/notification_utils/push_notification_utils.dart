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
  //     ServiceAccountCredentials.fromJson(
  //         {
  //           "type": "service_account",
  //           "project_id": "marketplaceapp-529e0",
  //           "private_key_id": "ea9bb8dc356e4081d2ee1e3af028b4ceb97c7879",
  //           "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC3+GODzFN6cBR6\niPCViGMS7r7XlV6fOHiQ0YPfTlE47cT0ThhYL2o3f7UHg29dfAOyDegj6yMyJWiH\nxBvOTrGwaSP4ST3YpIv7ozI4hUIBzOF9Xa5h//bPjzbx/DXavtl3jm8PbLSfjKDM\npZHLxqrDOtBB4bY79lKrmIhLII26HJttdLi4LtEQUkSmDrRneSXkzFSVhuZ0sqVG\nZ1Eq1583uNz8iABeFgJMx8o2wjUyL7PSqSVkriRLF8qHptDWzmEvOhx18txcQaN7\nLCfKAWco+oaO/VWKctdTKZrKvtCpww1j/fOMA28ZTgKuFQafRLyux84vOeWKxqfh\nyCKYeplzAgMBAAECggEAP9aQBbyh3RNGb+zT+zecFYZGL/3zmzGX2LzzU0pUcfpE\nBXiSBwvRAlgs4+IOg3SUvbUIsGoYSP7lInOBKJpzG2GoqzATJ3mV36iWNTm8mW5U\nctHOwM/2/7hVGyxnLbRbNxr0W/hfRxwf8lOj33/dYqimeq4NtAn6TvQ7m0I9G+7Y\ntORmT9Mya2H2ZIKH7Qxzp6Q03IA6uBapbErXpZMMgfoRB/XBzjc3ANYTf4SwgZ5g\nNk0F2ezgo/u2l4WDccVPuMeaIwus8IYFIASIMcq34PeL9Ko1Gkf+MKe5EFQlZfjb\nlEZPuE6x2iXSawAjH5GLIJd9T4NYutLA2X/fDgRbDQKBgQDz+JNk6AY0E+PAzDDS\nSDddqoFL1JaM+th4a99KCNUKkmmlb3tl98ETdJb0vEGdM1nEQuy8LGQweirrKwMW\nvIhVGqNfFldsmoRPT9oSsdGLVTY0ZhgvjQyt7AhymjztlmNj1ZTLrRWGW9neqcZo\ntYiynjR3xGc4A1qpxx0SNbZXrwKBgQDBCnpvwYe2//7wS5L2nr+74LY6fu1UhmTS\nQ4nyptnnGNVFNJJsPDsEWyAHdVVQ69Rjze2Rg8URp3wFTQChh/hBj6m/f9aDYYyi\nmgOdCRHhJ8F/DkPT3ti8PhT/PHFo77hTv6lCLr9qh2Pj+l9JeOjrKEJEHntvCLsM\nWNUOtbQHfQKBgDyNc7fVxsRiM2MEyxFGD0fWK+UwTHWNRPEOhQsRCh9nm4UOGGiE\nh41WoKj5mKd1uU/29F73/Z3ylHht4oRgIs5MoEPXfbdc2n386bk+HS4h5iQ3OsWC\nkqUQMkCPe5PUgbKjrhynRvJkFb0oEjCm7di3X3piauQCIRyGaPa+EhXNAoGAbyrG\nmYcczcEcomsTJh0Dk4Fzz7n6mJuQghnM3kVB5TjC0MjWraf94KNNjZ3/VMuKkzMq\n5Yq5uVH3NOJEQ8GWsMK34YUQFrbdk2IYRJ3Ngxku8ClZ3DBQJg+mbdn0AZdTUj9k\njK15JDL1znsH1rrff1S+3JWlRasEdLbPc1omY80CgYEAj6ax7Ij6ODRfEnVqF+Cc\n80p5RNeTk2SxuCqu3GUB8tSmsrntVaHHv0UzTZcc01Gx/AQy29/sKHC0sO2CsV6Z\nGKbPRk0o//HSE2g+vNF7d3qaYjoAUR9IFzqvhMc1KTFy8Wa7zp80knFj72eUsgzN\nkFDhY0RXS9NidtiMVHnqrPY=\n-----END PRIVATE KEY-----\n",
  //           "client_email": "firebase-adminsdk-fbsvc@marketplaceapp-529e0.iam.gserviceaccount.com",
  //           "client_id": "107847942238317125228",
  //           "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  //           "token_uri": "https://oauth2.googleapis.com/token",
  //           "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  //           "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40marketplaceapp-529e0.iam.gserviceaccount.com",
  //           "universe_domain": "googleapis.com"
  //         }
  //     ),[firebaseMessagingScope]
  //   );
  //   final accessToken = client.credentials.accessToken.data;
  //   return accessToken;
  // }
  
}