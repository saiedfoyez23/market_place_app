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
  //           "private_key_id": "c4c40721308843834dff1b8f60603e891d18603e",
  //           "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDCxsUUv1GIY6n5\nZ9hzL2PTqy3673dOOP/jhRJQUA7oqmWCHSdImmiKaoe5NUUCg8+o1rMqHQOqnKBh\n4DTMBQIVDLFiYmBbT6UsqR0DHUkCbsn2OX6HhbOat4/KNNdntebNHWGzXW9yvsx2\nBKyF/4r3N/7gIzgoEKr8RKZwF/NfnjE44Y/NofueHlvr2Weywp2P3p5hhg8ozVzQ\nhRbZarMvDuiZlthfDbhOf9zkfsrZr4Oey8v8sKq/fO0Gi0xSPdxBVtGUrPltK2Nm\nLxnWIu3/X1NcraJBRu64i459D+BG5kvDlG/NJodd3Hb42ofaqE/rKJ2OHwfcACWp\nOS6y3x1PAgMBAAECggEASqP2YWGBoqUivW9UrKtj83j9WVTMIP9J3Ewh/QH4/KNT\n2/1FERcO6cAyO8DUrcaKXRbNuN0+ivKTqX5MbUScDCn9jgjKCSPn1coG0qs1z8da\nAM/+k3uinK8sXJ5MT7OO+1p/lsc/DrdcTfuzi3Qmsl9UflswyXW9uIesSnd7LdAb\ni37HeY+ycW/FBcqng7ZS1bikgrZv1QlFYxk0ZVmzsUljcWgFFH3vs3B4HCZ3rocp\nR8YNjBDh14WurPpRX3H/D7uEO9qMQQ0JBoIrWVbH8tJOaEkIJeENXE4m7EX4IVaz\n4ERBGrXvzWmvgy5tazO/ewG2mPOo75dydh14gz65ZQKBgQDqzaWQ2xM/cQAwWMs2\n6eonz3R//JRI+mWKbAae1aTr+hct+JjC9bxcvWniT/dzjLpWJNwTeGpbv4vHyIFC\nTQoo0c7suAO0Ba8zvtSDmZ/b1xdmKnytZutB0WvkHiuJ+yY7WMpIJFeqt98XcENV\nmt9uMM1xCBIFRsek5qrMJ8IBMwKBgQDUXBgPRhHTffliCWSWArhA8yWaHK8/PMME\nYcQw7lxKzX6ZeiqjhXi46H80M6fdT+pWyQ8BgTUJdkK4dnbhOVeTg1IDMYhxQ9tE\nw32SX35/DS3vtTD1BvOqXG2gcr/m7kjLiUBFcdMsbYtcmWe0YXtqcXTpNdzL/sDX\n1fMdLPsrdQKBgEiO3Abza/NC3CgUiFej2TQMK5gRWVFj71TjJPiYVKqHUfpmw+4b\nOeX+smW5CGKwrjRIl6l8oIFRo8RM9YSjgewzSZplEt/ikc2PvuQb6QZqZVSw9G4x\nS6m/KXQIzrOI5LuaKIg6ksyynUIE8wnVHg5TDmlLcSYoRTF0BnuoHY95AoGBAMj5\nK0/xKVe1ZflxGD+b7VKSimiScwvu7kVMXUdNngyw8/o+EvJUk86zQgdeR6R8SDO/\n7jKnXFFLGZPHkXRPN2GEq24YR5+h73bhaArJ00Zca7frC50o6hu1g46Qaqsbocr2\nZtwSAB+QwI5vJCUjCJDRNSqsbfylaU4azg0zj7UtAoGBAK/u4v/pDm9QNM4N0bEZ\nktXWrDWaSSDolmLHX9p/geDCVsU+ayNAwGyeIhMQublFYayi9sZQR6WehMISh6hH\nyIPAuJzHzLf3ePmKp9P0BO/O0FBAcw8zIxelQiGMXgj/WjpcTe9b2wDJYk6LPshV\nNjTUjynE6+1Zo7KP+ozvP005\n-----END PRIVATE KEY-----\n",
  //           "client_email": "firebase-adminsdk-fbsvc@marketplaceapp-529e0.iam.gserviceaccount.com",
  //           "client_id": "107847942238317125228",
  //           "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  //           "token_uri": "https://oauth2.googleapis.com/token",
  //           "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  //           "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40marketplaceapp-529e0.iam.gserviceaccount.com",
  //           "universe_domain": "googleapis.com"
  //         }
  //         ),[firebaseMessagingScope]
  //   );
  //   final accessToken = client.credentials.accessToken.data;
  //   return accessToken;
  // }
  
}