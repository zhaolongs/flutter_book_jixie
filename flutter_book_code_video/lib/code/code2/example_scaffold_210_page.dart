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


//应用入口 
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example210(),
  ));
}

///代码清单 2-18
///lib/code/code2/example_scaffold_210_page.dart
class Example210 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}
class _ExampleState extends State<Example210> {


  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //左侧侧拉页面
      drawer:buildDrawer() ,
      //右侧侧拉页面
      endDrawer: buildDrawer(),
      //页面的头部
      appBar: AppBar(title: Text("标题"),),
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: Center(child: Text("body内容区域"),),
    );
  }


  //封装方法来构建 Widget 代码块
  Container buildDrawer(){
    //Container可看做是一个容器，用来包裹一些Widget
    return Container(
      //背景颜色
      color: Colors.white,
      width: 200,
      //Column可以让子Widgt在垂直方向线性排列
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: 200,
            child: Text("这是一个Text"),),
          Container(
            color: Colors.red,
            height: 200,
            child: Text("这是一个Text2"),),
        ],
      ),
    );
  }
}


