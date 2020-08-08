import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code7/main_data7010.dart
///FloatingActionButton
class FloatingActionButton6Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code7/main_data7010.dart
///FloatingActionButton的基本使用
class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("悬浮按钮"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text("哈哈"),
      ),

      ///右下角的悬浮按钮
      floatingActionButton: buildNormalFloatButton1(),
    );
  }

  //lib/code7/main_data7010.dart
  ///FloatingActionButton的 标签样式的按钮
  buildNormalFloatButton1() {
    return FloatingActionButton.extended(
      ///显示图标
        icon: Icon(Icons.add),
      ///显示标签
      label: Text('文本一'),
      ///点击事件
      onPressed: () {},);
  }
}
