import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragscalewidget/flutterdragscalewidget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021503098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example503(),
  ));
}

///代码清单 5-11 CustomScrollView 的基本使用
///lib/code/code5/example_504_CustomScrollView.dart
class Example503 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example503> {

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomScrollView"),
      ),
      body: CustomScrollView(
        //滑动控制器
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: Text("标题"),
            //标题居中
            centerTitle: true,
          )
        ],
      ),
    );
  } //Sl

}
