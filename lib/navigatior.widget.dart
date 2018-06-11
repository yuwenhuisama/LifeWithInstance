/*
 * File: /navigatior.widget.dart
 * Created Date: Thursday May 31st 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:fightinstance/achivementslist.widget.dart';
import 'package:fightinstance/models/achievementmanager.dart';
import 'package:fightinstance/models/rewardmanager.dart';
import 'package:fightinstance/models/tasksmanager.dart';
import 'package:fightinstance/newreward.widget.dart';
import 'package:fightinstance/newtask.widget.dart';
import 'package:flutter/material.dart';

import 'package:fightinstance/instance.widget.dart';
import 'package:fightinstance/tasklist.widget.dart';
import 'package:fightinstance/rawardslist.widget.dart';

import 'package:fightinstance/utils/notification.util.dart';

class NavigatorWidget extends StatefulWidget {
  @override
  NavigatorWidgetState createState() {
    return new NavigatorWidgetState();
  }
}

class NavigatorWidgetState extends State<NavigatorWidget> {
  bool registerd = false;
  int currentIndex = 0;

  Widget _getCurrentTabView() {
    var instance = new TasksManager();
    var rewardsinstance = new RewardManager();
    var achievementsinstance = new AchievementManager();

    switch (this.currentIndex) {
      case 0:
        return new InstanceWidget([
          new TaskListWidget(instance.dailyTasks),
          new TaskListWidget(instance.weeklyTasks),
          new TaskListWidget(instance.monthyTasks),
          new TaskListWidget(instance.bigTasks),
        ]);
      case 1:
        return new RewardsListWidget(rewardsinstance.rewards);
      case 2:
        return new AchievementsListWidget(achievementsinstance.achievements);
    }
    throw new Exception("Invalid Index");
  }

  @override
  Widget build(BuildContext context) {
    // this._tabController = new TabController(length: 3, vsync: this);

    var instance = new TasksManager();
    var rewardinstance = new RewardManager();

    if (!registerd) {
      if (this.currentIndex == 0) {
        instance.register(this, () => this.setState(() {}));
      } else {
        rewardinstance.register(this, () => this.setState(() {}));
      }
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text('打副本的日常生活')),
      body: this._getCurrentTabView(),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.assessment),
            title: new Text('任务'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.card_giftcard),
            title: new Text('奖励'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.games),
            title: new Text('成就'),
          ),
        ],
        fixedColor: Colors.blue,
        currentIndex: this.currentIndex,
        onTap: (index) {
          this.setState(() => this.currentIndex = index);
        },
      ),
      floatingActionButton: this.currentIndex == 0 || this.currentIndex == 1
          ? new FloatingActionButton(
              onPressed: () async {
                // await (new LocalNotification()).pushNotification("fff", "ggg");

                switch (this.currentIndex) {
                  case 0:
                    {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new NewTaskWidget(null);
                      })).then((val) {
                        this.setState(() => {});
                      });
                    }
                    break;
                  case 1:
                    {
                      Navigator
                          .of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new NewRewardWidget(null);
                      })).then((val) {
                        this.setState(() => {});
                      });
                    }
                    break;
                }
              },
              // tooltip: 'Increment',
              child: new Text('+'),
              backgroundColor: Colors.blueGrey,
            )
          : null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    new TasksManager().remove(this);
    new RewardManager().remove(this);
    this.registerd = false;
  }
}
