import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1014.dart
///  Row线性布局 verticalDirection
class RowMain1Page extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("线性布局 Row"),
        ),
        body: Container(
          //灰色背景
          color: Colors.grey,
          //创建 Row  实现 Row 中子布局的垂直（竖直）排列
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text("文本一"),
              Text("文本二"),
              Text("文本三"),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
