import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2108.dart
///  绘制 圆角矩形
class DrawRReactPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///页面的主体
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas 绘制圆角矩形"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.grey[300],
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: CustomPaint(
                size: Size(200, 100),
//                child: XOYPage(),
                foregroundPainter: RectPainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//lib/code20/main_data2108.dart
///  绘制圆角矩形
class RectPainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue //画笔颜色
    ..style= PaintingStyle.fill //画笔style为填充
    ..strokeWidth = 4.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    ///创建圆角矩形
    RRect rect = buildRect3();
    ///绘制圆角矩形
    canvas.drawRRect(rect, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  /*
  RRect.fromLTRBXY 前四个参数用来绘制矩形位置，剩余两个参数绘制固定 x/y 弧度；
RRect.fromLTRBR 前四个参数用来绘制矩形位置，最后一个参数绘制 Radius 弧度；
RRect.fromLTRBAndCorners 前四个参数用来绘制矩形位置，剩余四个可选择参数，根据需求设置四个角 Radius 弧度，可不同；
RRect.fromRectXY 第一个参数绘制矩形，可以用上面介绍的多种矩形绘制方式，剩余两个参数绘制固定 x/y 弧度；
RRect.fromRectAndRadius 第一个参数绘制矩形，可以用上面介绍的多种矩形绘制方式，最后一个参数绘制 Radius 弧度；
RRect.fromRectAndCorners第一个参数绘制矩形，可以用上面介绍的多种矩形绘制方式，剩余四个可选择参数，根据需求设置四个角 Radius 弧度，最为灵活。
   */
  //lib/code20/main_data2108.dart
  ///创建圆角矩形方式一
  RRect buildRect1(){
    ///根据以画板左上角为坐标系圆点，分别设置上下左右四个方向距离来创建矩形
    ///left,  top,  right, bottom
    ///最后两个参数来设置圆角的大小
    return RRect.fromLTRBXY(20, 40, 250, 200,60,40);
  }

  //lib/code20/main_data2108.dart
  ///创建圆角矩形方式二
  RRect buildRect2(){
    ///根据以画板左上角为坐标系圆点，分别设置上下左右四个方向距离来创建矩形
    ///left,  top,  right, bottom
    ///最后一个参数为Radius类型，用来设置圆角的大小
    ///return RRect.fromLTRBR(20, 40, 250, 200,Radius.circular(40));
    return RRect.fromLTRBR(20, 40, 250, 200,Radius.circular(40));
  }

  //lib/code20/main_data2108.dart
  ///创建圆角矩形方式3
  RRect buildRect3() {
    ////根据以画板左上角为坐标系圆点，分别设置上下左右四个方向距离来创建矩形
    ///前四个参数分别为 left,  top,  right, bottom，用来创建矩形
    return RRect.fromLTRBAndCorners(20, 40, 250, 200,
      ///左上角的圆角
      topLeft: Radius.circular(10),
      ///右上角的圆角
      topRight: Radius.circular(20),
      ///左正角的圆角
      bottomLeft: Radius.circular(30),
      ///右下角的圆角
      bottomRight: Radius.circular(40),);
  }


}
