import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code22/main_data2203.dart
///
class ConstrainedBoxPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State  {

  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///页面的主体
  buildBody1() {

//    BoxConstraints.tight(Size size)，它可以生成给定大小的限制,也就是指定宽与高
//    BoxConstraints.expand(double width, double height,)生成一个尽可能大的用以填充另一个容器的BoxConstraints
//    BoxConstraints.loose(size) 生成一个限定最大宽度与最大高度的BoxConstraints
//    BoxConstraints.tightFor( {double width, double height})创建需要给定宽度或高度的框约束，这里限定的是最小宽度与最小高度，与tightForFinite的区别是这里的width与height默认是null
//    BoxConstraints.tightForFinite( {double width = double.infinity, double height = double.infinity})创建需要给定宽度或高度的框约束，这里限定的是最小宽度与最小高度，与tightFor的区别是这里的width与height默认是double.infinity
//
    return Scaffold(
      appBar: AppBar(
        title: Text("ConstrainedBox"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [

          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 50, maxWidth: 200),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 100, maxWidth: 300),
              child: Container(height: 200, width: 200, color: Colors.blue),
            ),
          )
      ],),),
    );
  }
}
