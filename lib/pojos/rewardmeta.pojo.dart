/*
 * File: /rewardmeta.pojo.dart
 * Created Date: Monday June 11th 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

class RewardMetaPojo {
  String description;
  int cost;
  int times;

  RewardMetaPojo(String description, int cost, int times) : this.description = description,
                                                            this.cost = cost,
                                                            this.times = times;
}
