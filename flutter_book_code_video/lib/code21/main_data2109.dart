import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2109.dart
///  绘制 嵌套矩形
class DRRectReactPage extends StatefulWidget {
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
        title: Text("Canvas 绘制嵌套矩形"),
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
                  size: Size(300,300),
//                child: XOYPage(),
                painter: RectPainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//lib/code20/main_data2109.dart
///  绘制嵌套矩形
class RectPainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue //画笔颜色
    ..style= PaintingStyle.stroke //画笔style为填充
    ..strokeWidth = 4.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    //绘制两个矩形
    Rect rect1 = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 60.0);
    Rect rect2 = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 40.0);

    //分别绘制外部圆角矩形和内部的圆角矩形
    RRect outer = RRect.fromRectAndRadius(rect1, Radius.circular(10.0));
    RRect inner = RRect.fromRectAndRadius(rect2, Radius.circular(10.0));

    ///绘制嵌套矩形
    canvas.drawDRRect(outer,inner, _paint)

    ///创建外层圆角矩形
//    RRect rect = RRect.fromLTRBXY(20, 40, 260, 200,60,40);
//    ///创建内层圆角矩形
//    RRect rect2 =RRect.fromLTRBXY(30, 40, 200, 150,60,40);
//    ///绘制嵌套矩形
//    canvas.drawDRRect(rect,rect2, _paint);
;

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  //lib/code20/main_data2109.dart
  ///创建嵌套矩形方式一
  RRect buildRect1(){
    ///根据以画板左上角为坐标系圆点，分别设置上下左右四个方向距离来创建矩形
    ///left,  top,  right, bottom
    ///最后两个参数来设置圆角的大小
    return RRect.fromLTRBXY(20, 40, 250, 200,60,40);
  }

  //lib/code20/main_data2109.dart
  ///创建嵌套矩形方式二
  RRect buildRect2(){
    ///根据以画板左上角为坐标系圆点，分别设置上下左右四个方向距离来创建矩形
    ///left,  top,  right, bottom
    ///最后一个参数为Radius类型，用来设置圆角的大小
    ///return RRect.fromLTRBR(20, 40, 250, 200,Radius.circular(40));
    return RRect.fromLTRBR(20, 40, 250, 200,Radius.circular(40));
  }

  //lib/code20/main_data2109.dart
  ///创建嵌套矩形方式3
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
