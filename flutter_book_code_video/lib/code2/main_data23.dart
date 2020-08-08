//2.3 /lib/code2/main_data23.dart
//Scaffold 悬浮按钮
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//应用入口 
main() => runApp(themDataFunction());

MaterialApp themDataFunction() {
  return MaterialApp(home: FirstPage(),);
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstThemState();
  }
}
class FirstThemState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //页面的头部
      appBar: AppBar(title: Text("标题"),),
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: Center(child: Text("显示日期"),),
      //悬浮按钮
      floatingActionButton: FloatingActionButton(
        //一般建议使用Icon
        child: Icon(Icons.add), onPressed: () {
        print("点击了悬浮按钮");
      },),);
  }
}
