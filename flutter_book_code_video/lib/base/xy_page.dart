import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XOYPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _XOYPageState();
  }
}

class _XOYPageState extends State {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(300, 300),
      painter: XOYPainter(),
    );
  }
}

class XOYPainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    ..strokeWidth = 2.0; //画笔的宽度

  ///绘制的坐标内边距
  EdgeInsets padding =
      EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30);

  ///定义x轴的坐标刻度的个数
  int xNumber = 10;

  ///定义y轴的坐标刻度的个数
  int yNumber = 10;

  @override
  void paint(Canvas canvas, Size size) {
    ///绘制X轴
    drawXLine(canvas, size);

    ///绘制Y轴
    drawYLine(canvas, size);

    ///绘制坐标原点
    drawOriginPoint(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  ///7 /lib/code20/main_data2103.dart
  ///  XOY二维 坐标轴 绘制X轴
  void drawXLine(Canvas canvas, Size size) {
    _paint.color = Colors.blue;

    ///x轴起时点
    Offset startXOffest = Offset(padding.left, padding.top);

    ///x轴终点
    Offset endXOffest = Offset(size.width - padding.right, padding.top);

    ///绘制x轴
    canvas.drawLine(startXOffest, endXOffest, _paint);

    ///绘制x轴向右的箭头
    canvas.drawLine(
        Offset(endXOffest.dx - 10, endXOffest.dy - 10), endXOffest, _paint);
    canvas.drawLine(
        Offset(endXOffest.dx - 10, endXOffest.dy + 10), endXOffest, _paint);

    _paint.color = Colors.red;

    ///计算x轴的有效长度
    double xLength = endXOffest.dx - startXOffest.dx;

    ///每个坐标的长度
    double xUnitLength = xLength / xNumber;

    ///绘制x轴刻度
    for (int i = 1; i < xNumber; i++) {
      ///每个刻度的开始点的x坐标
      double startX = (xUnitLength * i).toDouble();
      //绘制竖直的刻度
      canvas.drawLine(Offset(startX, endXOffest.dy - 5),
          Offset(startX, endXOffest.dy + 5), _paint);
    }
  }

  ///7 /lib/code20/main_data2103.dart
  ///  XOY二维 坐标轴 绘制Y轴
  void drawYLine(Canvas canvas, Size size) {
    _paint.color = Colors.blue;

    ///y轴的起点
    Offset startYOffest = Offset(padding.left, padding.top);
    //y轴的终点
    Offset endYOffest = Offset(padding.left, size.height - padding.bottom);

    ///绘制y轴
    canvas.drawLine(startYOffest, endYOffest, _paint);

    ///绘制y轴向下的箭头
    canvas.drawLine(
        Offset(endYOffest.dx - 10, endYOffest.dy - 10), endYOffest, _paint);
    canvas.drawLine(
        Offset(endYOffest.dx + 10, endYOffest.dy - 10), endYOffest, _paint);

    //绘制y轴横向的刻度
    _paint.color = Colors.red;

    ///计算y轴的长度
    double yLength = endYOffest.dy - startYOffest.dy;

    ///y轴每个刻度的长房
    double yUnitLength = yLength / yNumber;

    ///绘制y轴刻度
    for (int i = 1; i < yNumber; i++) {
      double startY = (yUnitLength * i).toDouble();

      ///对于轴上的刻度来讲，
      canvas.drawLine(Offset(startYOffest.dx - 5, startY),
          Offset(startYOffest.dx + 5, startY), _paint);
    }
  }

  ///7 /lib/code20/main_data2103.dart
  ///  XOY二维 坐标轴 绘制原点
  void drawOriginPoint(Canvas canvas, Size size) {
    ///绘制原点
    _paint.strokeWidth = _paint.strokeWidth * 4;
    canvas.drawPoints(
        PointMode.points, [Offset(padding.left, padding.top)], _paint);
  }
}
