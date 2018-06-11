/*
 * File: /taskselection.widget.dart
 * Created Date: Sunday June 3rd 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:fightinstance/models/rewardmanager.dart';
import 'package:flutter/material.dart';
import 'package:fightinstance/pojos/reward.pojo.dart';
import 'package:fightinstance/models/scoremanager.dart';

class RewardsSelectionWidget extends StatefulWidget {
  final RewardPojo pojo;

  RewardsSelectionWidget(RewardPojo pojo) : this.pojo = pojo;

  @override
  RewardsSelectionWidgetState createState() {
    return new RewardsSelectionWidgetState();
  }
}

class RewardsSelectionWidgetState extends State<RewardsSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Container(
          child: new Column(
        children: [
          new Row(children: [
            new Text(
              this.widget.pojo.metapojo.description,
              style: this.widget.pojo.currentTimes ==
                      this.widget.pojo.metapojo.times
                  ? new TextStyle(color: Colors.grey)
                  : null,
            ),
          ]),
          new Row(children: [
            new Text(
              this.widget.pojo.currentTimes.toString() +
                  "/" +
                  (this.widget.pojo.metapojo.times == 1
                      ? this.widget.pojo.metapojo.times.toString()
                      : "∞"),
              style: new TextStyle(
                fontSize: 13.0,
                color: Colors.grey,
              ),
            ),
          ]),
        ],
      )),
      trailing: new Text("-" + this.widget.pojo.metapojo.cost.toString()),
      onTap: () {
        if (this.widget.pojo.metapojo.times == -1) {
          ++this.widget.pojo.currentTimes;
          new ScoreManager().decreaseScore(this.widget.pojo.metapojo.cost);
        }
        else if (this.widget.pojo.currentTimes < this.widget.pojo.metapojo.times) {
          ++this.widget.pojo.currentTimes;
          new ScoreManager().decreaseScore(this.widget.pojo.metapojo.cost);
        }
        this.setState(() {});
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return new AlertDialog(
                  title: new Text("删除奖励？"),
                  content: new Text("确认删除此奖励？"),
                  actions: [
                    new FlatButton(
                        child: Text("取消"),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    new FlatButton(
                        child: Text("确认"),
                        onPressed: () {
                          Navigator.pop(context);
                          (new RewardManager()).removeTask(this.widget.pojo);
                        })
                  ]);
            });
      },
    );
  }
}
