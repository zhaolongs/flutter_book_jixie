import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///

///lib/app/config/home_notifier.dart
class HomeNotifier extends ChangeNotifier {
  ///当前显示的页面角标
  int _index=0;
  ///修改语言环境
  void changeLocaleState(int index) {
    _index = index;
    ///通知
    notifyListeners();
  }

  int get homeIndex => _index;
}
