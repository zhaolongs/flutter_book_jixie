import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

///代码清单 2-16
///lib/code/code2/example_207_scaffold_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/painting.dart';

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
      //安卓任务栏中的应用标题
      title: 'Flutter Demo',

      //使用的应用主题
      theme: ThemeData(
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