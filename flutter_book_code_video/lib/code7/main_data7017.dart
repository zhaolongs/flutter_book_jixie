import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code7/main_data7017.dart
///BackButton
class PopupMenuButton2Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code7/main_data7017.dart
//实现类似微信首页右上角的小弹框
class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupMenuButton"),
        actions: [
          ///创建小弹框
          IconButton(icon: Icon(Icons.add),onPressed: (){
            clickFunction();
          },),
        ],
      ),
      backgroundColor: Colors.white,
      ///填充布局
      body: Center(child: Text("小弹框"),)
    );
  }
  //lib/code7/main_data7017.dart
  ///弹出弹框是一个异步过程
  void clickFunction() async{
    ///获取当前视图的宽度
    double screenWidget = MediaQuery.of(context).size.width;
    ///获取当前状态栏的高度
    double stateHeight = MediaQueryData.fromWindow(window).padding.top;
    ///获取当前APPBar的高度
    double appBarHeight  = kToolbarHeight;
    ///显示小弹框
    final result = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(screenWidget-100,stateHeight+appBarHeight, 10.0, 100.0),
        items: <PopupMenuItem<String>>[
          PopupMenuItem<String>(
            child: Text("文本一"),
            value: "value1",
          ),
          PopupMenuItem<String>(
            child: Text("文本二"),
            value: "value1",
          ),
          PopupMenuItem<String>(
            child: Text("文本三"),
            value: "value1",
          ),
        ] );
  }
}
