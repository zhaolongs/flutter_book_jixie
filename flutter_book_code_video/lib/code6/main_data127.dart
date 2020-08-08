import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code18/main_data127.dart
///ConstrainedBox 的基本使用
class ConstrainedBoxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConstrainedBoxState();
  }
}
///lib/code18/main_data127.dart
///ConstrainedBox 的基本使用
class _ConstrainedBoxState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("ConstrainedBox 基本使用"),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints(
              //宽度尽可能大
              minWidth: double.infinity,
              //最小高度为50像素
              minHeight: 50.0),
          child: Container(
            height: 5.0,
            color: Colors.deepOrange,
          ),
        ));
  }
}
