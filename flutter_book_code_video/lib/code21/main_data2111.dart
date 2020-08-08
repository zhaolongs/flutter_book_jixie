import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2111.dart
///  绘制 椭圆
class OvalPage extends StatefulWidget {
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
        title: Text("Canvas 绘制椭圆"),
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

//lib/code20/main_data2111.dart
///  绘制椭圆
class RectPainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue
    ..style= PaintingStyle.stroke
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {

    //用Rect构建一个边长50,中心点坐标为100,100的矩形
    Rect rect = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 40.0);
    //绘制椭圆
    canvas.drawOval(rect, _paint);

    ///使用两个对角点来创建width为150 height为100的矩形
    Rect rect2 = Rect.fromPoints(Offset(200,50), Offset(350,150));
    //绘制椭圆
    canvas.drawOval(rect2, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }



}
