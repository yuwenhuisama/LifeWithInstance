/*
 * File: /achievementmanager.dart
 * Created Date: Monday June 11th 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:fightinstance/pojos/achievement.pojo.dart';
import 'package:fightinstance/utils/notification.util.dart';

class AchievementManager {
  final List<AchievementPojo> _achievements = [];
  get achievements => this._achievements;

  void achieve(AchievementPojo pojo) async {
    this._achievements.add(pojo);

    await new LocalNotification().pushNotification('达成新成就！', pojo.title);
  }

  static final _single = new AchievementManager.__internal(); 

  factory AchievementManager() {
    return _single;
  }

  AchievementManager.__internal();
}
