import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data2129.dart
///   层叠布局
class StackMain1Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
//lib/code10/main_data2129.dart
///Stack层叠布局的基本使用
class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局"),
      ),
      //通过ConstrainedBox来确保Stack占满屏幕
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              child: Text("文本一", style: TextStyle(color: Colors.white)),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              child: Text("文本二", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
