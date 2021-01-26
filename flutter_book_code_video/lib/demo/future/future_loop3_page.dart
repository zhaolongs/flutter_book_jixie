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
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///  计时操作
class FutureLoopTestPage3 extends StatefulWidget {
  @override
  _FutureLoopTestPageState createState() => _FutureLoopTestPageState();
}

//lib/code/main_data.dart
class _FutureLoopTestPageState extends State<FutureLoopTestPage3> {
  ///声明变量
  Timer _timer;
  ///记录当前的时间
  int curentTimer = 0;

  @override
  void initState() {
    super.initState();

    ///循环执行
    ///间隔1秒
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      ///自增
      curentTimer+=100;
      ///到5秒后停止
      if (curentTimer >= 5000) {
        _timer.cancel();
      }
      setState(() {});
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
        title: Text("倒计时"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              ///层叠布局将进度与文字叠在一起
              Stack(
                ///子Widget居中
                alignment: Alignment.center,
                children: [
                  ///圆形进度
                  CircularProgressIndicator(
                    ///当前指示的进度 0.0 -1.0
                    value: curentTimer / 5000,
                  ),
                  ///显示的文本
                  Text("${(curentTimer/1000).toInt()}"),
                ],
              )
            ],
          )),
    );
  }
}
