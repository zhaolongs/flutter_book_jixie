
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//lib/code7/main_data7008.dart
///FloatingActionButton
class FloatingActionButton3Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
//lib/code7/main_data7008.dart
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
  //lib/code7/main_data7008.dart
  ///FloatingActionButton的 shape边框样式
  buildNormalFloatButton1(){
    return FloatingActionButton(
        ///设置圆角矩形
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
         shape: BeveledRectangleBorder(
           ///边框样式
             side: BorderSide(width: 2,color: Colors.red),
             ///边框角度
             borderRadius: BorderRadius.all(Radius.circular(10))),
        //设置为抗锯齿
        clipBehavior: Clip.antiAlias,
        child: Icon(Icons.add),
        tooltip: '这是悬浮按钮的tip',
        onPressed: () {});
  }
}
