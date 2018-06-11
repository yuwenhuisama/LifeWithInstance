/*
 * File: /notification.dart
 * Created Date: Monday June 11th 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/initialization_settings.dart';
import 'package:flutter_local_notifications/notification_details.dart';
import 'package:flutter_local_notifications/platform_specifics/android/initialization_settings_android.dart';
import 'package:flutter_local_notifications/platform_specifics/android/notification_details_android.dart';
import 'package:flutter_local_notifications/platform_specifics/ios/initialization_settings_ios.dart';
// import 'package:flutter_local_notifications/platform_specifics/ios/notification_details_ios.dart';

class LocalNotification {
  static final _single = new LocalNotification.__internal();

  factory LocalNotification() {
    return _single;
  }

  LocalNotification.__internal();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future initialize() async {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        new InitializationSettingsAndroid('mipmap/ic_launcher');
    var initializationSettingsIOS = new InitializationSettingsIOS();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        selectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      print('notification payload: ' + payload);
    }
  }

  Future pushNotification(String title, String content) async {
      NotificationDetailsAndroid androidPlatformChannelSpecifics =
          new NotificationDetailsAndroid('your channel id', 'your channel name',
              'your channel description',
              importance: Importance.Max, priority: Priority.High);

      NotificationDetails platformChannelSpecifics =
          new NotificationDetails(androidPlatformChannelSpecifics, null);

      await flutterLocalNotificationsPlugin
          .show(0, title, content, platformChannelSpecifics, payload: '');
  } 
}
