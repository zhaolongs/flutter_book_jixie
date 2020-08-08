import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1013.dart
///  Column 线性布局 填充父布局与包裹子Widget
class ColumnMain6Page extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//lib/code10/main_data1013.dart
//Column 线性布局 填充父布局与包裹子Widget
class _MyHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("线性布局 填充与包裹"),
        ),
        body: Container(
          width: 200,
          height: 200,
          color: Colors.grey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
               Container(width: 120,height: 42,color: Colors.grey[300],),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
