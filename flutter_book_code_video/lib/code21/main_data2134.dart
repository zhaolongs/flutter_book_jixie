import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code20/main_data2103.dart
///  XOY二维 坐标轴
class DashLinePainterPage extends StatefulWidget {
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
        title: Text("XOY二维 坐标轴"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey[300],
              width: 400,
              height: 400,
              child: CustomPaint(
                size: Size(300, 300),
                painter: DashLinePainter(progress: 0.2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class DashLinePainter extends CustomPainter {
  final double progress;

  DashLinePainter({this.progress});

  Paint _paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width * progress, size.height / 2);

    Path dashPath = Path();

    double dashWidth = 10.0;
    double dashSpace = 5.0;
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }
    canvas.drawPath(dashPath, _paint);
  }

  @override
  bool shouldRepaint(DashLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }

}
