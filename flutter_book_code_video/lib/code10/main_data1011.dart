import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1011.dart
///  Column线性布局 权重
class ColumnMain4Page extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//创建 Column  实现 Column 中子布局的垂直（竖直）排列
//lib/code10/main_data1011.dart
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
          ///  Column线性布局 权重
          child: Column(
            children: <Widget>[
              ///区域一的内容
              Container(alignment:Alignment.center,height: 55,child: Text("文本一"),color: Colors.grey[300],),
              ///区域二的mwwp
              Expanded(child: Container(alignment:Alignment.center,child: Text("文本二"),color: Colors.grey[500],),)
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
