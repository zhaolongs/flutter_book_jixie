import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2110.dart
///  绘制 圆形
class DRCirclePage extends StatefulWidget {
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
        title: Text("Canvas 绘制圆形"),
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

//lib/code20/main_data2110.dart
///  绘制圆形
class RectPainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue
    ..style= PaintingStyle.stroke
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    ///参数一指定的圆形位置
    ///参数二指定的半径大小
//    canvas.drawCircle(Offset(100,100), 40, _paint);


    //用Rect构建一个边长50,中心点坐标为100,100的矩形
    Rect rect = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 40.0);
    //根据上面的矩形,构建一个圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(40.0));
    //绘制圆角矩形
    canvas.drawRRect(rrect, _paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }



}
