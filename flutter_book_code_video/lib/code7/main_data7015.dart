import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code7/main_data7009.dart
///BackButton
class BackButtonPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code7/main_data7009.dart
///heroTag 动画标签heroTag
class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("悬浮按钮"),
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        BackButton(
          ///配置按钮返回箭头的颜色
          color: Colors.blue,
          //返回按钮的点击事件
          onPressed: () {},
        ),

        SizedBox(height: 60,),
          CloseButton(
            ///配置关闭按钮的的颜色
            color: Colors.blue,
            //返回按钮的点击事件
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
