/*
 * File: /newreward.widget.dart
 * Created Date: Monday June 11th 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:fightinstance/models/rewardmanager.dart';
import 'package:fightinstance/pojos/rewardmeta.pojo.dart';
import 'package:flutter/material.dart';

class NewRewardWidget extends StatefulWidget {
  final RewardMetaPojo metapojo;

  NewRewardWidget(RewardMetaPojo meta) : this.metapojo = meta;

  @override
  NewRewardWidgetState createState() {
    return new NewRewardWidgetState();
  }
}

class NewRewardWidgetState extends State<NewRewardWidget> {
  final _costEditingController = new TextEditingController();
  final _titleEditingController = new TextEditingController();

  int _typeIndex = 0;

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
                      onChanged: (text) {
                        this.setState(() {});
                      },
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
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: new Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Expanded(
                          flex: 2,
                          child: new TextField(
                            onChanged: (text) {
                              this.setState(() {});
                            },
                            controller: this._costEditingController,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration.collapsed(
                              hintText: '消耗的成就点数',
                              border: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                color: Colors.blue,
                              )),
                            ),
                          )),
                      new Flexible(
                        child: new DropdownButton(
                          isDense: true,
                          value: this._typeIndex,
                          items: [
                            new DropdownMenuItem(
                              child: new Text('单次'),
                              value: 0,
                            ),
                            new DropdownMenuItem(
                              child: new Text('不限次数'),
                              value: 1,
                            ),
                          ],
                          onChanged: (dynamic value) {
                            this.setState(() => this._typeIndex = value);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                new Row(
                  children: [
                    new Expanded(
                      flex: 1,
                      child: new RaisedButton(
                        onPressed: this._checkDataValidation()
                            ? () {
                                var instance = new RewardManager();

                                var taskmeta = new RewardMetaPojo(
                                    this._titleEditingController.text,
                                    num.parse(this._costEditingController.text),
                                    this._typeIndex == 0 ? 1 : -1);

                                instance.addRewrd(taskmeta);

                                Navigator.of(context).pop(true);
                              }
                            : null,
                        child: new Text('添加任务'),
                        color: Colors.lightBlue,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.white70,
                      ),
                    )
                  ],
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
          && this._costEditingController.text != "" && numberReg.hasMatch(this._costEditingController.text);
  }

    @override
  void dispose() {
    super.dispose();
    this._costEditingController.dispose();
    this._titleEditingController.dispose();
  }

}
