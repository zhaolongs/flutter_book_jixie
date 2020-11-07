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
///  计时操作
class FutureLoopTestPage extends StatefulWidget {
  @override
  _FutureLoopTestPageState createState() => _FutureLoopTestPageState();
}

//lib/code/main_data.dart
class _FutureLoopTestPageState extends State<FutureLoopTestPage> {
  ///声明变量
  Timer _timer;

  int  curentTimer=0;
  @override
  void initState() {
    super.initState();

    ///循环执行
    ///间隔1秒
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        curentTimer++;
      });
    });
  }

  @override
  void dispose() {
    ///取消计时器
    _timer.cancel();
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
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Row(children: [
                Text("当前计时  $curentTimer s"),
              ],)
            ],
          )),
    );
  }
}
