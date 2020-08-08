import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/5.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

/// LinearProgressIndicator的基本使用
class CircularProgressIndicatorPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<CircularProgressIndicatorPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: CircularProgressIndicator(
            value: 50,
            strokeWidth: 1,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      ),
    );
  }

}