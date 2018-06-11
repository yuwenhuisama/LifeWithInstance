/*
 * File: /reward.pojo.dart
 * Created Date: Monday June 11th 2018
 * Author: huisama
 * -----
 * Last Modified: Mon Jun 11 2018
 * Modified By: huisama
 * -----
 * Copyright (c) 2018 Hui
 */

import 'package:fightinstance/pojos/rewardmeta.pojo.dart';

class RewardPojo {
   RewardMetaPojo metapojo;
   int currentTimes = 0;

   RewardPojo(RewardMetaPojo metapojo): this.metapojo = metapojo;
}
