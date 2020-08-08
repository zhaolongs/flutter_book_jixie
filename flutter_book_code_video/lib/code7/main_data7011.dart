import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code7/main_data7011.dart
///FloatingActionButton
class FloatingActionButton7Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code7/main_data7011.dart
///FloatingActionButton 类似闲鱼发布按钮效果
class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("悬浮按钮"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text("哈哈"),
      ),
      ///底部菜单栏
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 13,
        unselectedFontSize: 12,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('发布')),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('设置')),
        ],
      ),
      ///悬浮按钮的模式
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ///右下角的悬浮按钮
      floatingActionButton: FloatingActionButton(
        ///显示图标
        child: Icon(Icons.add),
        ///点击事件
        onPressed: () {},
      ),
    );
  }
}
