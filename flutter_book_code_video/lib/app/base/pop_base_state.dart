import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/22.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

abstract class PopBaseState <T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();

    ///状态栏的全透明沉浸
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    ///显示顶部的状态栏
    ///这个方法也可把状态栏和虚拟按键隐藏掉
    ///   SystemUiOverlay.top 状态栏
    ///   SystemUiOverlay.bottom 底部的虚拟键盘
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);

  }
}
