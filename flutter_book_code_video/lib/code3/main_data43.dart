//4.1.1 /lib/code3/main_data43.dart
//4.1.1线性布局Row在属性title中的使用
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//4.1.1 /lib/code3/main_data43.dart
//线性布局Row在属性title中的使用
///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: TabFromRowTestPage(),
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              ///配置AppBar中title的文字样式
              textTheme: TextTheme(
                headline6: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),),
            ),),));

class TabFromRowTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPagetate();
  }
}

class FirstPagetate extends State<TabFromRowTestPage> {
  @override
  Widget build(BuildContext context) {
    ///Scaffold 用来搭建页面的主体结构
    return Scaffold(
      ///标题
      appBar: AppBar(title: buildAppBarTitle2(),centerTitle: true,),
      ///页面的主内容区
      body: Center(child: Text("首页面"),),);
  }
  //lib/code3/main_data43.dart
  Row buildAppBarTitle() {
    //Row为线性布局，它可以使子Widget在水平方向线性排列
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///左侧标签容器
        Container(
          ///设置内边距
          padding: EdgeInsets.only(left: 20, top: 6, bottom: 6, right: 10),
          ///设置文字显示
          child: Text("推荐"),
          ///设置圆角边框
          decoration: BoxDecoration(color: Colors.white,
              ///分别设置边框的边框圆角
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4))),),

        ///右侧标签容器
        Container(
          padding: EdgeInsets.only(left: 10, top: 6, bottom: 6, right: 20),
          child: Text("专栏"),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4))),),
      ],
    );
  }

  Row buildAppBarTitle2() {
    //Row为线性布局，它可以使子Widget在水平方向线性排列
    return Row(
      //水平方向填充
      mainAxisSize: MainAxisSize.max,
      //水平方向子Widget居中
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ///容器
        Container(
          ///设置内边距
          padding: EdgeInsets.only(left: 20, top: 6, bottom: 6, right: 10),
          ///设置文字显示
          child: Text("推荐"),
          ///设置圆角边框
          decoration: BoxDecoration(color: Colors.white,
              ///分别设置边框的上下左右四个角的圆角
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4))),),
        Container(
          padding: EdgeInsets.only(left: 10, top: 6, bottom: 6, right: 20),
          child: Text("专栏"),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4))),),
      ],
    );
  }
}
