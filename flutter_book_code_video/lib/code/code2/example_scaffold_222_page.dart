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
///lib/code/code2/example_scaffold_207_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//应用入口 
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example222(),
  ));
}

///代码清单 2-22
///lib/code/code2/example_scaffold_222_page.dart
class Example222 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}
class _ExampleState extends State<Example222> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //页面的头部
      appBar: AppBar(title: Text("测试FAB"),),
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: Center(child: Text("这里是body"),),
      //悬浮按钮
      floatingActionButton: buildFAB(),);
  }

  ///代码清单 2-22
  ///lib/code/code2/example_scaffold_222_page.dart
  //FloatingActionButton的类型 extended类型
  //通过 FloatingActionButton.extended方式来创建悬浮按钮
  FloatingActionButton buildFAB() {
    return FloatingActionButton.extended(
      //通过icon来配制显示的图标
      icon: Icon(Icons.add), onPressed: () {
      print("点击了悬浮按钮");
    },
      //通过labe来添加文本信息
      label: Text("测试文本"),);
  }

}

