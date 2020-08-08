
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code7/main_data7007.dart
///FloatingActionButton
class FloatingActionButton2Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
//lib/code7/main_data7007.dart
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
  //lib/code7/main_data7007.dart
  ///FloatingActionButton的 迷你模式配置
  buildNormalFloatButton1(){
    return FloatingActionButton(
        ///值为true时为迷你模式
        mini: true,
        ///shrinkWrap值下button大小为40x40
        ///padded值下button大小为48x48
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Icon(Icons.add),
        tooltip: '这是悬浮按钮的tip',
        onPressed: () {});
  }
}
