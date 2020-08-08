import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2112.dart
///  绘制 路径
class PathPage extends StatefulWidget {
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
        title: Text("Canvas 绘制路径"),
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

//lib/code20/main_data2112.dart
///  绘制路径
class RectPainter extends CustomPainter {
  //lib/code20/main_data2112.dart
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue
    ..style= PaintingStyle.stroke
//    ..strokeCap=StrokeCap.round
    ..strokeJoin=StrokeJoin.round
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {


    canvasConicToFunction(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  //lib/code20/main_data2112.dart
  ///conicTo方法绘制二阶贝塞尔曲线绘制弧线
  canvasConicToFunction(Canvas canvas){
    _paint.strokeWidth = 1.0;
    ///将画笔的起点移动到点 A点(0,100)
    Path path = new Path()..moveTo(0.0, 100.0);

    ///从A点绘制三阶曲线到B(200,50)点
    ///控制点1为 A1(50.0, 50.0)
    ///控制点2为 A1(150.0, 50.0)
    path.cubicTo(50.0, 50.0, 150.0, 50.0, 200.0, 50.0);
    ///从A点绘制三阶曲线到C(250.0, 100.0)点
    ///控制点1为 B2(250.0, 50.0)
    ///控制点2为 C1(250.0, 100.0)
    path.cubicTo(250.0, 50.0, 250.0, 100.0, 250.0, 100.0);
    _paint.color = Colors.blue;
    ///绘制路径
    canvas.drawPath(path, _paint);
  }

  ///arcTo方法绘制二阶贝塞尔曲线绘制弧线
  ///正弦函数曲线效果
  canvasArcToSinFunction(Canvas canvas){
    ///将画笔的起点移动到点(0,200)
    Path path = new Path()..moveTo(0.0, 150.0);
    ///创建一个矩形
    Rect rect = Rect.fromCircle(center: Offset(50.0, 150.0), radius: 50.0);
    Rect rect2= Rect.fromCircle(center: Offset(150.0, 150.0), radius: 50.0);
    Rect rect3= Rect.fromCircle(center: Offset(250.0, 150.0), radius: 50.0);
    Rect rect4= Rect.fromCircle(center: Offset(350.0, 150.0), radius: 50.0);
//    _paint.color = Colors.grey;
//    _paint.strokeWidth = 1.0;
//    canvas.drawRect(rect, _paint);
//    canvas.drawRect(rect2, _paint);
//    canvas.drawRect(rect3, _paint);
//    canvas.drawRect(rect4, _paint);
    ///构建180度的弧度
    ///这个弧度参照的圆是上述创建的矩形Rect的内切圆
    path.arcTo(rect, 0.0, pi, true);
    path.arcTo(rect2, 0.0, -pi, true);
    path.arcTo(rect3, 0.0, pi, true);
    path.arcTo(rect4, 0.0, -pi, true);
    _paint.strokeWidth = 4.0;
    _paint.color = Colors.blue;
    ///绘制路径
    canvas.drawPath(path, _paint);
  }

  ///arcTo方法绘制二阶贝塞尔曲线绘制弧线
  canvasArcToFunction(Canvas canvas){
    ///将画笔的起点移动到点(50,50)
    Path path = new Path()..moveTo(50.0, 50.0);
    ///创建一个矩形
    Rect rect = Rect.fromCircle(center: Offset(200.0, 200.0), radius: 60.0);
    _paint.color = Colors.grey;
    _paint.strokeWidth = 1.0;
    canvas.drawRect(rect, _paint);
    ///构建180度的弧度
    ///这个弧度参照的圆是上述创建的矩形Rect的内切圆
    path.arcTo(rect, 0.0, pi, true);
    _paint.strokeWidth = 4.0;
    _paint.color = Colors.blue;
    ///绘制路径
    canvas.drawPath(path, _paint);
  }

  ///lineTo方法绘制直线
  canvasLineToFunction(Canvas canvas){
    ///创建路径
    Path path = new Path();
    ///移动到点(50,50)
    path.moveTo(50, 50);
    ///绘制到点()100,100
    path.lineTo(100, 100);
    //绘制路径
    canvas.drawPath(path, _paint);
  }

  ///relativeLineTo方法绘制直线
  canvasRelativeLineToFunction(Canvas canvas){
    ///创建路径
    Path path = new Path();
    ///移动到点(50,50)
    path.moveTo(50, 50);
    ///绘制到点()100,100
    path.relativeLineTo(100, 100);
    //绘制路径
    canvas.drawPath(path, _paint);
  }

  ///lineTo方法绘制三角形
  canvasLineToCloseFunction(Canvas canvas){
    _paint.strokeJoin=StrokeJoin.bevel;
    ///创建路径
    Path path = new Path();
    ///移动到点(50,50)
    path.moveTo(50, 50);
    ///绘制到点(100,100)
    path.lineTo(100, 100);
    ///绘制到点(100,100)
    path.lineTo(150, 50);
    //闭合
    path.close();
    //绘制路径
    canvas.drawPath(path, _paint);
  }

}
