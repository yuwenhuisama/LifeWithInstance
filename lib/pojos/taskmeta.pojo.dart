/*
 * File: /task.pojo.dart
 * Created Date: Sunday June 3rd 2018
 * Author: huisama
 * -----
 * Last Modified: Sun Jun 10 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */
import 'dart:convert' show json;

enum TaskType {
  Daily,
  Weeky,
  Monthy,
  Big,
}

class TaskMetaPojo {
  String description;
  int score;
  int times;
  String tag;

  TaskType type;

  TaskMetaPojo(String description, int score, int times, String tag, TaskType type): this.description = description,
                                                                  this.score = score,
                                                                  this.times = times,
                                                                  this.tag = tag,
                                                                  this.type = type;

  String get jsonString { 
    return json.encode(this);
  }
}
