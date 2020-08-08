import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2104.dart
///  绘制点drawPoints
class CanvasdrawPointsPage extends StatefulWidget {
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
        title: Text("Canvas 绘制点"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.grey[300],
              width: 200,
              height: 100,
              child: CustomPaint(
                size: Size(200, 100),
                painter: PointPainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//lib/code20/main_data2104.dart
///  绘制点 drawPoints
class PointPainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.stroke //绘画风格，默认为填充
    ..strokeWidth = 10.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    ///绘制点
    canvas.drawPoints(
        PointMode.points,
        [
          Offset(0.0, 0.0),
          Offset(60.0, 10.0),
          Offset(50.0, 50.0),
          Offset(90.0, 90.0),
          Offset(190.0, 60.0),
        ],
        _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
