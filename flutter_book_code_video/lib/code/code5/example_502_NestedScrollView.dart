import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragscalewidget/flutterdragscalewidget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021502098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example502(),
  ));
}

///代码清单 5-6 NestedScrollView 的基本使用
///lib/code/code5/example_502_NestedScrollView.dart
class Example502 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example502> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NestedScrollView"),
      ),
      body: NestedScrollView(
        //配置可折叠的头布局
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text("标题"),
              //标题居中
              centerTitle: true,
            )
          ];
        },
        //超出显示内容区域的Widget
        body: Container(
          alignment: Alignment.center,
          color: Colors.grey,
          height: 1600,
          child: Text("测试数据"),
        ),
      ),
    );
  }
}
