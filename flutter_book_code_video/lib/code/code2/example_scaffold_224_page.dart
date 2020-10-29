import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///

///代码清单 2-16
///lib/code/code2/example_scaffold_216_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//应用入口 
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example224(),
  ));
}


class Example224 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}
class _ExampleState extends State<Example224> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //页面的头部
      appBar: AppBar(title: Text("测试FAB"),),
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: Center(child: Text("这里是body"),),
      //悬浮按钮
      floatingActionButton: buildFAB(),);
  }

  ///代码清单 2-24
  ///lib/code/code2/example_scaffold_224_page.dart
  FloatingActionButton buildFAB() {
    return FloatingActionButton(
      //通过child来配制显示的图标
      child: Icon(Icons.add),
      onPressed: () {
        print("点击了悬浮按钮");
      },
      tooltip: "这里是FAB哈！",
      //背景色为灰色
      backgroundColor: Colors.grey,
      //点击水波纹颜色为黄色
      splashColor: Colors.yellow,
      //前景色为紫色
      foregroundColor: Colors.deepPurple,
    );
  }

}

