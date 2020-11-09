import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example303(),
  ));
}

///代码清单 3-3 Column Row 父布局大小限制
///lib/code/code3/example_303_column_page.dart
class Example303 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example303> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局"),
      ),
      //水平排列
      body: Container(
        width: 400,
        height: 200,
       // child: buildRow(),
        child: buildColumn(),
      ),
    );
  }

  Row buildRow() {
    return Row(
      children: [
        RaisedButton(onPressed: () {  },child: Text("A"),),
        OutlineButton(onPressed: () {  },child: Text("B"),),
        ElevatedButton(onPressed: () {  },child: Text("C"),),
      ],
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        Text("从你的点滴积累开始"),
        Text("所及之处"),
        Text("必精益求精"),
      ],
    );
  }
}
