/*
 * File: /main.dart
 * Created Date: Thursday May 31st 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */
import 'package:fightinstance/pojos/achievement.pojo.dart';
import 'package:fightinstance/utils/notification.util.dart';
import 'package:flutter/material.dart';
import 'package:fightinstance/navigatior.widget.dart';
import 'package:fightinstance/models/achievementmanager.dart';

void main() async {
  await (new LocalNotification()).initialize();
  
  runApp(new MainScreen());
}

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() {
    return new MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    new AchievementManager().achieve(new AchievementPojo('开始打副本吧！', '开始使用APP'));
    
    return new MaterialApp(
      title: '打副本的日常生活',
      home: new NavigatorWidget(),
      theme: new ThemeData(primaryColor: Colors.white),
    );
  }
}
