//3.2.1 /lib/code2/main_data24.dart
//FloatingActionButton的类型 regular类型

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
      floatingActionButton: buildFAB1());
  }



//通过new Object方式来创建悬浮按钮 为regular类型
  FloatingActionButton buildFAB1(){
    return FloatingActionButton(
      //一般建议使用Icon
      child: Icon(Icons.add), onPressed: () {
      print("点击了悬浮按钮");
    },);
  }

//3.2.1 FloatingActionButton的类型 mini类型
//通过new Object方式来创建悬浮按钮 为mini类型
  FloatingActionButton buildFAB2() {
    return FloatingActionButton(
      //一般建议使用Icon
      child: Icon(Icons.add), onPressed: () {
      print("点击了悬浮按钮");
    },
      //默认是false
      mini: true,);
  }

  //通过 FloatingActionButton.extended方式来创建悬浮按钮
  FloatingActionButton buildFAB3() {
    return FloatingActionButton.extended(
      //通过icon来配制显示的图标
      icon: Icon(Icons.add), onPressed: () {
      print("点击了悬浮按钮");
    },
      //通过labe来添加文本信息
      label: Text("添加信息"),);
  }

  //3.2.2 /lib/code2/main_data24.dart
//FloatingActionButton的常用属性使用分析
  FloatingActionButton buildFAB4(){
    return FloatingActionButton(
      child: Icon(Icons.add), onPressed: () {
      print("点击了悬浮按钮");
    },
      tooltip: "这里是FAB哈！",
    );
  }




}
