import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example1002(),
  ));
}

/// 代码清单 10-8 计时器
/// lib/code/code10/example_1002_baseUse.dart
class Example1002 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}


class _ExampleState extends State {
  
  ///计时器执行的次数
  int _timNumber = 0;
  ///计时器
  Timer _timer;
  
  @override
  void initState() {
    super.initState();
    //创建计时器
    startTimer();
  }
  
  @override
  void dispose() {
    //关闭计时器
    stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("定时任务"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            TextButton(
              child: Text("开启"),
              onPressed: () {
                startTimer();
              },
            ),
            TextButton(
              child: Text("停止"),
              onPressed: () {
                stopTimer();
              },
            ),
          ],
        ),
      ),
    );
  }
  
  



 //创建
  void startTimer() {
    //安全校验
    stopTimer();
    //创建一个间隔 1000 毫秒 的计时器
    //并开时执行
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      print("计时器 $_timNumber");
    });
  }

  //关闭计时器
  void stopTimer() {
    if (_timer != null && _timer.isActive) {
      _timer.cancel();
      _timer = null;
    }
  }

  void testRun(){
    Timer.run(() { });
  }
}
