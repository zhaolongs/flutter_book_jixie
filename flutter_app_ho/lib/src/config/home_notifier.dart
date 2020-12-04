import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ho/src/common/sp_key.dart';
import 'package:flutter_app_ho/src/utils/sp_utils.dart';
import 'package:flutter_app_ho/src/utils/log_util.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
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
