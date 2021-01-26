import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example807(),
  ));
}

class Example807 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("绘制圆角矩形"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //创建画板
        child: CustomPaint(
          //指定画布大小
          size: Size(400, 400),
          painter: RRectPainter(),
        ),
      ),
    );
  }
}

/// 代码清单 8-10 绘制圆角矩形
/// lib/code/code8/example_807_RRect.dart
class RRectPainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
    //画笔颜色
    ..color = Colors.red
    //画笔的宽度
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3.0;

  @override
  void paint(Canvas canvas, Size size) {
    //创建圆角矩形
    RRect rect = buildRect3();
    //绘制
    canvas.drawRRect(rect, _paint);
  }

//创建圆角矩形方式一
  RRect buildRect1() {
    //根据以画板左上角为坐标系圆点，分别设置上下左右四个方向距离来创建矩形
    //left,  top,  right, bottom
    //最后两个参数来设置圆角的大小
    return RRect.fromLTRBXY(20, 40, 250, 200, 60, 40);
  }

  //创建圆角矩形方式二
  RRect buildRect2() {
    //根据以画板左上角为坐标系圆点，分别设置上下左右四个方向距离来创建矩形
    //left,  top,  right, bottom
    //最后一个参数为Radius类型，用来设置圆角的大小
    return RRect.fromLTRBR(20, 40, 250, 200, Radius.circular(40));
  }

  //创建圆角矩形方式三
  RRect buildRect3() {
    //根据以画板左上角为坐标系圆点，分别设置上下左右四个方向距离来创建矩形
    //前四个参数分别为 left,  top,  right, bottom，用来创建矩形
    return RRect.fromLTRBAndCorners(
      20, 40, 250, 200,
      //左上角的圆角
      topLeft: Radius.circular(10),
      //右上角的圆角
      topRight: Radius.circular(20),
      //左正角的圆角
      bottomLeft: Radius.circular(30),
      //右下角的圆角
      bottomRight: Radius.circular(40),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
