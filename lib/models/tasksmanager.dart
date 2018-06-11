/*
 * File: /tasksmanager.dart
 * Created Date: Sunday June 3rd 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:fightinstance/models/achievementmanager.dart';
import 'package:fightinstance/pojos/achievement.pojo.dart';
import 'package:fightinstance/pojos/task.pojo.dart';
import 'package:fightinstance/pojos/taskmeta.pojo.dart';

typedef void Callback();

class TasksManager {
  final List<TaskPojo> _dailyTasks = [
  ];
  List<TaskPojo> get dailyTasks => this._dailyTasks;

  final List<TaskPojo> _weeklyTasks = [];
  List<TaskPojo> get weeklyTasks => this._weeklyTasks;

  final List<TaskPojo> _monthyTasks = [];
  List<TaskPojo> get monthyTasks => this._monthyTasks;

  final List<TaskPojo> _bigTasks = [];
  List<TaskPojo> get bigTasks => this._bigTasks;

  final Map<Object, Callback> _callbacks = {};

  void register(Object obj, Callback callback) {
    this._callbacks[obj] = callback;
  }

  void remove(Object obj) {
    this._callbacks.remove(obj);
  }

  bool _firstAdd = false;

  void addTask(TaskMetaPojo metapojo) {
    switch(metapojo.type) {
      case TaskType.Daily:
        this._dailyTasks.add(new TaskPojo(metapojo));
        break;
      case TaskType.Weeky:
        this._weeklyTasks.add(new TaskPojo(metapojo));
        break;
      case TaskType.Monthy:
        this._monthyTasks.add(new TaskPojo(metapojo));
        break;
      case TaskType.Big:
        this._bigTasks.add(new TaskPojo(metapojo));
        break;
    }

    if (!_firstAdd) {
      _firstAdd = true;
      new AchievementManager().achieve(new AchievementPojo('任务预备！', '第一次创建任务'));
    }
  }

  void removeTask(TaskPojo pojo) {
    switch(pojo.metatask.type) {
      case TaskType.Daily:
        this._dailyTasks.remove(pojo);
        break;
      case TaskType.Weeky:
        this._weeklyTasks.remove(pojo);
        break;
      case TaskType.Monthy:
        this._monthyTasks.remove(pojo);
        break;
      case TaskType.Big:
        this._bigTasks.remove(pojo);
        break;
    }

    this._callbacks.forEach((obj, e) {
      e();
    });
  }

  static TasksManager _single = new TasksManager._internal();

  factory TasksManager() {
    return _single;
  }

  TasksManager._internal();
}