/*
 * File: /award.widget.dart
 * Created Date: Monday June 11th 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:fightinstance/models/scoremanager.dart';
import 'package:fightinstance/pojos/reward.pojo.dart';
import 'package:fightinstance/rewardselection.widget.dart';
import 'package:flutter/material.dart';

class RewardsListWidget extends StatefulWidget {
  final List<RewardPojo> tasks;

  RewardsListWidget(List<RewardPojo> tasks) : this.tasks = tasks;

  @override
  RewardsListWidgetState createState() {
    return new RewardsListWidgetState();
  }

}

class RewardsListWidgetState extends State<RewardsListWidget> {
  bool registerd = false;

  @override
  Widget build(BuildContext context) {
    if (!registerd) {
      (new ScoreManager()).register(this, () => this.setState(() {}));
      registerd = true;
    }

    return new Container(
      child: new Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          new Expanded(
            // flex: 2,
            child: new ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: this.widget.tasks.length * 2,
              itemBuilder: (context, i) {
                if (i.isOdd) return new Divider();

                final index = i ~/ 2;

                return new RewardsSelectionWidget(this.widget.tasks[index]);
              },
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            // height: 32.0,
            child: new Container(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                    "当前可用成就点：",
                    style: new TextStyle(
                      fontSize: 16.0,
                    )
                  ),
                  new Text(
                    new ScoreManager().score.toString(),
                    style: new TextStyle(
                      color: ScoreManager().score > 0 ? Colors.blueAccent : Colors.red,
                      fontSize: 18.0,
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    new ScoreManager().remove(this);
    this.registerd = false;    
  }
}
 