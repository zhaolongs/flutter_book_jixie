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
///lib/code/code2/example_scaffold_207_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'custom_tab.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example245(),
  ));
}


///代码清单 2-45
///lib/code/code2/example_appbar_245_page.dart
class Example245 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example245>{

  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //页面的头部
      appBar: AppBar(
        //左侧按钮
        leading: IconButton(icon: Icon(Icons.close),onPressed: (){},),
        //中间显示的内容
        title: Text("这里是title"),
        // title 内容居中
        centerTitle: true,
        //右侧显示的内容
        actions: [
          IconButton(icon: Icon(Icons.share),onPressed: (){},),
          IconButton(icon: Icon(Icons.message),onPressed: (){},),
          IconButton(icon: Icon(Icons.more_horiz_outlined),onPressed: (){},),
        ],
      ),
      //页面的主内容区
      body: Center(child:Text("测试页面")),
    );
  }
}
