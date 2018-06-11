/*
 * File: /datasaver.dart
 * Created Date: Monday June 4th 2018
 * Author: huisama
 * -----
 * Last Modified: Fri Jun 08 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' show json;

import 'package:fightinstance/models/scoremanager.dart';
import 'package:fightinstance/models/tasksmanager.dart';

/*
data format

metadatas: 

daystring:
{
  dailytasks: [
    {
      Task pojo
    }
  ]
  weekytasks: []
  monthytasks: []
  bittasks: []
}

daystring:
daystring:
daystring:

score:

achivement:



*/

class DataSaver {
  int _lastSavingTimeStamp = 0;

  void SaveData() {

  }

  void LoadData() async {
    final DateTime dateTime = new DateTime.now();

    var formattedStirng = "${dateTime.year}_${dateTime.month}_${dateTime.day}";

    var instance = await SharedPreferences.getInstance();

    // new day
    if (instance.getString(formattedStirng) == null) {
    } else {
    }
  }

}
