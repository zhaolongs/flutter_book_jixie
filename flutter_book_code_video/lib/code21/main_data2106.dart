import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2106.dart
///  绘制 弧或者饼
class DrawArcPage extends StatefulWidget {
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
        title: Text("Canvas 绘制弧或者饼"),
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
                painter: LinePainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//lib/code20/main_data2106.dart
///  绘制弧或者饼
class LinePainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue //画笔颜色
    ..strokeWidth = 4.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {

    _paint.style=PaintingStyle.stroke;
    _paint.strokeWidth=1.0;
    ///创建矩形
    Rect rect = Rect.fromLTRB(40, 40, 300, 200);
    ///绘制矩形
    canvas.drawRect(rect, _paint);

    _paint.strokeWidth=4.0;
    _paint.color = Colors.red;
    _paint.style=PaintingStyle.fill;
    ///绘制弧
    ///参数一 参考的矩形范围
    ///参数二 绘制弧的开始弧度，这里配置的为0，水平向右
    ///参数三 绘制弧的结束弧度，
    ///参数四 是否连接圆心
    canvas.drawArc(rect, 0, 2, true,_paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}
