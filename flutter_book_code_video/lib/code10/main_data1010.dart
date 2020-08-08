import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1010.dart
///  Column线性布局 verticalDirection
class ColumnMain3Page extends StatefulWidget {
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
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
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
