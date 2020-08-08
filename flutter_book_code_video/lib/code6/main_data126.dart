import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code18/main_data125.dart
///AnimatedContainer 的基本使用
class AnimatedContainerPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ClipRectPageState();
  }
}

class ClipRectPageState extends State {
  var _colors = [
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.blue,
    Colors.deepPurple
  ];

  var _alignments = [
    Alignment.center,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];

  double _weight = 400;
  double _height = 400;

  int index = 0;
  next() {
    setState(() {
      if(_weight == 400){
        _weight -= 100;
        _height -= 100;
      }else {
        _weight += 100;
        _height += 100;
      }
      index = Random().nextInt(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("ClipRect基本使用"),
      ),
      body: Center(
        child: GestureDetector(	// 手势识别控件，用来写点击事件
          onTap: (){
            setState(() {
              next();
            });
          },
          child: AnimatedContainer(	// AnimatedContainer控件
            width: _weight,	//设置上变量里的宽高
            height: _height,
            curve: Curves.fastOutSlowIn,	// 设置插值属性
            duration: Duration(milliseconds: 500),	// 设置时间
            color: _colors[index],	//设置颜色
            alignment: _alignments[index],	// 设置位置
            child: Icon(Icons.face)
          ),
        ),
      ),
    );
  }
}
