import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/8/8.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 延时操作
class TimerDelayedTestPage extends StatefulWidget {
  @override
  _TimerDelayedTestPageState createState() => _TimerDelayedTestPageState();
}

//lib/code/main_data.dart
class _TimerDelayedTestPageState extends State{
  ///声明
  Timer timer;
  @override
  void initState() {
    super.initState();
    ///延时2秒
     timer =  new Timer(Duration(milliseconds: 2000), (){

    });
  }
  @override
  void dispose() {
    ///取消延时任务
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
            ],
          )),
    );
  }


  void test3(){

  }
}