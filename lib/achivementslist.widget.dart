/*
 * File: /achivementslist.widget.dart
 * Created Date: Monday June 11th 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:fightinstance/pojos/achievement.pojo.dart';
import 'package:flutter/material.dart';

class AchievementsListWidget extends StatefulWidget {
  final List<AchievementPojo> achievements;

  AchievementsListWidget(List<AchievementPojo> achievements): this.achievements = achievements;

  @override
  AchievementsListWidgetState createState() {
    return new AchievementsListWidgetState();
  }
}

class AchievementsListWidgetState extends State<AchievementsListWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: [
          new Expanded(
            // flex: 2,
            child: new ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: this.widget.achievements.length * 2,
              itemBuilder: (context, i) {
                if (i.isOdd) return new Divider();

                final index = i ~/ 2;

                var pojo = this.widget.achievements[index];
                return new ListTile(
                  leading: new Icon(Icons.store),
                  title: new Text(
                    pojo.title,
                    style: new TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16.0,
                    ),
                  ),
                  trailing: new Text(pojo.description),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
