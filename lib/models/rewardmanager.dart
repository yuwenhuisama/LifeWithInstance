/*
 * File: /rewardmanager.dart
 * Created Date: Monday June 11th 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:fightinstance/pojos/reward.pojo.dart';
import 'package:fightinstance/pojos/rewardmeta.pojo.dart';
import 'package:fightinstance/models/achievementmanager.dart';
import 'package:fightinstance/pojos/achievement.pojo.dart';

typedef void Callback();

class RewardManager {
  static final RewardManager _single = new RewardManager.__internal();

  factory RewardManager() {
    return _single;
  }

  RewardManager.__internal();

  final List<RewardPojo> _rewards = [];
  List<RewardPojo> get rewards => this._rewards;

  bool _firstAdd = false;

  void addRewrd(RewardMetaPojo pojo) {
    this.rewards.add(new RewardPojo(pojo));
    if (!_firstAdd) {
      _firstAdd = true;
      new AchievementManager().achieve(new AchievementPojo('奖励预备！', '第一次创建奖励'));
    }
  }

  void removeTask(RewardPojo pojo) {
    this.rewards.remove(pojo);

    this._callbacks.forEach((obj, e) {
      e();
    });
  }

  final Map<Object, Callback> _callbacks = {};

  void register(Object obj, Callback callback) {
    this._callbacks[obj] = callback;
  }

  void remove(Object obj) {
    this._callbacks.remove(obj);
  }

}
