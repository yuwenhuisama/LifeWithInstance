/*
 * File: /scoremanager.dart
 * Created Date: Monday June 4th 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:fightinstance/models/achievementmanager.dart';
import 'package:fightinstance/pojos/achievement.pojo.dart';

typedef void Callback();

class ScoreManager {

  static final ScoreManager _single = new ScoreManager.__internal();

  final Map<Object, Callback> _callbacks = {};

  void register(Object obj, Callback callback) {
    this._callbacks[obj] = callback;
  }

  void remove(Object obj) {
    this._callbacks.remove(obj);
  }

  int _score = 0;
  int get score =>  this._score;
  set score(int val) {
    this._score = val;
    this._callbacks.forEach((obj, e) {
      e();
    });
  }

  List<bool> flags = [false, false, false, false];

  int _historyScore = 0;
  int get historyScore => this._historyScore;
  set historyScore(int value) => this._historyScore = value;

  void increaseScore(int value) {
    this.score += value;
    this.historyScore += value;

    if (!this.flags[0] && this.historyScore >= 10) {
      this.flags[0] = true;
      new AchievementManager().achieve(new AchievementPojo('初见成效', '累计成就点达到10点'));
    }
    
    if (!this.flags[1] && this.historyScore >= 50) {
      this.flags[1] = true;
      new AchievementManager().achieve(new AchievementPojo('小有成就', '累计成就点达到50点'));
    }

    if (!this.flags[2] && this.historyScore >= 200) {
      this.flags[2] = true;
      new AchievementManager().achieve(new AchievementPojo('老司机', '累计成就点达到200点'));
    }

    if (!this.flags[3] && this.historyScore >= 500) {
      this.flags[3] = true; 
      new AchievementManager().achieve(new AchievementPojo('成就大师', '累计成就点达到500点'));
    }

  }

  void decreaseScore(int value) {
    this.score -= value;
  }

  factory ScoreManager() {
    return _single;
  }

  ScoreManager.__internal();
}
