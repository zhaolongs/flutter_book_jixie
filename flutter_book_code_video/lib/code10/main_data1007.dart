import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1007.dart
///  Column线性布局的基本使用
class ColumnMain1Page extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {


  List<Container> itemList = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      itemList.add(
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 28,
          color: Colors.grey[800],
          margin: EdgeInsets.all(10),
          child: Text(
            "线性布局",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("线性布局"),
        ),
        body: Container(
          //灰色背景
          color: Colors.grey,
          //创建 Column  实现 Column 中子布局的垂直（竖直）排列
          child: Column(
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
