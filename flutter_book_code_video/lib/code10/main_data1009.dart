import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1009.dart
///  Column线性布局的对齐方式
class ColumnMain2Page extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("线性布局"),
        ),
        body: Container(
           width: 400,
          //灰色背景
          color: Colors.grey,
          //创建 Column  实现 Column 中子布局的垂直（竖直）排列
          child: Column(
            ///设置所有的子widget开始位置对齐
            mainAxisAlignment:MainAxisAlignment.start ,
            ///次轴方向开始位置对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            ///配置文字方向
            textDirection: TextDirection.rtl,
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
