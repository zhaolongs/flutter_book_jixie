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
import 'package:flutter/painting.dart';

import 'custom_tab.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example252(),
  ));
}

///代码清单 2-52
///lib/code/code2/example_appbar_252_page.dart
class Example252 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example252> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //标题
      appBar: AppBar(
        title: Text("AppBar"),
        bottom: buildAppBarTitle(),
        //标题居中
        centerTitle: true,
      ),
      //页面的主内容区
      body: Center(
        child: Text("这里是body"),
      ),
    );
  }

  //构建TabBar
  PreferredSize buildAppBarTitle() {
    //PreferredSize
    return PreferredSize(
      //bottom的高度设置
      preferredSize: Size.fromHeight(44),
      //bottom的子widget
      child: Container(
        color: Colors.white,
        height: 44,
        child: Row(
          //子布局居中
          mainAxisAlignment: MainAxisAlignment.center,
          //两个子木筏，
          children: [
            Text("测试标签1"),
            //SizedBox 这里可理解为是用来填充空间的
            SizedBox(
              width: 20,
            ),
            Text("测试标签2"),
          ],
        ),
      ),
    );
  }
}
