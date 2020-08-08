import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data21054.dart
///  绘制 直线
class CanvasdrawLinePage extends StatefulWidget {
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
        title: Text("Canvas 绘制直线"),
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
                painter: LinePainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//lib/code20/main_data21054.dart
///  绘制直线
class LinePainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue //画笔颜色
    ..strokeWidth = 4.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    ///定义点
    Offset p1=Offset(20,40);
    Offset p2 = Offset(160,40);
    ///绘制线
    canvas.drawLine(p1, p2, _paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}
