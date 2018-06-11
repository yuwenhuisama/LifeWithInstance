/*
 * File: /achievement.pojo.dart
 * Created Date: Monday June 11th 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

typedef bool CheckFunc();

class AchievementPojo {
  String title;
  String description;
  // CheckFunc condition;
  bool achieved = false;

  AchievementPojo(String title, String description): this.title = title,
                                                     this.description = description;
                                                            // this.condition = condition;
}
