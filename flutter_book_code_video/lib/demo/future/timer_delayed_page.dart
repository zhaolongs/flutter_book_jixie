import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/8/8.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
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