// // import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:get/get.dart';
// // import 'package:timezone/data/latest.dart' as tz;
// // import 'package:timezone/timezone.dart' as tz;

// // // class NotifyHelper {
// // //   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// // //       FlutterLocalNotificationsPlugin(); //

// // //   initializeNotification() async {
// // //     tz.initializeTimeZones();
// // //     final IOSInitializationSettings initializationSettingsIOS =
// // //         IOSInitializationSettings(
// // //             requestSoundPermission: false,
// // //             requestBadgePermission: false,
// // //             requestAlertPermission: false,
// // //             onDidReceiveLocalNotification: onDidReceiveLocalNotification);

// // //     final AndroidInitializationSettings initializationSettingsAndroid =
// // //         AndroidInitializationSettings("appicon");

// // //     final InitializationSettings initializationSettings =
// // //         InitializationSettings(
// // //       iOS: initializationSettingsIOS,
// // //       android: initializationSettingsAndroid,
// // //     );
// // //     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
// // //         onSelectNotification: selectNotification);
// // //   }

// // //   scheduledNotification() async {
// // //     print("ssss");
// // //     await flutterLocalNotificationsPlugin.zonedSchedule(
// // //         0,
// // //         DateTime.now().toString(),
// // //         'theme changes 5 seconds ago',
// // //         tz.TZDateTime.now(tz.local).add(const Duration(seconds: 3)),
// // //         const NotificationDetails(
// // //             android: AndroidNotificationDetails(
// // //                 'your channel id', 'your channel name',
// // //                 subText: 'your channel description')),
// // //         androidAllowWhileIdle: true,
// // //         uiLocalNotificationDateInterpretation:
// // //             UILocalNotificationDateInterpretation.absoluteTime);
// // //   }

// // //   displayNotification({required String title, required String body}) async {
// // //     print("doing test");
// // //     var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
// // //         'your channel id', 'your channel name',
// // //         subText: 'your channel description',
// // //         importance: Importance.max,
// // //         priority: Priority.high);
// // //     var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
// // //     var platformChannelSpecifics = new NotificationDetails(
// // //         android: androidPlatformChannelSpecifics,
// // //         iOS: iOSPlatformChannelSpecifics);
// // //     await flutterLocalNotificationsPlugin.show(
// // //       0,
// // //       "${DateTime.now().toString()}",
// // //       body,
// // //       platformChannelSpecifics,
// // //       payload: 'Default_Sound',
// // //     );
// // //   }

// // //   void requestIOSPermissions() {
// // //     flutterLocalNotificationsPlugin
// // //         .resolvePlatformSpecificImplementation<
// // //             IOSFlutterLocalNotificationsPlugin>()
// // //         ?.requestPermissions(
// // //           alert: true,
// // //           badge: true,
// // //           sound: true,
// // //         );
// // //   }

// // //   Future selectNotification(String? payload) async {
// // //     if (payload != null) {
// // //       print('notification payload: $payload');
// // //     } else {
// // //       print("Notification Done");
// // //     }
// // //     Get.to(() => Container(
// // //           color: Colors.white,
// // //         ));
// // //   }

// // //   Future onDidReceiveLocalNotification(
// // //       int? id, String? title, String? body, String? payload) async {
// // //     // display a dialog with the notification details, tap ok to go to another page
// // //     /*showDialog(
// // //       //context: context,
// // //       builder: (BuildContext context) => CupertinoAlertDialog(
// // //         title: Text(title),
// // //         content: Text(body),
// // //         actions: [
// // //           CupertinoDialogAction(
// // //             isDefaultAction: true,
// // //             child: Text('Ok'),
// // //             onPressed: () async {
// // //               Navigator.of(context, rootNavigator: true).pop();
// // //               await Navigator.push(
// // //                 context,
// // //                 MaterialPageRoute(
// // //                   builder: (context) => SecondScreen(payload),
// // //                 ),
// // //               );
// // //             },
// // //           )
// // //         ],
// // //       ),
// // //     );*/
// // //     Get.dialog(Text("Welcome To Flutter"));
// // //   }

// // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //       FlutterLocalNotificationsPlugin();

// // Future<void> initNotification() async {

// //     // Android initialization
// //     final AndroidInitializationSettings initializationSettingsAndroid =
// //         AndroidInitializationSettings('@mipmap/ic_launcher');// should mention the app icon
// //                                                              // during initialization itself

// //     // Ios initialization
// //     final IOSInitializationSettings initializationSettingsIOS =
// //         IOSInitializationSettings(
// //       requestAlertPermission: false,
// //       requestBadgePermission: false,
// //       requestSoundPermission: false,
// //     );

// //     final InitializationSettings initializationSettings =
// //         InitializationSettings(
// //             android: initializationSettingsAndroid,
// //             iOS: initializationSettingsIOS);

// //     // the initialization settings are initialized after they are setted
// //     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;

// class NotificationService {
// static final NotificationService _notificationService =
// 	NotificationService._internal();

// factory NotificationService() {
// 	return _notificationService;
// }

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// 	FlutterLocalNotificationsPlugin();

// NotificationService._internal();

// Future<void> initNotification() async {

// 	// Android initialization
// 	final AndroidInitializationSettings initializationSettingsAndroid =
// 		AndroidInitializationSettings('@mipmap/ic_launcher');

// 	// ios initialization
// 	final IOSInitializationSettings initializationSettingsIOS =
// 		IOSInitializationSettings(
// 	requestAlertPermission: false,
// 	requestBadgePermission: false,
// 	requestSoundPermission: false,
// 	);

// 	final InitializationSettings initializationSettings =
// 		InitializationSettings(
// 			android: initializationSettingsAndroid,
// 			iOS: initializationSettingsIOS);
// 	// the initialization settings are initialized after they are setted
// 	await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }

// Future<void> showNotification(int id, String title, String body) async {
// 	await flutterLocalNotificationsPlugin.zonedSchedule(
// 	id,
// 	title,
// 	body,
// 	tz.TZDateTime.now(tz.local).add(Duration(
// 		seconds: 1)), //schedule the notification to show after 2 seconds.
// 	const NotificationDetails(

// 		// Android details
// 		android: AndroidNotificationDetails('main_channel', 'Main Channel',
// 			channelDescription: "ashwin",
// 			importance: Importance.max,
// 			priority: Priority.max),
// 		// iOS details
// 		iOS: IOSNotificationDetails(
// 		sound: 'default.wav',
// 		presentAlert: true,
// 		presentBadge: true,
// 		presentSound: true,
// 		),
// 	),

// 	// Type of time interpretation
// 	uiLocalNotificationDateInterpretation:
// 		UILocalNotificationDateInterpretation.absoluteTime,
// 	androidAllowWhileIdle:
// 		true, // To show notification even when the app is closed
// 	);
// }
// }

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initializeNotification() async {
    tz.initializeTimeZones();
    _configureLocalTimeZone();
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("appicon");

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// Set right date and time for notifications
  tz.TZDateTime _convertTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minutes,
    );
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  /// Scheduled Notification
  scheduledNotification(
      {required int hour,
      required int minutes,
      required int id,
      required String quote}) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'Motivation',
      quote,
      _convertTime(hour, minutes),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id notiiii',
          'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'It could be anything you pass',
    );
  }

  /// Request IOS permissions
  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  cancelAll() async => await flutterLocalNotificationsPlugin.cancelAll();
  cancel(id) async => await flutterLocalNotificationsPlugin.cancel(id);
}
