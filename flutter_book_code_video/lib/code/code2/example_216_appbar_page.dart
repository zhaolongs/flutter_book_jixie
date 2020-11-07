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


//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example216(),
  ));
}


///代码清单 2-32 AppBar的基本使用
///lib/code/code2/example_216_appbar_page.dart
class Example216 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example216>{

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
