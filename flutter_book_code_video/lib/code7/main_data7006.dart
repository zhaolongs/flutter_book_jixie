import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code7/main_data7006.dart
///FloatingActionButton
class FloatingActionButtonPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
//lib/code7/main_data7006.dart
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
      floatingActionButton: buildNormalFloatButton3(),
    );
  }
  //lib/code7/main_data7006.dart
  ///FloatingActionButton的颜色配置
  buildNormalFloatButton3(){
    return FloatingActionButton(
        backgroundColor:Colors.grey ,
        foregroundColor: Colors.red,
        child: Icon(Icons.add),
        tooltip: '这是悬浮按钮的tip',
        onPressed: () {});
  }

  //lib/code7/main_data7006.dart
  ///FloatingActionButton的阴影配置
  buildNormalFloatButton2(){
    return FloatingActionButton(
        elevation: 6.0,
        highlightElevation: 12.0,
        child: Icon(Icons.add),
        tooltip: '这是悬浮按钮的tip',
        onPressed: () {});
  }

  buildNormalFloatButton(){
    return FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: '这是悬浮按钮的tip',
        onPressed: () {});
  }
}
