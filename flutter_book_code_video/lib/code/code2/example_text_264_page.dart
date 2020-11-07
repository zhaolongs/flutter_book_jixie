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
    home: Example264(),
  ));
}

///代码清单 2-64
///lib/code/code2/example_appbar_264_page.dart
class Example264 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example264> {
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
        child: Column(
          children: [
            buildText(),
          ],
        ),
      ),
    );
  }

  Widget buildText() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        "执剑天涯",
        style: TextStyle(
          fontSize: 36,
          //设置下划线
          decoration: TextDecoration.underline,
          //配置删除线为红色
          decorationColor: Colors.red,
          //虚线样式
          decorationStyle: TextDecorationStyle.wavy,
          //加粗
          decorationThickness: 2,

        ),
      ),
    );
  }
}
