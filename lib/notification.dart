
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  //--------------------------------Initialize Local Notification---------------------------//
  static initlizeLocalNotification() {
    var androidInit =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializationSettings = InitializationSettings(android: androidInit);
    _flutterLocalNotificationPlugin.initialize(
      initializationSettings,
    
    );
  }

  //------------------------------------Show Notification--------------------------------//

  static showNotification() async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        "notification",
        htmlFormatBigText: true,
        contentTitle: "notificatioin title",
        htmlFormatContentTitle: true);

    var platformChannelSpecifics = AndroidNotificationDetails(
        "com.example.alarm", "alarm",
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        color: Colors.red,
  
        // playSound: false,
        sound: const RawResourceAndroidNotificationSound("other"));

    NotificationDetails notificationDetails =
        NotificationDetails(android: platformChannelSpecifics);
    await _flutterLocalNotificationPlugin.show(0, "title",
        "title2", notificationDetails,
        payload: "title");
  }
}