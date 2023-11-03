// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/global/constants/constants.dart';
import '../app/routes/app_pages.dart';

class FCMService extends GetxService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  GetStorage box = GetStorage();

  late AndroidNotificationChannel channel;

  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;

  Future<void> init() async {
    initFCM();

/*    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();

    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/launcher_icon");

    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: selectNotification);*/

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
/*
    FirebaseMessaging.instance.subscribeToTopic('magma-live');
*/
  }

  Future selectNotification(NotificationResponse? notificationResponse) async {
    log(notificationResponse?.payload.toString() ?? "null");
    log("done");

    String id = notificationResponse!.payload.toString().split("-")[1];
    String routingHelper =
        notificationResponse.payload.toString().split("-")[0];
    debugPrint(id);
    if (routingHelper.split(" ").last == "circular") {
      /*Get.toNamed(Routes.MINISTRY_DETAIL, arguments: {
        AppString.ministryappbar: "${routingHelper.split(" ")[0]} ${routingHelper.split(" ")[1]}",
        AppString.Id: id
      });*/
    } else if (routingHelper == "circular") {}

    if (notificationResponse.payload!.contains("pdf")) {
      // await OpenFilex.open(notificationResponse.payload!, type: "application/pdf");
    }
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> myBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    return _showNotification(message);
  }

  Future _showNotification(RemoteMessage message) async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    Map<String, dynamic> data = message.data;
    AndroidNotification? android = message.notification!.android;
    if (!isNullEmptyOrFalse(data)) {
      flutterLocalNotificationsPlugin.show(
        0,
        data['title'],
        data['body'],
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: android?.smallIcon,
            // other properties...
          ),
          iOS: const DarwinNotificationDetails(
              presentAlert: true, presentSound: true),
        ),
        payload: '${message.notification!.title} ${data["click_action"]}',
      );
    } else {
      flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: android?.smallIcon,
            // other properties...
          ),
          iOS: const DarwinNotificationDetails(
              presentAlert: true, presentSound: true),
        ),
        payload: '${message.notification!.title} ${data["click_action"]}',
      );
    }
  }

  /// Define a top-level named handler which background/terminated messages will
  /// call.
  ///
  /// To verify things are working, check out the native platform logs.

  void initFCM() async {
    if (!_initialized) {
      // For iOS request permission first.
      if (Platform.isIOS) {
        FirebaseMessaging.instance.requestPermission();
      }

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      FirebaseMessaging.instance
          .getInitialMessage()
          .then((RemoteMessage? message) {
        if (message != null) {
          onRemoteMessage(message);

          debugPrint("$message");

          showNotification(message);
        }
      });

      // Set the background messaging handler early on, as a named top-level function
      // FirebaseMessaging.onBackgroundMessage(
      //     _firebaseMessagingBackgroundHandler);

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        onRemoteMessage(message);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        debugPrint("$message");

        debugPrint(message.notification!.title);
        /* if (message.data['click_action'].toString().split('-')[0] == 'circular') {
          Get.toNamed(Routes.MINISREY_DETAIL2,arguments: {
            AppString.Id: message.data['click_action'].toString().split('-')[1],
            AppString.ministryappbar:message.notification!.title,
          });

        }*/
      });

      //find token
      //FirebaseMessaging.instance.getToken().then(setToken);
      // _tokenStream.listen(setToken);

      _initialized = true;
    }

    /*String testMessage =
        '{"notification": {"title": "vishwajit chauhan", "body": "Liked your moment","image": "https://bounsh.s3.amazonaws.com/profile/cbf0a9fb-0cc4-4d0f-9f3d-4391fc43e911.jpg"}, "data": {"profile": "https://bounsh.s3.amazonaws.com/profile/cbf0a9fb-0cc4-4d0f-9f3d-4391fc43e911.jpg", "uid": "vishwajit76", "name": "vishwajit chauhan", "image":"" , "stuff_type": "4", "action_type": "1", "stuff_id": "108"}}';
    Map<String, dynamic> data =
        new Map<String, dynamic>.from(json.decode(testMessage));
    showNotification(data);*/
  }

  void onRemoteMessage(RemoteMessage message) {
    debugPrint('onMessage: ${message.data}');

    log('recevied message ${message.data}');

    // if (message.data != null) {
      // Corrected condition
      final data = message.data;
      final key = data['key'];
      GetStorage box = GetStorage();

      box.write(Constant.backNotification, true);
      box.write(Constant.fcmKey, key);
      box.write(Constant.fcmValue, data['value']);

      if (key == 'Password Reset Token') {
        final value = data['value'];

        log('Received key: $key');
        log('Received value: $value');

        Get.offAllNamed(Routes.RESET_PASSWORD, arguments: value.toString());
      } else if (key == 'Verify User Token') {
        final value = data['value'];

        log('Received key: $key');
        log('Received value: $value');

        // Parse the JSON string back into a Dart map
        final decodedValue = jsonDecode(value);

        // Access the user and token values from the decoded map
        final userId = decodedValue['user']['_id'];
        final token = decodedValue['token'];

        log('received user $userId');
        log('received token $token');

        box.write(Constant.tokenKey, token);
        box.write(Constant.userId, userId);

        debugPrint(userId);
        debugPrint(token);

        Get.offAllNamed(Routes.TABS);
      }
    /* } else {
      showNotification(message);
    } */
  }

  void showNotification(RemoteMessage message) async {
    debugPrint("flutter fcm message title - ${message.notification!.title}");
    debugPrint("flutter fcm message body - ${message.notification!.body}");
    debugPrint("flutter fcm message data - ${json.encode(message.data)}");

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    Map<String, dynamic> data = message.data;
    AndroidNotification? android = message.notification!.android;
    if (!isNullEmptyOrFalse(data)) {
      flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: android?.smallIcon,
            // other properties...
          ),
          iOS: const DarwinNotificationDetails(
              presentAlert: true, presentSound: true),
        ),
        payload: '${message.notification!.title} ${data["click_action"]}',
      );
    } else {
      flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: android?.smallIcon,
            // other properties...
          ),
          iOS: const DarwinNotificationDetails(
              presentAlert: true, presentSound: true),
        ),
        payload: '${message.notification!.title} ${data["click_action"]}',
      );
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  // FCMService().showNotification(message);
  debugPrint('Handling a background message ${message.messageId}');
  /*final notificationService = NotificationService();

  notificationService.notifyMessageReceived(message);

*/
  // Corrected condition
  final data = message.data;
  final key = data['key'];
  final value = data['value'];

  /* box.write(Constant.backNotification, true);
  box.write(Constant.fcmKey, key.toString());
  box.write(Constant.fcmValue, value.toString());*/

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(Constant.backNotification, true);

  debugPrint("seeteed data");
  final getvalue = prefs.getBool(Constant.backNotification);

  debugPrint("$getvalue");

  prefs.setString(Constant.fcmKey, key.toString());
  prefs.setString(Constant.fcmValue, value.toString());

/*
  FCMService().onRemoteMessage(message);
*/
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}
