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

import 'package:fightinstance/models/tasksmanager.dart';
import 'package:flutter/material.dart';
import 'package:fightinstance/pojos/task.pojo.dart';
import 'package:fightinstance/models/scoremanager.dart';

class TaskSelectionWidget extends StatefulWidget {
  final TaskPojo pojo;

  TaskSelectionWidget(TaskPojo pojo) : this.pojo = pojo;

  @override
  TaskSelectionWidgetState createState() {
    return new TaskSelectionWidgetState();
  }
}

class TaskSelectionWidgetState extends State<TaskSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Checkbox(
        value: this.widget.pojo.currentTimes == this.widget.pojo.metatask.times,
        onChanged: (bool value) {
          if (value) {
            if (this.widget.pojo.currentTimes <
                this.widget.pojo.metatask.times) {
              ++this.widget.pojo.currentTimes;                  
              new ScoreManager().increaseScore(this.widget.pojo.metatask.score);
            }
            this.setState(() {});
          }
        },
      ),
      title: new Container(
          child: new Column(
        children: [
          new Row(children: [
            new Text(
              this.widget.pojo.metatask.description,
              style: this.widget.pojo.currentTimes ==
                      this.widget.pojo.metatask.times
                  ? new TextStyle(color: Colors.grey)
                  : null,
            ),
          ]),
          new Row(children: [
            new Text(
              this.widget.pojo.currentTimes.toString() +
                  "/" +
                  this.widget.pojo.metatask.times.toString(),
              style: new TextStyle(
                fontSize: 13.0,
                color: Colors.grey,
              ),
            ),
          ]),
        ],
      )),
      trailing: new Text("+" + this.widget.pojo.metatask.score.toString()),
      onTap: () {},
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return new AlertDialog(
                  title: new Text("删除任务？"),
                  content: new Text("确认删除此任务？"),
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
                          (new TasksManager()).removeTask(this.widget.pojo);
                        })
                  ]);
            });
      },
    );
  }
}
