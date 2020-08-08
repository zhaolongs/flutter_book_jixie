import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1008.dart
///  Row 线性布局的基本使用
class RowMainPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/**
 * 水平方向 排列三个 widget
 */
class _MyHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("线性布局"),
        ),
        //Container 普通容器，这里为设置背景使用
        body: Container(
          color: Colors.grey,
          //创建 Row,实现 Row 中子布局水平排列
          child: Row(
            children: <Widget>[
              Container(
                child: Text(
                  "线性布局",
                  style: TextStyle(color: Colors.white),
                ),
                //内边距 上下左右
                padding: EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 5.0, bottom: 5.0),
                //外边距 上下左右
                margin: EdgeInsets.all(10.0),
                color: Color(0xFF666666),
              ),
              Container(
                child: Text(
                  "线性布局",
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 5.0, bottom: 5.0),
                margin: EdgeInsets.all(10.0),
                color: Color(0xFF666666),
              ),
              Container(
                child: Text(
                  "线性布局",
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 5.0, bottom: 5.0),
                margin: EdgeInsets.all(10.0),
                color: Color(0xFF666666),
              )
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
