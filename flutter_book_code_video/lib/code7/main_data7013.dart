import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button_rote.dart';

//lib/code7/main_data7013.dart
///向上弹出菜单页主体页面
class FloatingActionButton9Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<FloatingActionButton9Page> {
  @override
  Widget build(BuildContext context) {
    ///定义菜单按钮选项
    List<Icon> iconList = [
      Icon(Icons.add),
      Icon(Icons.save),
      Icon(Icons.share),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("悬浮按钮"),
      ),
      backgroundColor: Colors.white,
      ///填充屏幕空间
      body: ConstrainedBox(constraints: BoxConstraints.expand(), child: Stack(
        children: [
          ///向上弹出的按钮组件
          RoteFloatingButton(
            ///子菜单按钮选项
              iconList:iconList,
            ////子菜单按钮的点击事件回调
            clickCallback: (int index){
                print("点击了按钮$index");
            },),
        ],
      )),
    );
  }
}
