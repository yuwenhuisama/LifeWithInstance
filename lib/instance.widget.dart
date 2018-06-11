/*
 * File: /instance.widget.dart
 * Created Date: Thursday May 31st 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:flutter/material.dart';

class InstanceWidgetState extends State<InstanceWidget> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: new TabBar(
            tabs: [
              new Tab(text: '每日任务'),
              new Tab(text: '每周任务'),
              new Tab(text: '每月任务'),
              new Tab(text: '大型副本'),              
            ],
        ),
        body: new TabBarView(children: this.widget.tabBarViews),
      ),
    );
  }
}

class InstanceWidget extends StatefulWidget {
  final List<Widget> tabBarViews;

  InstanceWidget(List<Widget> tabBarViews): this.tabBarViews = tabBarViews;

  @override
  State<StatefulWidget> createState() => new InstanceWidgetState();
}
