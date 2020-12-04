import 'dart:async';
import 'dart:math';
import 'package:flutterbookcode/app/common/user_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mine_main_person_page.dart';
import 'mine_nologin_person_page.dart';


/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/22.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///

/// lib/app/page/mine/mine_main_page.dart
/// 我的页面
class MineMainPage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State{
  @override
  Widget build(BuildContext context) {
    if(UserHelper.getInstance.userIsLogin){
      //已登录情况下个人中心
      return MineMainPersonPage();
    }else{
      //未登录情况下个人中心
      return MineNoLoginPersonPage();
    }
  }

}
