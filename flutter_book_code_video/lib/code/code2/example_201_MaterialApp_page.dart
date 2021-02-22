import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///代码清单2-1
///lib/code/code2/example_201_MaterialApp_page.dart
//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example201(),
  ));
}

class Example201 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',//安卓任务栏中的应用标题
      theme: ThemeData(//使用的应用主题
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //默认显示的首页面
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text("测试页面"),
    );
  }
}
