/*
 * File: /newtask.widget.dart
 * Created Date: Sunday June 10th 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:flutter/material.dart';
import 'package:fightinstance/pojos/taskmeta.pojo.dart';
import 'package:fightinstance/models/tasksmanager.dart';

class NewTaskWidget extends StatefulWidget {
  final TaskMetaPojo metapojo;

  NewTaskWidget(TaskMetaPojo meta) : this.metapojo = meta;

  @override
  NewTaskWidgetState createState() {
    return new NewTaskWidgetState();
  }
}

class NewTaskWidgetState extends State<NewTaskWidget> {
  final _titleEditingController = new TextEditingController();
  final _awardEditingController = new TextEditingController();
  final _timesEditingController = new TextEditingController();

  TaskType _type = TaskType.Daily;

  @override
  Widget build(BuildContext context) {
    var body = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: new TextField(
                      onChanged: (text) { this.setState((){}); },
                      controller: this._titleEditingController,
                      decoration: new InputDecoration.collapsed(
                        hintText: '标题',
                        border: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                          color: Colors.blue,
                        )),
                      ),
                    )),
                new Container(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: new TextField(
                      onChanged: (text) { this.setState((){}); },
                      controller: this._awardEditingController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration.collapsed(
                        hintText: '成就点数',
                        border: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                          color: Colors.blue,
                        )),
                      ),
                    )),
                new Container(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: new Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Expanded(
                          flex: 2,
                          child: new TextField(
                            onChanged: (text) { this.setState((){}); },
                            controller: this._timesEditingController,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration.collapsed(
                              hintText: '可完成次数',
                              border: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                color: Colors.blue,
                              )),
                            ),
                          )),
                      new Flexible(
                        child: new DropdownButton(
                          isDense: true,
                          value: this._type,
                          items: [
                            new DropdownMenuItem(
                              child: new Text('每日任务'),
                              value: TaskType.Daily,
                            ),
                            new DropdownMenuItem(
                              child: new Text('每周任务'),
                              value: TaskType.Weeky,                              
                            ),
                            new DropdownMenuItem(
                              child: new Text('每月任务'),
                              value: TaskType.Monthy,                              
                            ),
                            new DropdownMenuItem(
                              child: new Text('大型副本'),
                              value: TaskType.Big,                              
                            ),
                          ],
                          onChanged: (dynamic value) {
                            this.setState(() => this._type = value);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                new Row(
                  children: [new Expanded(
                    flex: 1,
                    child: new RaisedButton(
                      onPressed: this._checkDataValidation() ? () {
                        var instance = new TasksManager();

                        var taskmeta = new TaskMetaPojo(
                          this._titleEditingController.text, 
                          num.parse(this._awardEditingController.text),
                          num.parse(this._timesEditingController.text), 
                          "",
                          this._type);

                        instance.addTask(taskmeta);

                        Navigator.of(context).pop(true);

                      } : null,
                      child: new Text('添加任务'),
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.white70,
                    ),
                  )],
                )
              ],
            ),
          ),
        ],
      ),
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("新建任务"),
        ),
        body: body);
  }

  bool _checkDataValidation() {
    RegExp numberReg = new RegExp(r"^[1-9][0-9]*$");
    return this._titleEditingController.text != ""
          && this._timesEditingController.text != "" && numberReg.hasMatch(this._timesEditingController.text)
          && this._awardEditingController.text != "" && numberReg.hasMatch(this._awardEditingController.text);
  }

    @override
  void dispose() {
    super.dispose();
    this._awardEditingController.dispose();
    this._timesEditingController.dispose();
    this._titleEditingController.dispose();
  }
}
