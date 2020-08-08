import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1012.dart
///  Column 线性布局 子Widget的高度等比例分配
class ColumnMain5Page extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//lib/code10/main_data1012.dart
//Column 线性布局 子Widget的高度等比例分配
class _MyHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("线性布局 权重"),
        ),
        body: Container(
          width:MediaQuery.of(context).size.width,
          //灰色背景
          color: Colors.grey,
          //lib/code10/main_data1012.dart
          ///  Column线性布局 子Widget的高度等比例分配
          child: Column(
            children: <Widget>[
              ///区域一的内容
              Expanded(flex:1,child: Container(alignment:Alignment.center,child: Text("文本二"),color: Colors.grey[500],),),
              ///区域二的内容
              Expanded(flex:1,child: Container(alignment:Alignment.center,child: Text("文本二"),color: Colors.grey[500],),),
              ///区域二的内容
              Expanded(flex:1,child: Container(alignment:Alignment.center,child: Text("文本二"),color: Colors.grey[500],),),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
