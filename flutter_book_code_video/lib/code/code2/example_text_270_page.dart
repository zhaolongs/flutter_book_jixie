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
///lib/code/code2/example_207_scaffold_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'custom_tab.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example270(),
  ));
}

class Example270 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example270> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("Text文本样式"),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(children: [
          buildText(),
        ]),
      ),
    );
  }

  ///代码清单 2-71
  ///lib/code/code2/example_appbar_270_page.dart
  Text buildText() {
    return Text(
      "UniTortred 字体",
      style: TextStyle(
          //文字的大小
          fontSize: 25,
          //引用圆滑的自定义字体
          fontFamily: "UniTortred"),
    );
  }
}
