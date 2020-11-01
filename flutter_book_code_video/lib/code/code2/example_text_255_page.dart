
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///

///代码清单 2-16
///lib/code/code2/example_scaffold_216_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'custom_tab.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example255(),
  ));
}

///代码清单 2-55
///lib/code/code2/example_appbar_255_page.dart
class Example255 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example255> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //标题
      appBar: AppBar(
        title: Text("Text"),
      ),
      //页面的主内容区
      body: Container(
        //宽度填充父布局
        width: double.infinity,
        child: Column(children: [
          buildText4(),
          buildText5(),
          buildText6(),
        ],),
      ),
    );
  }

  Text buildText() {
    return Text(
      "执剑天涯，从你的点滴积累开始，所及之处，必精益求精",
      //文字在开始方向对齐
      textAlign: TextAlign.start,
      //文字方向从左向右
      textDirection: TextDirection.rtl,
    );
  }

  Text buildText2() {
    return Text(
      "执剑天涯，从你的点滴积累开始，所及之处，必精益求精",
      //文字在开始方向对齐
      textAlign: TextAlign.start,
      //文字方向从左向右
      textDirection: TextDirection.ltr,
    );
  }

  Text buildText3() {
    return Text(
      "Sometimes the thing you're searching  for your whole life, it's right there by your side all along.",
      //文字在开始方向对齐
      textAlign: TextAlign.justify,
      //文字方向从左向右
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 25),
    );
  }

  Widget buildText4() {
    return Container(
      width: 300,
      child: Text(
        "Sometimes the thing you're searching  for your whole life, it's right there by your side all along.",
        style: TextStyle(fontSize: 25),
        //设置是否自动换行  默认为true 自动换行
        //设置为 false 不会自动换行
        softWrap:false,
        //设置超出的部分使用省略号
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
  Widget buildText5() {
    return Container(
      width: 300,
      child: Text(
        "Sometimes the thing you're searching  for your whole life, it's right there by your side all along.",
        style: TextStyle(fontSize: 25),
        //设置是否自动换行  默认为true 自动换行
        //设置为 false 不会自动换行
        softWrap:false,
        overflow: TextOverflow.fade,
      ),
    );
  }
  Widget buildText6() {
    return Container(
      width: 300,
      child: Text(
        "Sometimes the thing you're searching  for your whole life, it's right there by your side all along.",
        style: TextStyle(fontSize: 25),
        //设置是否自动换行  默认为true 自动换行
        //设置为 false 不会自动换行
        softWrap:false,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
