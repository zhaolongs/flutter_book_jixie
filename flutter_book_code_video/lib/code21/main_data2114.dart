import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2114.dart
///  绘制 颜色
class DrawColorPage extends StatefulWidget {
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
        title: Text("Canvas drawColor"),
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

//lib/code20/main_data2114.dart
///  绘制路径
class RectPainter extends CustomPainter {
  //lib/code20/main_data2114.dart
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue
    ..style= PaintingStyle.fill
//    ..strokeCap=StrokeCap.round
    ..strokeJoin=StrokeJoin.round
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {

    ///绘制背景
    canvas.drawColor(Colors.red, BlendMode.screen);

   _paint.style= PaintingStyle.fill;
  ///绘制矩形
    canvas.drawRect(Rect.fromCircle(center:Offset(100,100),radius: 50), _paint);

    canvasConicToFunction(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  //lib/code20/main_data2114.dart
  ///conicTo方法绘制二阶贝塞尔曲线绘制弧线
  canvasConicToFunction(Canvas canvas){
    _paint.strokeWidth = 1.0;

  }

}
