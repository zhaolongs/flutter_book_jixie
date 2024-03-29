import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example301(),
  ));
}

///代码清单 3-1 Column 的基本使用
///lib/code/code3/example_301_column_page.dart
class Example301 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example301> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局"),
      ),
      //垂直排列
      body: buildColumn1(),
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

  Column buildColumn1() {
    return Column(
      //主轴内容包裹
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("从你的点滴积累开始"),
        Text("所及之处"),
        Text("必精益求精"),
      ],
    );
  }
}
