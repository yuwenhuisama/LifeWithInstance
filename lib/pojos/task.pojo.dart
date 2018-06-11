/*
 * File: /task.pojo.dart
 * Created Date: Sunday June 10th 2018
 * Author: huisama
 * -----
 * Last Modified: Sun Jun 10 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:fightinstance/pojos/taskmeta.pojo.dart';

class TaskPojo {
  final TaskMetaPojo metatask;
  int currentTimes = 0;  

  TaskPojo(TaskMetaPojo meta) : this.metatask = meta;
}
